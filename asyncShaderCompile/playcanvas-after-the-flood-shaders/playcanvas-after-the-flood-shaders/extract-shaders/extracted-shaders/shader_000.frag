#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
in vec3 vNormalW;
in vec2 vUv0;
uniform vec3 view_position;
lowp vec3 dDiffuseLight;
vec3 dLightDirW;
lowp float dAlpha;
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
uniform vec3 light3_color;
uniform vec3 light3_position;
uniform float light3_radius;
uniform vec3 light3_direction;
uniform float light3_innerConeAngle;
uniform float light3_outerConeAngle;
uniform mat4 light3_shadowMatrix;
uniform vec4 light3_shadowParams;
uniform sampler2D light3_shadowMap;
uniform vec3 fog_color;
uniform float fog_density;
uniform float skyboxIntensity;
uniform sampler2D texture_diffuseMap;
uniform sampler2D texture_opacityMap;
uniform sampler2D texture_emissiveMap;
uniform float material_emissiveIntensity;
uniform lowp samplerCube texture_prefilteredCubeMap4;
void main ()
{
  dDiffuseLight = vec3(0.0, 0.0, 0.0);
  dAlpha = texture (texture_opacityMap, vUv0).x;
  vec3 tmpvar_1;
  tmpvar_1 = normalize(vNormalW);
  lowp vec4 rgba_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture (texture_diffuseMap, vUv0);
  rgba_2.w = tmpvar_3.w;
  rgba_2.xyz = pow (tmpvar_3.xyz, vec3(2.2, 2.2, 2.2));
  vec3 fixedReflDir_4;
  vec3 vec_5;
  vec_5 = tmpvar_1;
  float tmpvar_6;
  tmpvar_6 = max (max (abs(tmpvar_1.x), abs(tmpvar_1.y)), abs(tmpvar_1.z));
  float tmpvar_7;
  tmpvar_7 = abs(tmpvar_1.x);
  if ((tmpvar_7 != tmpvar_6)) {
    vec_5.x = (tmpvar_1.x * 0.75);
  };
  float tmpvar_8;
  tmpvar_8 = abs(tmpvar_1.y);
  if ((tmpvar_8 != tmpvar_6)) {
    vec_5.y = (tmpvar_1.y * 0.75);
  };
  float tmpvar_9;
  tmpvar_9 = abs(tmpvar_1.z);
  if ((tmpvar_9 != tmpvar_6)) {
    vec_5.z = (tmpvar_1.z * 0.75);
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
    dAtten = (dAtten * max (dot (tmpvar_1,
      -(tmpvar_12)
    ), 0.0));
    dDiffuseLight = (dDiffuseLight + (dAtten * light0_color));
  };
  dLightDirW = (vPositionW - light1_position);
  vec3 tmpvar_15;
  tmpvar_15 = normalize(dLightDirW);
  lowp float tmpvar_16;
  tmpvar_16 = max (((light1_radius -
    sqrt(dot (dLightDirW, dLightDirW))
  ) / light1_radius), 0.0);
  dAtten = tmpvar_16;
  if ((tmpvar_16 > 1e-05)) {
    float tmpvar_17;
    tmpvar_17 = clamp (((
      dot (tmpvar_15, light1_direction)
     - light1_outerConeAngle) / (light1_innerConeAngle - light1_outerConeAngle)), 0.0, 1.0);
    dAtten = (tmpvar_16 * (tmpvar_17 * (tmpvar_17 *
      (3.0 - (2.0 * tmpvar_17))
    )));
    dAtten = (dAtten * max (dot (tmpvar_1,
      -(tmpvar_15)
    ), 0.0));
    dDiffuseLight = (dDiffuseLight + (dAtten * light1_color));
  };
  dLightDirW = (vPositionW - light2_position);
  vec3 tmpvar_18;
  tmpvar_18 = normalize(dLightDirW);
  float falloff_19;
  float tmpvar_20;
  tmpvar_20 = dot (dLightDirW, dLightDirW);
  float tmpvar_21;
  tmpvar_21 = (1.0/(light2_radius));
  falloff_19 = ((1.0/((tmpvar_20 + 1.0))) * 16.0);
  float x_22;
  x_22 = (tmpvar_20 * (tmpvar_21 * tmpvar_21));
  float tmpvar_23;
  tmpvar_23 = clamp ((1.0 - (x_22 * x_22)), 0.0, 1.0);
  falloff_19 = (falloff_19 * (tmpvar_23 * tmpvar_23));
  dAtten = falloff_19;
  if ((falloff_19 > 1e-05)) {
    float tmpvar_24;
    tmpvar_24 = clamp (((
      dot (tmpvar_18, light2_direction)
     - light2_outerConeAngle) / (light2_innerConeAngle - light2_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_19 * (tmpvar_24 * (tmpvar_24 *
      (3.0 - (2.0 * tmpvar_24))
    )));
    dAtten = (dAtten * max (dot (tmpvar_1,
      -(tmpvar_18)
    ), 0.0));
    dDiffuseLight = (dDiffuseLight + (dAtten * light2_color));
  };
  dLightDirW = (vPositionW - light3_position);
  vec3 tmpvar_25;
  tmpvar_25 = normalize(dLightDirW);
  lowp float tmpvar_26;
  tmpvar_26 = max (((light3_radius -
    sqrt(dot (dLightDirW, dLightDirW))
  ) / light3_radius), 0.0);
  dAtten = tmpvar_26;
  if ((tmpvar_26 > 1e-05)) {
    float tmpvar_27;
    tmpvar_27 = clamp (((
      dot (tmpvar_25, light3_direction)
     - light3_outerConeAngle) / (light3_innerConeAngle - light3_outerConeAngle)), 0.0, 1.0);
    dAtten = (tmpvar_26 * (tmpvar_27 * (tmpvar_27 *
      (3.0 - (2.0 * tmpvar_27))
    )));
    dAtten = (dAtten * max (dot (tmpvar_1,
      -(tmpvar_25)
    ), 0.0));
    vec4 projPos_28;
    vec4 tmpvar_29;
    tmpvar_29.w = 1.0;
    tmpvar_29.xyz = vPositionW;
    vec4 tmpvar_30;
    tmpvar_30 = (light3_shadowMatrix * tmpvar_29);
    projPos_28.zw = tmpvar_30.zw;
    projPos_28.xy = (tmpvar_30.xy / tmpvar_30.w);
    float Z_31;
    Z_31 = ((sqrt(
      dot (dLightDirW, dLightDirW)
    ) * light3_shadowParams.w) + light3_shadowParams.z);
    lowp vec4 tmpvar_32;
    tmpvar_32 = texture (light3_shadowMap, projPos_28.xy);
    lowp vec3 tmpvar_33;
    tmpvar_33.z = 0.0;
    tmpvar_33.x = ((tmpvar_32.y * 0.003921569) + tmpvar_32.x);
    tmpvar_33.y = ((tmpvar_32.w * 0.003921569) + tmpvar_32.z);
    float tmpvar_34;
    tmpvar_34 = (light3_shadowParams.y * Z_31);
    lowp float tmpvar_35;
    tmpvar_35 = max ((tmpvar_33.y - (tmpvar_33.x * tmpvar_33.x)), (tmpvar_34 * tmpvar_34));
    lowp float tmpvar_36;
    tmpvar_36 = (Z_31 - tmpvar_33.x);
    lowp float tmpvar_37;
    tmpvar_37 = clamp (((
      (tmpvar_35 / (tmpvar_35 + (tmpvar_36 * tmpvar_36)))
     - 0.1) / 0.9), 0.0, 1.0);
    lowp float tmpvar_38;
    if ((Z_31 <= tmpvar_33.x)) {
      tmpvar_38 = 1.0;
    } else {
      tmpvar_38 = tmpvar_37;
    };
    dAtten = (dAtten * tmpvar_38);
    dDiffuseLight = (dDiffuseLight + (dAtten * light3_color));
  };
  lowp vec3 tmpvar_39;
  tmpvar_39 = (rgba_2.xyz * dDiffuseLight);
  pc_fragColor.xyz = tmpvar_39;
  lowp vec3 tmpvar_40;
  lowp vec4 rgba_41;
  lowp vec4 tmpvar_42;
  tmpvar_42 = texture (texture_emissiveMap, vUv0);
  rgba_41.w = tmpvar_42.w;
  rgba_41.xyz = pow (tmpvar_42.xyz, vec3(2.2, 2.2, 2.2));
  tmpvar_40 = (rgba_41.xyz * material_emissiveIntensity);
  pc_fragColor.xyz = (pc_fragColor.xyz + tmpvar_40);
  vec3 tmpvar_43;
  tmpvar_43 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_43, tmpvar_43))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = dAlpha;
  pc_fragColor.x += 0.7516419528079878;
}



