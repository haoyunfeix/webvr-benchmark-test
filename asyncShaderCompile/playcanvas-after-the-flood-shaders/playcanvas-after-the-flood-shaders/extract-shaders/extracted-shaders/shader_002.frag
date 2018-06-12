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
uniform mat4 light1_shadowMatrix;
uniform vec4 light1_shadowParams;
uniform sampler2D light1_shadowMap;
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
  float falloff_13;
  float tmpvar_14;
  tmpvar_14 = dot (dLightDirW, dLightDirW);
  float tmpvar_15;
  tmpvar_15 = (1.0/(light0_radius));
  falloff_13 = ((1.0/((tmpvar_14 + 1.0))) * 16.0);
  float x_16;
  x_16 = (tmpvar_14 * (tmpvar_15 * tmpvar_15));
  float tmpvar_17;
  tmpvar_17 = clamp ((1.0 - (x_16 * x_16)), 0.0, 1.0);
  falloff_13 = (falloff_13 * (tmpvar_17 * tmpvar_17));
  dAtten = falloff_13;
  if ((falloff_13 > 1e-05)) {
    float tmpvar_18;
    tmpvar_18 = clamp (((
      dot (tmpvar_12, light0_direction)
     - light0_outerConeAngle) / (light0_innerConeAngle - light0_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_13 * (tmpvar_18 * (tmpvar_18 *
      (3.0 - (2.0 * tmpvar_18))
    )));
    dAtten = (dAtten * max (dot (tmpvar_1,
      -(tmpvar_12)
    ), 0.0));
    dDiffuseLight = (dDiffuseLight + (dAtten * light0_color));
  };
  dLightDirW = (vPositionW - light1_position);
  vec3 tmpvar_19;
  tmpvar_19 = normalize(dLightDirW);
  lowp float tmpvar_20;
  tmpvar_20 = max (((light1_radius -
    sqrt(dot (dLightDirW, dLightDirW))
  ) / light1_radius), 0.0);
  dAtten = tmpvar_20;
  if ((tmpvar_20 > 1e-05)) {
    float tmpvar_21;
    tmpvar_21 = clamp (((
      dot (tmpvar_19, light1_direction)
     - light1_outerConeAngle) / (light1_innerConeAngle - light1_outerConeAngle)), 0.0, 1.0);
    dAtten = (tmpvar_20 * (tmpvar_21 * (tmpvar_21 *
      (3.0 - (2.0 * tmpvar_21))
    )));
    dAtten = (dAtten * max (dot (tmpvar_1,
      -(tmpvar_19)
    ), 0.0));
    vec4 projPos_22;
    vec4 tmpvar_23;
    tmpvar_23.w = 1.0;
    tmpvar_23.xyz = vPositionW;
    vec4 tmpvar_24;
    tmpvar_24 = (light1_shadowMatrix * tmpvar_23);
    projPos_22.zw = tmpvar_24.zw;
    projPos_22.xy = (tmpvar_24.xy / tmpvar_24.w);
    float Z_25;
    Z_25 = ((sqrt(
      dot (dLightDirW, dLightDirW)
    ) * light1_shadowParams.w) + light1_shadowParams.z);
    lowp vec4 tmpvar_26;
    tmpvar_26 = texture (light1_shadowMap, projPos_22.xy);
    lowp vec3 tmpvar_27;
    tmpvar_27.z = 0.0;
    tmpvar_27.x = ((tmpvar_26.y * 0.003921569) + tmpvar_26.x);
    tmpvar_27.y = ((tmpvar_26.w * 0.003921569) + tmpvar_26.z);
    float tmpvar_28;
    tmpvar_28 = (light1_shadowParams.y * Z_25);
    lowp float tmpvar_29;
    tmpvar_29 = max ((tmpvar_27.y - (tmpvar_27.x * tmpvar_27.x)), (tmpvar_28 * tmpvar_28));
    lowp float tmpvar_30;
    tmpvar_30 = (Z_25 - tmpvar_27.x);
    lowp float tmpvar_31;
    tmpvar_31 = clamp (((
      (tmpvar_29 / (tmpvar_29 + (tmpvar_30 * tmpvar_30)))
     - 0.1) / 0.9), 0.0, 1.0);
    lowp float tmpvar_32;
    if ((Z_25 <= tmpvar_27.x)) {
      tmpvar_32 = 1.0;
    } else {
      tmpvar_32 = tmpvar_31;
    };
    dAtten = (dAtten * tmpvar_32);
    dDiffuseLight = (dDiffuseLight + (dAtten * light1_color));
  };
  lowp vec3 tmpvar_33;
  tmpvar_33 = (rgba_2.xyz * dDiffuseLight);
  pc_fragColor.xyz = tmpvar_33;
  lowp vec3 tmpvar_34;
  lowp vec4 rgba_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture (texture_emissiveMap, vUv0);
  rgba_35.w = tmpvar_36.w;
  rgba_35.xyz = pow (tmpvar_36.xyz, vec3(2.2, 2.2, 2.2));
  tmpvar_34 = (rgba_35.xyz * material_emissiveIntensity);
  pc_fragColor.xyz = (pc_fragColor.xyz + tmpvar_34);
  vec3 tmpvar_37;
  tmpvar_37 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_37, tmpvar_37))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = dAlpha;
  pc_fragColor.x += 0.7334130278727737;
}



