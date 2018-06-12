#version 300 es
out vec3 vPositionW;
out vec3 vNormalW;
out vec2 vUv1;
layout(location=0) in vec3 vertex_position;
layout(location=1) in vec3 vertex_normal;
layout(location=3) in vec2 vertex_texCoord1;
uniform mat4 matrix_model;
uniform mat3 matrix_normal;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = vertex_position;
  highp vec4 tmpvar_2;
  tmpvar_2.zw = vec2(0.5, 1.0);
  tmpvar_2.xy = ((vertex_texCoord1 * 2.0) - 1.0);
  gl_Position = tmpvar_2;
  vPositionW = (matrix_model * tmpvar_1).xyz;
  vNormalW = normalize((matrix_normal * vertex_normal));
  vUv1 = vertex_texCoord1;
  vPositionW.x += 0.2927033926167988;
}



