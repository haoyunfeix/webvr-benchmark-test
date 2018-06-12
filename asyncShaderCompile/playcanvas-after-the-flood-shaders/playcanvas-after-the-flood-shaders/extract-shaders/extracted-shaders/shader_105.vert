#version 300 es
out vec3 vPositionW;
out vec3 vNormalW;
out vec2 vUv0;
layout(location=0) in vec3 vertex_position;
layout(location=1) in vec3 vertex_normal;
layout(location=2) in vec2 vertex_texCoord0;
uniform mat4 matrix_viewProjection;
uniform mat4 matrix_model;
uniform mat3 matrix_normal;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = vertex_position;
  vec4 tmpvar_2;
  tmpvar_2 = (matrix_model * tmpvar_1);
  gl_Position = (matrix_viewProjection * tmpvar_2);
  vPositionW = tmpvar_2.xyz;
  vNormalW = normalize((matrix_normal * vertex_normal));
  vUv0 = vertex_texCoord0;
  vPositionW.x += 0.8218093350519353;
}



