#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
in vec3 vNormalW;
in vec3 vTangentW;
in vec3 vBinormalW;
in vec2 vUv0;
uniform vec3 view_position;
lowp vec3 dNormalW;
lowp vec3 dDiffuseLight;
vec3 dLightDirW;
lowp float dAtten;
uniform vec3 light0_color;
uniform vec3 light0_position;
uniform float light0_radius;
uniform vec3 light0_direction;
uniform float light0_innerConeAngle;
uniform float light0_outerConeAngle;
uniform vec3 light1_color;
uniform vec3 light1_position;
uniform float light1_radius;
uniform vec3 light1_direction;
uniform float light1_innerConeAngle;
uniform float light1_outerConeAngle;
uniform vec3 light2_color;
uniform vec3 light2_position;
uniform float light2_radius;
uniform vec3 light2_direction;
uniform float light2_innerConeAngle;
uniform float light2_outerConeAngle;
uniform mat4 light2_shadowMatrix;
uniform vec4 light2_shadowParams;
uniform sampler2D light2_shadowMap;
uniform sampler2D texture_normalMap;
uniform float material_bumpiness;
uniform vec3 fog_color;
uniform float fog_density;
uniform float skyboxIntensity;
uniform sampler2D texture_diffuseMap;
uniform vec3 material_emissive;
uniform lowp samplerCube texture_prefilteredCubeMap4;
void main ()
{
  dDiffuseLight = vec3(0.0, 0.0, 0.0);
  mat3 tmpvar_1;
  tmpvar_1[uint(0)] = normalize(vTangentW);
  tmpvar_1[1u] = normalize(vBinormalW);
  tmpvar_1[2u] = normalize(vNormalW);
  dNormalW = (tmpvar_1 * normalize(mix (vec3(0.0, 0.0, 1.0),
    ((texture (texture_normalMap, vUv0).xyz * 2.0) - 1.0)
  , material_bumpiness)));
  lowp vec4 rgba_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture (texture_diffuseMap, vUv0);
  rgba_2.w = tmpvar_3.w;
  rgba_2.xyz = pow (tmpvar_3.xyz, vec3(2.2, 2.2, 2.2));
  lowp vec3 fixedReflDir_4;
  lowp vec3 vec_5;
  vec_5 = dNormalW;
  lowp float tmpvar_6;
  tmpvar_6 = max (max (abs(dNormalW.x), abs(dNormalW.y)), abs(dNormalW.z));
  lowp float tmpvar_7;
  tmpvar_7 = abs(dNormalW.x);
  if ((tmpvar_7 != tmpvar_6)) {
    vec_5.x = (dNormalW.x * 0.75);
  };
  lowp float tmpvar_8;
  tmpvar_8 = abs(dNormalW.y);
  if ((tmpvar_8 != tmpvar_6)) {
    vec_5.y = (dNormalW.y * 0.75);
  };
  lowp float tmpvar_9;
  tmpvar_9 = abs(dNormalW.z);
  if ((tmpvar_9 != tmpvar_6)) {
    vec_5.z = (dNormalW.z * 0.75);
  };
  fixedReflDir_4.yz = vec_5.yz;
  fixedReflDir_4.x = -(vec_5.x);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (texture_prefilteredCubeMap4, fixedReflDir_4);
  lowp vec3 tmpvar_11;
  tmpvar_11 = ((8.0 * tmpvar_10.w) * tmpvar_10.xyz);
  dDiffuseLight = ((tmpvar_11 * tmpvar_11) * skyboxIntensity);
  dLightDirW = (vPositionW - light0_position);
  vec3 tmpvar_12;
  tmpvar_12 = normalize(dLightDirW);
  lowp float tmpvar_13;
  tmpvar_13 = max (((light0_radius -
    sqrt(dot (dLightDirW, dLightDirW))
  ) / light0_radius), 0.0);
  dAtten = tmpvar_13;
  if ((tmpvar_13 > 1e-05)) {
    float tmpvar_14;
    tmpvar_14 = clamp (((
      dot (tmpvar_12, light0_direction)
     - light0_outerConeAngle) / (light0_innerConeAngle - light0_outerConeAngle)), 0.0, 1.0);
    dAtten = (tmpvar_13 * (tmpvar_14 * (tmpvar_14 *
      (3.0 - (2.0 * tmpvar_14))
    )));
    dAtten = (dAtten * max (dot (dNormalW,
      -(tmpvar_12)
    ), 0.0));
    dDiffuseLight = (dDiffuseLight + (dAtten * light0_color));
  };
  dLightDirW = (vPositionW - light1_position);
  vec3 tmpvar_15;
  tmpvar_15 = normalize(dLightDirW);
  float falloff_16;
  float tmpvar_17;
  tmpvar_17 = dot (dLightDirW, dLightDirW);
  float tmpvar_18;
  tmpvar_18 = (1.0/(light1_radius));
  falloff_16 = ((1.0/((tmpvar_17 + 1.0))) * 16.0);
  float x_19;
  x_19 = (tmpvar_17 * (tmpvar_18 * tmpvar_18));
  float tmpvar_20;
  tmpvar_20 = clamp ((1.0 - (x_19 * x_19)), 0.0, 1.0);
  falloff_16 = (falloff_16 * (tmpvar_20 * tmpvar_20));
  dAtten = falloff_16;
  if ((falloff_16 > 1e-05)) {
    float tmpvar_21;
    tmpvar_21 = clamp (((
      dot (tmpvar_15, light1_direction)
     - light1_outerConeAngle) / (light1_innerConeAngle - light1_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_16 * (tmpvar_21 * (tmpvar_21 *
      (3.0 - (2.0 * tmpvar_21))
    )));
    dAtten = (dAtten * max (dot (dNormalW,
      -(tmpvar_15)
    ), 0.0));
    dDiffuseLight = (dDiffuseLight + (dAtten * light1_color));
  };
  dLightDirW = (vPositionW - light2_position);
  vec3 tmpvar_22;
  tmpvar_22 = normalize(dLightDirW);
  lowp float tmpvar_23;
  tmpvar_23 = max (((light2_radius -
    sqrt(dot (dLightDirW, dLightDirW))
  ) / light2_radius), 0.0);
  dAtten = tmpvar_23;
  if ((tmpvar_23 > 1e-05)) {
    float tmpvar_24;
    tmpvar_24 = clamp (((
      dot (tmpvar_22, light2_direction)
     - light2_outerConeAngle) / (light2_innerConeAngle - light2_outerConeAngle)), 0.0, 1.0);
    dAtten = (tmpvar_23 * (tmpvar_24 * (tmpvar_24 *
      (3.0 - (2.0 * tmpvar_24))
    )));
    dAtten = (dAtten * max (dot (dNormalW,
      -(tmpvar_22)
    ), 0.0));
    vec4 projPos_25;
    vec4 tmpvar_26;
    tmpvar_26.w = 1.0;
    tmpvar_26.xyz = vPositionW;
    vec4 tmpvar_27;
    tmpvar_27 = (light2_shadowMatrix * tmpvar_26);
    projPos_25.zw = tmpvar_27.zw;
    projPos_25.xy = (tmpvar_27.xy / tmpvar_27.w);
    float Z_28;
    Z_28 = ((sqrt(
      dot (dLightDirW, dLightDirW)
    ) * light2_shadowParams.w) + light2_shadowParams.z);
    lowp vec4 tmpvar_29;
    tmpvar_29 = texture (light2_shadowMap, projPos_25.xy);
    lowp vec3 tmpvar_30;
    tmpvar_30.z = 0.0;
    tmpvar_30.x = ((tmpvar_29.y * 0.003921569) + tmpvar_29.x);
    tmpvar_30.y = ((tmpvar_29.w * 0.003921569) + tmpvar_29.z);
    float tmpvar_31;
    tmpvar_31 = (light2_shadowParams.y * Z_28);
    lowp float tmpvar_32;
    tmpvar_32 = max ((tmpvar_30.y - (tmpvar_30.x * tmpvar_30.x)), (tmpvar_31 * tmpvar_31));
    lowp float tmpvar_33;
    tmpvar_33 = (Z_28 - tmpvar_30.x);
    lowp float tmpvar_34;
    tmpvar_34 = clamp (((
      (tmpvar_32 / (tmpvar_32 + (tmpvar_33 * tmpvar_33)))
     - 0.1) / 0.9), 0.0, 1.0);
    lowp float tmpvar_35;
    if ((Z_28 <= tmpvar_30.x)) {
      tmpvar_35 = 1.0;
    } else {
      tmpvar_35 = tmpvar_34;
    };
    dAtten = (dAtten * tmpvar_35);
    dDiffuseLight = (dDiffuseLight + (dAtten * light2_color));
  };
  lowp vec3 tmpvar_36;
  tmpvar_36 = (rgba_2.xyz * dDiffuseLight);
  pc_fragColor.xyz = tmpvar_36;
  pc_fragColor.xyz = (pc_fragColor.xyz + material_emissive);
  vec3 tmpvar_37;
  tmpvar_37 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_37, tmpvar_37))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = 1.0;
  pc_fragColor.x += 0.8460207427971602;
}



