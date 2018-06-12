#version 300 es
out vec3 vPositionW;
out vec2 vUv0;
layout(location=0) in vec3 vertex_position;
layout(location=2) in vec2 vertex_texCoord0;
uniform mat4 matrix_viewProjection;
uniform mat4 matrix_model;
uniform vec3 view_position;
uniform float material_opacity;
out float vFade;
void main ()
{
  mat3 rotMat_1;
  vec3 lookX_2;
  vec4 posW_3;
  vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = vertex_position;
  posW_3.w = (matrix_model * tmpvar_4).w;
  vec3 tmpvar_5;
  tmpvar_5.x = matrix_model[3].x;
  tmpvar_5.y = matrix_model[3].y;
  tmpvar_5.z = matrix_model[3].z;
  vec3 tmpvar_6;
  tmpvar_6.x = matrix_model[2].x;
  tmpvar_6.y = matrix_model[2].y;
  tmpvar_6.z = matrix_model[2].z;
  vec3 tmpvar_7;
  tmpvar_7 = normalize(tmpvar_6);
  vec3 tmpvar_8;
  tmpvar_8 = normalize((view_position - tmpvar_5));
  vec3 tmpvar_9;
  tmpvar_9.x = matrix_model[0].x;
  tmpvar_9.y = matrix_model[0].y;
  tmpvar_9.z = matrix_model[0].z;
  lookX_2 = (normalize((
    (tmpvar_7.yzx * tmpvar_8.zxy)
   -
    (tmpvar_7.zxy * tmpvar_8.yzx)
  )) * sqrt(dot (tmpvar_9, tmpvar_9)));
  mat3 tmpvar_10;
  tmpvar_10[uint(0)] = matrix_model[uint(0)].xyz;
  tmpvar_10[1u] = matrix_model[1u].xyz;
  tmpvar_10[2u] = matrix_model[2u].xyz;
  rotMat_1 = tmpvar_10;
  vec3 tmpvar_11;
  tmpvar_11.yz = tmpvar_10[0].yz;
  tmpvar_11.x = lookX_2.x;
  rotMat_1[0] = tmpvar_11;
  vec3 tmpvar_12;
  tmpvar_12.xz = rotMat_1[0].xz;
  tmpvar_12.y = lookX_2.y;
  rotMat_1[0] = tmpvar_12;
  vec3 tmpvar_13;
  tmpvar_13.xy = rotMat_1[0].xy;
  tmpvar_13.z = lookX_2.z;
  rotMat_1[0] = tmpvar_13;
  vec3 tmpvar_14;
  tmpvar_14.yz = rotMat_1[1].yz;
  tmpvar_14.x = tmpvar_8.x;
  rotMat_1[1] = tmpvar_14;
  vec3 tmpvar_15;
  tmpvar_15.xz = rotMat_1[1].xz;
  tmpvar_15.y = tmpvar_8.y;
  rotMat_1[1] = tmpvar_15;
  vec3 tmpvar_16;
  tmpvar_16.xy = rotMat_1[1].xy;
  tmpvar_16.z = tmpvar_8.z;
  rotMat_1[1] = tmpvar_16;
  posW_3.xyz = ((rotMat_1 * vertex_position) + tmpvar_5);
  vFade = (1.0 - abs(dot (tmpvar_7,
    -(normalize((view_position - posW_3.xyz)))
  )));
  vFade = (vFade * (vFade * material_opacity));
  gl_Position = (matrix_viewProjection * posW_3);
  vPositionW = posW_3.xyz;
  vUv0 = vertex_texCoord0;
  vPositionW.x += 0.5308450218361551;
}



