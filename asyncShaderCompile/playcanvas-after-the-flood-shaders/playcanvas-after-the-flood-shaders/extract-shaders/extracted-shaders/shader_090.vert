#version 300 es
out vec4 vVertexColor;
out vec3 vPositionW;
out vec3 vNormalW;
out vec2 vUv0;
layout(location=0) in vec3 vertex_position;
layout(location=1) in vec3 vertex_normal;
layout(location=2) in vec2 vertex_texCoord0;
layout(location=7) in vec4 vertex_color;
uniform mat4 matrix_viewProjection;
uniform mat4 matrix_model;
uniform mat3 matrix_normal;
uniform float globalTime;
uniform float isLeaves;
uniform float windAmplitude;
out vec3 testVec;
void main ()
{
  vec3 pos_1;
  pos_1 = vertex_position;
  if ((isLeaves > 0.5)) {
    vec4 tmpvar_2;
    tmpvar_2 = abs(((
      fract((((
        (fract(((globalTime +
          dot (vertex_position, vec3(1.0, 1.0, 1.0))
        ) * vec4(1.975, 0.793, 0.375, 0.193))) * 2.0)
       - vec4(1.0, 1.0, 1.0, 1.0)) * 0.1) + 0.5))
     * 2.0) - 1.0));
    vec4 tmpvar_3;
    tmpvar_3 = ((tmpvar_2 * tmpvar_2) * (3.0 - (2.0 * tmpvar_2)));
    pos_1 = (vertex_position + ((
      (tmpvar_3.xz + tmpvar_3.yw)
    .xxy * vertex_normal) * vertex_texCoord0.y));
  };
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((vertex_color.xyz * 2.0) - 1.0));
  vec3 tmpvar_5;
  tmpvar_5 = normalize(((tmpvar_4.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_4.zxy * vec3(0.0, 1.0, 0.0))));
  mat3 tmpvar_6;
  tmpvar_6[uint(0)] = tmpvar_5;
  tmpvar_6[1u] = normalize(((tmpvar_4.yzx * tmpvar_5.zxy) - (tmpvar_4.zxy * tmpvar_5.yzx)));
  tmpvar_6[2u] = tmpvar_4;
  vec3 pos_7;
  pos_7 = (pos_1 * tmpvar_6);
  float tmpvar_8;
  tmpvar_8 = abs(cos((globalTime +
    dot (((tmpvar_4 * 3.0) + matrix_model[3].xyz), vec3(1.0, 1.0, 1.0))
  )));
  float pRotation_9;
  pRotation_9 = (((0.05 *
    ((tmpvar_8 * tmpvar_8) * (3.0 - (2.0 * tmpvar_8)))
  ) * clamp (
    (sqrt(dot (pos_1, pos_1)) / 3.5)
  , 0.0, 1.0)) * windAmplitude);
  float tmpvar_10;
  tmpvar_10 = cos(pRotation_9);
  float tmpvar_11;
  tmpvar_11 = sin(pRotation_9);
  mat2 tmpvar_12;
  tmpvar_12[uint(0)].x = tmpvar_10;
  tmpvar_12[uint(0)].y = -(tmpvar_11);
  tmpvar_12[1u].x = tmpvar_11;
  tmpvar_12[1u].y = tmpvar_10;
  pos_7.yz = (tmpvar_12 * pos_7.yz);
  pos_7 = (tmpvar_6 * pos_7);
  pos_1 = pos_7;
  testVec = pos_7;
  vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = pos_7;
  vec4 tmpvar_14;
  tmpvar_14 = (matrix_model * tmpvar_13);
  gl_Position = (matrix_viewProjection * tmpvar_14);
  vPositionW = tmpvar_14.xyz;
  vNormalW = normalize((matrix_normal * vertex_normal));
  vUv0 = vertex_texCoord0;
  vVertexColor = vertex_color;
  vPositionW.x += 0.2707272923362456;
}



