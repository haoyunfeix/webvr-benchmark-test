#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
in vec3 vNormalW;
in vec2 vUv1;
highp vec3 dDiffuseLight;
vec3 dLightDirW;
vec3 dShadowCoord;
highp float dAtten;
uniform vec3 light0_color;
uniform vec3 light0_position;
uniform float light0_radius;
uniform vec3 light0_direction;
uniform float light0_innerConeAngle;
uniform float light0_outerConeAngle;
uniform mat4 light0_shadowMatrix;
uniform vec4 light0_shadowParams;
uniform highp sampler2DShadow light0_shadowMap;
uniform sampler2D texture_lightMap;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(vNormalW);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture (texture_lightMap, vUv1);
  lowp vec3 tmpvar_3;
  tmpvar_3 = ((8.0 * tmpvar_2.w) * tmpvar_2.xyz);
  dDiffuseLight = (tmpvar_3 * tmpvar_3);
  dLightDirW = (vPositionW - light0_position);
  vec3 tmpvar_4;
  tmpvar_4 = normalize(dLightDirW);
  float falloff_5;
  float tmpvar_6;
  tmpvar_6 = dot (dLightDirW, dLightDirW);
  float tmpvar_7;
  tmpvar_7 = (1.0/(light0_radius));
  falloff_5 = ((1.0/((tmpvar_6 + 1.0))) * 16.0);
  float x_8;
  x_8 = (tmpvar_6 * (tmpvar_7 * tmpvar_7));
  float tmpvar_9;
  tmpvar_9 = clamp ((1.0 - (x_8 * x_8)), 0.0, 1.0);
  falloff_5 = (falloff_5 * (tmpvar_9 * tmpvar_9));
  dAtten = falloff_5;
  if ((falloff_5 > 1e-05)) {
    float tmpvar_10;
    tmpvar_10 = clamp (((
      dot (tmpvar_4, light0_direction)
     - light0_outerConeAngle) / (light0_innerConeAngle - light0_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_5 * (tmpvar_10 * (tmpvar_10 *
      (3.0 - (2.0 * tmpvar_10))
    )));
    dAtten = (dAtten * max (dot (tmpvar_1,
      -(tmpvar_4)
    ), 0.0));
    vec4 projPos_11;
    vec4 tmpvar_12;
    tmpvar_12.w = 1.0;
    tmpvar_12.xyz = (vPositionW + ((
      (vNormalW * light0_shadowParams.y)
     *
      clamp ((1.0 - dot (vNormalW, -(tmpvar_4))), 0.0, 1.0)
    ) * abs(
      dot ((vPositionW - light0_position), tmpvar_4)
    )));
    vec4 tmpvar_13;
    tmpvar_13 = (light0_shadowMatrix * tmpvar_12);
    projPos_11.zw = tmpvar_13.zw;
    projPos_11.xy = (tmpvar_13.xy / tmpvar_13.w);
    dShadowCoord.xy = projPos_11.xy;
    dShadowCoord.z = (tmpvar_13.z / tmpvar_13.w);
    float tmpvar_14;
    tmpvar_14 = (1.0/(light0_shadowParams.w));
    float tmpvar_15;
    tmpvar_15 = (tmpvar_14 / 1000.0);
    dShadowCoord.z = (-((
      ((2.0 * tmpvar_14) * tmpvar_15)
     /
      (tmpvar_14 - tmpvar_15)
    )) / (dShadowCoord.z - (
      (tmpvar_14 + tmpvar_15)
     /
      (tmpvar_14 - tmpvar_15)
    )));
    dShadowCoord.z = (dShadowCoord.z * light0_shadowParams.w);
    dShadowCoord.z = (dShadowCoord.z + (light0_shadowParams.z * 10.0));
    dShadowCoord.z = (dShadowCoord.z / light0_shadowParams.w);
    dShadowCoord.z = (((tmpvar_14 + tmpvar_15) / (tmpvar_14 - tmpvar_15)) - ((
      ((2.0 * tmpvar_14) * tmpvar_15)
     /
      (tmpvar_14 - tmpvar_15)
    ) / dShadowCoord.z));
    highp float sum_16;
    float v2_17;
    float v1_18;
    float v0_19;
    float u2_20;
    float u1_21;
    float u0_22;
    vec2 base_uv_23;
    float tmpvar_24;
    tmpvar_24 = (1.0/(light0_shadowParams.x));
    float tmpvar_25;
    tmpvar_25 = dShadowCoord.z;
    vec2 tmpvar_26;
    tmpvar_26 = (projPos_11.xy * light0_shadowParams.x);
    base_uv_23 = floor((tmpvar_26 + vec2(0.5, 0.5)));
    float tmpvar_27;
    tmpvar_27 = ((tmpvar_26.x + 0.5) - base_uv_23.x);
    float tmpvar_28;
    tmpvar_28 = ((tmpvar_26.y + 0.5) - base_uv_23.y);
    base_uv_23 = (base_uv_23 - vec2(0.5, 0.5));
    base_uv_23 = (base_uv_23 * tmpvar_24);
    float tmpvar_29;
    tmpvar_29 = (4.0 - (3.0 * tmpvar_27));
    float tmpvar_30;
    tmpvar_30 = (1.0 + (3.0 * tmpvar_27));
    float tmpvar_31;
    tmpvar_31 = (4.0 - (3.0 * tmpvar_28));
    float tmpvar_32;
    tmpvar_32 = (1.0 + (3.0 * tmpvar_28));
    u0_22 = (((
      (3.0 - (2.0 * tmpvar_27))
     / tmpvar_29) - 2.0) * tmpvar_24);
    v0_19 = (((
      (3.0 - (2.0 * tmpvar_28))
     / tmpvar_31) - 2.0) * tmpvar_24);
    u1_21 = (((3.0 + tmpvar_27) / 7.0) * tmpvar_24);
    v1_18 = (((3.0 + tmpvar_28) / 7.0) * tmpvar_24);
    u2_20 = (((tmpvar_27 / tmpvar_30) + 2.0) * tmpvar_24);
    v2_17 = (((tmpvar_28 / tmpvar_32) + 2.0) * tmpvar_24);
    vec3 tmpvar_33;
    tmpvar_33.x = (base_uv_23.x + u0_22);
    tmpvar_33.y = (base_uv_23.y + v0_19);
    tmpvar_33.z = tmpvar_25;
    sum_16 = ((tmpvar_29 * tmpvar_31) * texture (light0_shadowMap, tmpvar_33));
    vec3 tmpvar_34;
    tmpvar_34.x = (base_uv_23.x + u1_21);
    tmpvar_34.y = (base_uv_23.y + v0_19);
    tmpvar_34.z = tmpvar_25;
    sum_16 = (sum_16 + ((7.0 * tmpvar_31) * texture (light0_shadowMap, tmpvar_34)));
    vec3 tmpvar_35;
    tmpvar_35.x = (base_uv_23.x + u2_20);
    tmpvar_35.y = (base_uv_23.y + v0_19);
    tmpvar_35.z = tmpvar_25;
    sum_16 = (sum_16 + ((tmpvar_30 * tmpvar_31) * texture (light0_shadowMap, tmpvar_35)));
    vec3 tmpvar_36;
    tmpvar_36.x = (base_uv_23.x + u0_22);
    tmpvar_36.y = (base_uv_23.y + v1_18);
    tmpvar_36.z = tmpvar_25;
    sum_16 = (sum_16 + ((tmpvar_29 * 7.0) * texture (light0_shadowMap, tmpvar_36)));
    vec3 tmpvar_37;
    tmpvar_37.x = (base_uv_23.x + u1_21);
    tmpvar_37.y = (base_uv_23.y + v1_18);
    tmpvar_37.z = tmpvar_25;
    sum_16 = (sum_16 + (49.0 * texture (light0_shadowMap, tmpvar_37)));
    vec3 tmpvar_38;
    tmpvar_38.x = (base_uv_23.x + u2_20);
    tmpvar_38.y = (base_uv_23.y + v1_18);
    tmpvar_38.z = tmpvar_25;
    sum_16 = (sum_16 + ((tmpvar_30 * 7.0) * texture (light0_shadowMap, tmpvar_38)));
    vec3 tmpvar_39;
    tmpvar_39.x = (base_uv_23.x + u0_22);
    tmpvar_39.y = (base_uv_23.y + v2_17);
    tmpvar_39.z = tmpvar_25;
    sum_16 = (sum_16 + ((tmpvar_29 * tmpvar_32) * texture (light0_shadowMap, tmpvar_39)));
    vec3 tmpvar_40;
    tmpvar_40.x = (base_uv_23.x + u1_21);
    tmpvar_40.y = (base_uv_23.y + v2_17);
    tmpvar_40.z = tmpvar_25;
    sum_16 = (sum_16 + ((7.0 * tmpvar_32) * texture (light0_shadowMap, tmpvar_40)));
    vec3 tmpvar_41;
    tmpvar_41.x = (base_uv_23.x + u2_20);
    tmpvar_41.y = (base_uv_23.y + v2_17);
    tmpvar_41.z = tmpvar_25;
    sum_16 = (sum_16 + ((tmpvar_30 * tmpvar_32) * texture (light0_shadowMap, tmpvar_41)));
    sum_16 = (sum_16 * 0.006944444);
    highp float tmpvar_42;
    tmpvar_42 = pow (sum_16, 2.2);
    sum_16 = tmpvar_42;
    dAtten = (dAtten * tmpvar_42);
    dDiffuseLight = (dDiffuseLight + (dAtten * light0_color));
  };
  pc_fragColor.xyz = pow (dDiffuseLight, vec3(0.5, 0.5, 0.5));
  pc_fragColor.xyz = (pc_fragColor.xyz / 8.0);
  pc_fragColor.w = clamp (max (max (pc_fragColor.x, pc_fragColor.y), max (pc_fragColor.z, 0.003921569)), 0.0, 1.0);
  pc_fragColor.w = (ceil((pc_fragColor.w * 255.0)) / 255.0);
  pc_fragColor.xyz = (pc_fragColor.xyz / pc_fragColor.w);
  pc_fragColor.x += 0.22955112925969123;
}



