#version 300 es
out vec3 vPositionW;
out vec3 vNormalW;
out vec2 vUv0;
layout(location=0) in vec3 vertex_position;
layout(location=1) in vec3 vertex_normal;
layout(location=2) in vec2 vertex_texCoord0;
uniform mat4 matrix_viewProjection;
uniform mat4 matrix_model;
uniform mat4 matrix_invModel;
uniform vec3 view_position;
out vec3 vPositionL;
out vec3 vPosCam;
void main ()
{
  vPositionL = vertex_position;
  vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = view_position;
  vPosCam = (matrix_invModel * tmpvar_1).xyz;
  vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = vertex_position;
  vec4 tmpvar_3;
  tmpvar_3 = (matrix_model * tmpvar_2);
  gl_Position = (matrix_viewProjection * tmpvar_3);
  vPositionW = tmpvar_3.xyz;
  vNormalW = vertex_normal;
  vUv0 = vertex_texCoord0;
  vPositionW.x += 0.2795956237207735;
}



