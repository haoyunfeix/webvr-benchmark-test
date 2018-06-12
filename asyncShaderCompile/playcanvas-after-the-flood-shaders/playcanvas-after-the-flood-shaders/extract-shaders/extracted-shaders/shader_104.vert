#version 300 es
out vec4 vVertexColor;
out vec3 vPositionW;
out vec3 vNormalW;
out vec2 vUv0;
out vec2 vUv1;
layout(location=0) in vec3 vertex_position;
layout(location=1) in vec3 vertex_normal;
layout(location=2) in vec2 vertex_texCoord0;
layout(location=3) in vec2 vertex_texCoord1;
layout(location=7) in vec4 vertex_color;
uniform mat4 matrix_viewProjection;
uniform mat4 matrix_model;
uniform mat3 matrix_normal;
uniform vec3 treeSize;
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
  tmpvar_4 = ((treeSize * 0.0254) / 0.3048);
  vec3 tmpvar_5;
  tmpvar_5.x = fract(vertex_texCoord1.x);
  tmpvar_5.y = fract((vertex_texCoord1.x * 256.0));
  tmpvar_5.z = fract((vertex_texCoord1.x * 65536.0));
  vec3 tmpvar_6;
  tmpvar_6 = (tmpvar_5 - vec3(0.5, 0.5, 0.0));
  vec3 tmpvar_7;
  tmpvar_7.x = fract(vertex_texCoord1.y);
  tmpvar_7.y = fract((vertex_texCoord1.y * 256.0));
  tmpvar_7.z = fract((vertex_texCoord1.y * 65536.0));
  vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 - vec3(0.5, 0.5, 0.0));
  vec3 tmpvar_9;
  tmpvar_9 = normalize(((vertex_color.xyz * 2.0) - 1.0));
  vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_6 - tmpvar_8));
  vec3 tmpvar_11;
  tmpvar_11 = normalize(((tmpvar_9.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_9.zxy * vec3(0.0, 1.0, 0.0))));
  mat3 tmpvar_12;
  tmpvar_12[uint(0)] = tmpvar_11;
  tmpvar_12[1u] = normalize(((tmpvar_9.yzx * tmpvar_11.zxy) - (tmpvar_9.zxy * tmpvar_11.yzx)));
  tmpvar_12[2u] = tmpvar_9;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((tmpvar_10.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_10.zxy * vec3(0.0, 1.0, 0.0))));
  mat3 tmpvar_14;
  tmpvar_14[uint(0)] = tmpvar_13;
  tmpvar_14[1u] = normalize(((tmpvar_10.yzx * tmpvar_13.zxy) - (tmpvar_10.zxy * tmpvar_13.yzx)));
  tmpvar_14[2u] = tmpvar_10;
  float tmpvar_15;
  tmpvar_15 = sqrt(dot (tmpvar_6, tmpvar_6));
  if ((tmpvar_15 > 0.03)) {
    vec3 pos_16;
    vec3 parentPos_17;
    parentPos_17 = (tmpvar_6 * tmpvar_4);
    pos_16 = (pos_1 - parentPos_17);
    float tmpvar_18;
    tmpvar_18 = clamp ((sqrt(
      dot (pos_16, pos_16)
    ) / 3.5), 0.0, 1.0);
    pos_16 = (pos_16 * tmpvar_12);
    float tmpvar_19;
    tmpvar_19 = abs(cos((globalTime +
      dot (parentPos_17, vec3(1.0, 1.0, 1.0))
    )));
    float pRotation_20;
    pRotation_20 = (((0.05 *
      ((tmpvar_19 * tmpvar_19) * (3.0 - (2.0 * tmpvar_19)))
    ) * tmpvar_18) * windAmplitude);
    float tmpvar_21;
    tmpvar_21 = cos(pRotation_20);
    float tmpvar_22;
    tmpvar_22 = sin(pRotation_20);
    mat2 tmpvar_23;
    tmpvar_23[uint(0)].x = tmpvar_21;
    tmpvar_23[uint(0)].y = -(tmpvar_22);
    tmpvar_23[1u].x = tmpvar_22;
    tmpvar_23[1u].y = tmpvar_21;
    pos_16.yz = (tmpvar_23 * pos_16.yz);
    pos_16 = (tmpvar_12 * pos_16);
    pos_16 = (pos_16 + parentPos_17);
    pos_1 = pos_16;
  };
  float tmpvar_24;
  tmpvar_24 = sqrt(dot (tmpvar_8, tmpvar_8));
  if ((tmpvar_24 > 0.03)) {
    vec3 pos_25;
    vec3 parentPos_26;
    parentPos_26 = (tmpvar_8 * tmpvar_4);
    pos_25 = (pos_1 - parentPos_26);
    float tmpvar_27;
    tmpvar_27 = clamp ((sqrt(
      dot (pos_25, pos_25)
    ) / 3.5), 0.0, 1.0);
    pos_25 = (pos_25 * tmpvar_14);
    float tmpvar_28;
    tmpvar_28 = abs(cos((globalTime +
      dot (parentPos_26, vec3(1.0, 1.0, 1.0))
    )));
    float pRotation_29;
    pRotation_29 = (((0.05 *
      ((tmpvar_28 * tmpvar_28) * (3.0 - (2.0 * tmpvar_28)))
    ) * tmpvar_27) * windAmplitude);
    float tmpvar_30;
    tmpvar_30 = cos(pRotation_29);
    float tmpvar_31;
    tmpvar_31 = sin(pRotation_29);
    mat2 tmpvar_32;
    tmpvar_32[uint(0)].x = tmpvar_30;
    tmpvar_32[uint(0)].y = -(tmpvar_31);
    tmpvar_32[1u].x = tmpvar_31;
    tmpvar_32[1u].y = tmpvar_30;
    pos_25.yz = (tmpvar_32 * pos_25.yz);
    pos_25 = (tmpvar_14 * pos_25);
    pos_25 = (pos_25 + parentPos_26);
    pos_1 = pos_25;
  };
  vec3 pos_33;
  pos_33.x = pos_1.x;
  float pRotation_34;
  pRotation_34 = ((0.035 * cos(globalTime)) * clamp ((pos_1.z / 16.0), 0.0, 1.0));
  float tmpvar_35;
  tmpvar_35 = cos(pRotation_34);
  float tmpvar_36;
  tmpvar_36 = sin(pRotation_34);
  mat2 tmpvar_37;
  tmpvar_37[uint(0)].x = tmpvar_35;
  tmpvar_37[uint(0)].y = -(tmpvar_36);
  tmpvar_37[1u].x = tmpvar_36;
  tmpvar_37[1u].y = tmpvar_35;
  pos_33.yz = (tmpvar_37 * pos_1.yz);
  pos_1 = pos_33;
  testVec = tmpvar_6;
  vec4 tmpvar_38;
  tmpvar_38.w = 1.0;
  tmpvar_38.xyz = pos_33;
  vec4 tmpvar_39;
  tmpvar_39 = (matrix_model * tmpvar_38);
  gl_Position = (matrix_viewProjection * tmpvar_39);
  vPositionW = tmpvar_39.xyz;
  vNormalW = normalize((matrix_normal * vertex_normal));
  vUv0 = vertex_texCoord0;
  vUv1 = vertex_texCoord1;
  vVertexColor = vertex_color;
  vPositionW.x += 0.592077796171615;
}



