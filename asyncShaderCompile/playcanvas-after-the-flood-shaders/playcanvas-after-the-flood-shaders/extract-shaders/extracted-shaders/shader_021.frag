#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
in vec3 vNormalW;
in vec2 vUv0;
uniform vec3 view_position;
lowp vec3 dDiffuseLight;
lowp vec3 dSpecularLight;
vec3 dLightDirW;
vec3 dSpecularity;
float dGlossiness;
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
uniform vec3 material_emissive;
uniform vec3 material_specular;
uniform float material_shininess;
uniform lowp samplerCube texture_prefilteredCubeMap128;
uniform lowp samplerCube texture_prefilteredCubeMap64;
uniform lowp samplerCube texture_prefilteredCubeMap32;
uniform lowp samplerCube texture_prefilteredCubeMap16;
uniform lowp samplerCube texture_prefilteredCubeMap8;
uniform lowp samplerCube texture_prefilteredCubeMap4;
uniform float material_reflectivity;
void main ()
{
  dDiffuseLight = vec3(0.0, 0.0, 0.0);
  dSpecularLight = vec3(0.0, 0.0, 0.0);
  dAlpha = texture (texture_opacityMap, vUv0).z;
  vec3 tmpvar_1;
  tmpvar_1 = normalize((view_position - vPositionW));
  vec3 tmpvar_2;
  tmpvar_2 = normalize(vNormalW);
  vec3 tmpvar_3;
  tmpvar_3 = normalize(((2.0 *
    (dot (tmpvar_2, tmpvar_1) * tmpvar_2)
  ) - tmpvar_1));
  lowp vec4 rgba_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture (texture_diffuseMap, vUv0);
  rgba_4.w = tmpvar_5.w;
  rgba_4.xyz = pow (tmpvar_5.xyz, vec3(2.2, 2.2, 2.2));
  dGlossiness = (material_shininess + 1e-07);
  float fresnel_6;
  float tmpvar_7;
  tmpvar_7 = (1.0 - max (dot (tmpvar_2, tmpvar_1), 0.0));
  float tmpvar_8;
  tmpvar_8 = (tmpvar_7 * tmpvar_7);
  fresnel_6 = (tmpvar_7 * (tmpvar_8 * tmpvar_8));
  fresnel_6 = (fresnel_6 * (dGlossiness * dGlossiness));
  dSpecularity = (material_specular + ((1.0 - material_specular) * fresnel_6));
  vec3 fixedReflDir_9;
  vec3 vec_10;
  vec_10 = tmpvar_2;
  float tmpvar_11;
  tmpvar_11 = max (max (abs(tmpvar_2.x), abs(tmpvar_2.y)), abs(tmpvar_2.z));
  float tmpvar_12;
  tmpvar_12 = abs(tmpvar_2.x);
  if ((tmpvar_12 != tmpvar_11)) {
    vec_10.x = (tmpvar_2.x * 0.75);
  };
  float tmpvar_13;
  tmpvar_13 = abs(tmpvar_2.y);
  if ((tmpvar_13 != tmpvar_11)) {
    vec_10.y = (tmpvar_2.y * 0.75);
  };
  float tmpvar_14;
  tmpvar_14 = abs(tmpvar_2.z);
  if ((tmpvar_14 != tmpvar_11)) {
    vec_10.z = (tmpvar_2.z * 0.75);
  };
  fixedReflDir_9.yz = vec_10.yz;
  fixedReflDir_9.x = -(vec_10.x);
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture (texture_prefilteredCubeMap4, fixedReflDir_9);
  lowp vec3 tmpvar_16;
  tmpvar_16 = ((8.0 * tmpvar_15.w) * tmpvar_15.xyz);
  dDiffuseLight = ((tmpvar_16 * tmpvar_16) * skyboxIntensity);
  lowp vec4 cube_0_18;
  lowp vec4 cube_1_19;
  lowp vec4 cubes_20[6];
  vec3 fixedReflDir_21;
  highp int index2_22;
  highp int index1_23;
  float tmpvar_24;
  tmpvar_24 = (clamp ((1.0 - dGlossiness), 0.0, 1.0) * 5.0);
  index1_23 = int(tmpvar_24);
  index2_22 = int(min ((tmpvar_24 + 1.0), 7.0));
  vec3 vec_25;
  vec_25 = tmpvar_3;
  float tmpvar_26;
  tmpvar_26 = (1.0 - (exp2(tmpvar_24) / 128.0));
  float tmpvar_27;
  tmpvar_27 = max (max (abs(tmpvar_3.x), abs(tmpvar_3.y)), abs(tmpvar_3.z));
  float tmpvar_28;
  tmpvar_28 = abs(tmpvar_3.x);
  if ((tmpvar_28 != tmpvar_27)) {
    vec_25.x = (tmpvar_3.x * tmpvar_26);
  };
  float tmpvar_29;
  tmpvar_29 = abs(tmpvar_3.y);
  if ((tmpvar_29 != tmpvar_27)) {
    vec_25.y = (tmpvar_3.y * tmpvar_26);
  };
  float tmpvar_30;
  tmpvar_30 = abs(tmpvar_3.z);
  if ((tmpvar_30 != tmpvar_27)) {
    vec_25.z = (tmpvar_3.z * tmpvar_26);
  };
  fixedReflDir_21.yz = vec_25.yz;
  fixedReflDir_21.x = -(vec_25.x);
  cubes_20[0] = texture (texture_prefilteredCubeMap128, fixedReflDir_21);
  cubes_20[1] = texture (texture_prefilteredCubeMap64, fixedReflDir_21);
  cubes_20[2] = texture (texture_prefilteredCubeMap32, fixedReflDir_21);
  cubes_20[3] = texture (texture_prefilteredCubeMap16, fixedReflDir_21);
  cubes_20[4] = texture (texture_prefilteredCubeMap8, fixedReflDir_21);
  cubes_20[5] = texture (texture_prefilteredCubeMap4, fixedReflDir_21);
  for (highp int i_17 = 0; i_17 < 6; i_17++) {
    if ((i_17 == index1_23)) {
      cube_0_18 = cubes_20[i_17];
    };
    if ((i_17 == index2_22)) {
      cube_1_19 = cubes_20[i_17];
    };
  };
  lowp vec4 tmpvar_31;
  tmpvar_31 = mix (cube_0_18, cube_1_19, fract(tmpvar_24));
  lowp vec3 tmpvar_32;
  tmpvar_32 = ((8.0 * tmpvar_31.w) * tmpvar_31.xyz);
  lowp vec4 tmpvar_33;
  tmpvar_33.xyz = ((tmpvar_32 * tmpvar_32) * skyboxIntensity);
  tmpvar_33.w = material_reflectivity;
  dLightDirW = (vPositionW - light0_position);
  vec3 tmpvar_34;
  tmpvar_34 = normalize(dLightDirW);
  float falloff_35;
  float tmpvar_36;
  tmpvar_36 = dot (dLightDirW, dLightDirW);
  float tmpvar_37;
  tmpvar_37 = (1.0/(light0_radius));
  falloff_35 = ((1.0/((tmpvar_36 + 1.0))) * 16.0);
  float x_38;
  x_38 = (tmpvar_36 * (tmpvar_37 * tmpvar_37));
  float tmpvar_39;
  tmpvar_39 = clamp ((1.0 - (x_38 * x_38)), 0.0, 1.0);
  falloff_35 = (falloff_35 * (tmpvar_39 * tmpvar_39));
  dAtten = falloff_35;
  if ((falloff_35 > 1e-05)) {
    float tmpvar_40;
    tmpvar_40 = clamp (((
      dot (tmpvar_34, light0_direction)
     - light0_outerConeAngle) / (light0_innerConeAngle - light0_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_35 * (tmpvar_40 * (tmpvar_40 *
      (3.0 - (2.0 * tmpvar_40))
    )));
    dAtten = (dAtten * max (dot (tmpvar_2,
      -(tmpvar_34)
    ), 0.0));
    dDiffuseLight = (dDiffuseLight + (dAtten * light0_color));
    float tmpvar_41;
    tmpvar_41 = max (exp2((dGlossiness * 11.0)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_34) + tmpvar_1)
      ), tmpvar_2), 0.0), tmpvar_41)
     *
      (tmpvar_41 + 2.0)
    ) / 8.0));
    dSpecularLight = (dAtten * light0_color);
  };
  dLightDirW = (vPositionW - light1_position);
  vec3 tmpvar_42;
  tmpvar_42 = normalize(dLightDirW);
  lowp float tmpvar_43;
  tmpvar_43 = max (((light1_radius -
    sqrt(dot (dLightDirW, dLightDirW))
  ) / light1_radius), 0.0);
  dAtten = tmpvar_43;
  if ((tmpvar_43 > 1e-05)) {
    float tmpvar_44;
    tmpvar_44 = clamp (((
      dot (tmpvar_42, light1_direction)
     - light1_outerConeAngle) / (light1_innerConeAngle - light1_outerConeAngle)), 0.0, 1.0);
    dAtten = (tmpvar_43 * (tmpvar_44 * (tmpvar_44 *
      (3.0 - (2.0 * tmpvar_44))
    )));
    dAtten = (dAtten * max (dot (tmpvar_2,
      -(tmpvar_42)
    ), 0.0));
    vec4 projPos_45;
    vec4 tmpvar_46;
    tmpvar_46.w = 1.0;
    tmpvar_46.xyz = vPositionW;
    vec4 tmpvar_47;
    tmpvar_47 = (light1_shadowMatrix * tmpvar_46);
    projPos_45.zw = tmpvar_47.zw;
    projPos_45.xy = (tmpvar_47.xy / tmpvar_47.w);
    float Z_48;
    Z_48 = ((sqrt(
      dot (dLightDirW, dLightDirW)
    ) * light1_shadowParams.w) + light1_shadowParams.z);
    lowp vec4 tmpvar_49;
    tmpvar_49 = texture (light1_shadowMap, projPos_45.xy);
    lowp vec3 tmpvar_50;
    tmpvar_50.z = 0.0;
    tmpvar_50.x = ((tmpvar_49.y * 0.003921569) + tmpvar_49.x);
    tmpvar_50.y = ((tmpvar_49.w * 0.003921569) + tmpvar_49.z);
    float tmpvar_51;
    tmpvar_51 = (light1_shadowParams.y * Z_48);
    lowp float tmpvar_52;
    tmpvar_52 = max ((tmpvar_50.y - (tmpvar_50.x * tmpvar_50.x)), (tmpvar_51 * tmpvar_51));
    lowp float tmpvar_53;
    tmpvar_53 = (Z_48 - tmpvar_50.x);
    lowp float tmpvar_54;
    tmpvar_54 = clamp (((
      (tmpvar_52 / (tmpvar_52 + (tmpvar_53 * tmpvar_53)))
     - 0.1) / 0.9), 0.0, 1.0);
    lowp float tmpvar_55;
    if ((Z_48 <= tmpvar_50.x)) {
      tmpvar_55 = 1.0;
    } else {
      tmpvar_55 = tmpvar_54;
    };
    dAtten = (dAtten * tmpvar_55);
    dDiffuseLight = (dDiffuseLight + (dAtten * light1_color));
    float tmpvar_56;
    tmpvar_56 = max (exp2((dGlossiness * 11.0)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_42) + tmpvar_1)
      ), tmpvar_2), 0.0), tmpvar_56)
     *
      (tmpvar_56 + 2.0)
    ) / 8.0));
    dSpecularLight = (dSpecularLight + (dAtten * light1_color));
  };
  lowp vec3 tmpvar_57;
  tmpvar_57 = mix ((rgba_4.xyz * dDiffuseLight), (dSpecularLight + (tmpvar_33.xyz * material_reflectivity)), dSpecularity);
  pc_fragColor.xyz = tmpvar_57;
  pc_fragColor.xyz = (pc_fragColor.xyz + material_emissive);
  vec3 tmpvar_58;
  tmpvar_58 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_58, tmpvar_58))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = dAlpha;
  pc_fragColor.x += 0.7701112451363543;
}



