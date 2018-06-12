#version 300 es
out vec3 vPositionW;
out vec3 vNormalW;
layout(location=0) in vec3 vertex_position;
layout(location=1) in vec3 vertex_normal;
uniform mat4 matrix_viewProjection;
uniform mat4 matrix_model;
uniform mat3 matrix_normal;
uniform float wirePixelScale;
uniform float WIRERADIUS;
out float wireFade;
void main ()
{
  vec4 posW_1;
  vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = vertex_position;
  vec4 tmpvar_3;
  tmpvar_3 = (matrix_model * tmpvar_2);
  posW_1.w = tmpvar_3.w;
  vec4 tmpvar_4;
  tmpvar_4.x = matrix_viewProjection[0].w;
  tmpvar_4.y = matrix_viewProjection[1].w;
  tmpvar_4.z = matrix_viewProjection[2].w;
  tmpvar_4.w = matrix_viewProjection[3].w;
  float tmpvar_5;
  tmpvar_5 = max (WIRERADIUS, (dot (tmpvar_4, tmpvar_3) * wirePixelScale));
  mat3 tmpvar_6;
  tmpvar_6[uint(0)] = matrix_model[uint(0)].xyz;
  tmpvar_6[1u] = matrix_model[1u].xyz;
  tmpvar_6[2u] = matrix_model[2u].xyz;
  posW_1.xyz = (tmpvar_3.xyz + ((tmpvar_5 - WIRERADIUS) * normalize(
    (tmpvar_6 * vertex_normal)
  )));
  wireFade = (WIRERADIUS / tmpvar_5);
  gl_Position = (matrix_viewProjection * posW_1);
  vPositionW = posW_1.xyz;
  vNormalW = normalize((matrix_normal * vertex_normal));
  vPositionW.x += 0.759784252387389;
}



