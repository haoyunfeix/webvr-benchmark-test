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
lowp vec3 dSpecularLight;
vec3 dLightDirW;
lowp vec3 dSpecularity;
lowp float dGlossiness;
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
uniform sampler2D texture_specularMap;
uniform sampler2D texture_glossMap;
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
  vec3 tmpvar_1;
  tmpvar_1 = normalize((view_position - vPositionW));
  mat3 tmpvar_2;
  tmpvar_2[uint(0)] = normalize(vTangentW);
  tmpvar_2[1u] = normalize(vBinormalW);
  tmpvar_2[2u] = normalize(vNormalW);
  lowp vec3 tmpvar_3;
  tmpvar_3 = ((texture (texture_normalMap, vUv0).xyz * 2.0) - 1.0);
  dNormalW = (tmpvar_2 * normalize(mix (vec3(0.0, 0.0, 1.0), tmpvar_3, material_bumpiness)));
  lowp vec3 tmpvar_4;
  tmpvar_4 = normalize(((2.0 *
    (dot (dNormalW, tmpvar_1) * dNormalW)
  ) - tmpvar_1));
  lowp vec4 rgba_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture (texture_diffuseMap, vUv0);
  rgba_5.w = tmpvar_6.w;
  rgba_5.xyz = pow (tmpvar_6.xyz, vec3(2.2, 2.2, 2.2));
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture (texture_specularMap, vUv0);
  dGlossiness = ((material_shininess * texture (texture_glossMap, vUv0).y) + 1e-07);
  lowp float fresnel_8;
  lowp float tmpvar_9;
  tmpvar_9 = (1.0 - max (dot (dNormalW, tmpvar_1), 0.0));
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_9 * tmpvar_9);
  fresnel_8 = (tmpvar_9 * (tmpvar_10 * tmpvar_10));
  fresnel_8 = (fresnel_8 * (dGlossiness * dGlossiness));
  dSpecularity = (tmpvar_7.xxx + ((1.0 - tmpvar_7.xxx) * fresnel_8));
  lowp vec3 fixedReflDir_11;
  lowp vec3 vec_12;
  vec_12 = dNormalW;
  lowp float tmpvar_13;
  tmpvar_13 = max (max (abs(dNormalW.x), abs(dNormalW.y)), abs(dNormalW.z));
  lowp float tmpvar_14;
  tmpvar_14 = abs(dNormalW.x);
  if ((tmpvar_14 != tmpvar_13)) {
    vec_12.x = (dNormalW.x * 0.75);
  };
  lowp float tmpvar_15;
  tmpvar_15 = abs(dNormalW.y);
  if ((tmpvar_15 != tmpvar_13)) {
    vec_12.y = (dNormalW.y * 0.75);
  };
  lowp float tmpvar_16;
  tmpvar_16 = abs(dNormalW.z);
  if ((tmpvar_16 != tmpvar_13)) {
    vec_12.z = (dNormalW.z * 0.75);
  };
  fixedReflDir_11.yz = vec_12.yz;
  fixedReflDir_11.x = -(vec_12.x);
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture (texture_prefilteredCubeMap4, fixedReflDir_11);
  lowp vec3 tmpvar_18;
  tmpvar_18 = ((8.0 * tmpvar_17.w) * tmpvar_17.xyz);
  dDiffuseLight = ((tmpvar_18 * tmpvar_18) * skyboxIntensity);
  lowp vec4 cube_0_20;
  lowp vec4 cube_1_21;
  lowp vec4 cubes_22[6];
  lowp vec3 fixedReflDir_23;
  lowp int index2_24;
  lowp int index1_25;
  lowp float tmpvar_26;
  tmpvar_26 = (clamp ((1.0 - dGlossiness), 0.0, 1.0) * 5.0);
  index1_25 = int(tmpvar_26);
  index2_24 = int(min ((tmpvar_26 + 1.0), 7.0));
  lowp vec3 vec_27;
  vec_27 = tmpvar_4;
  lowp float tmpvar_28;
  tmpvar_28 = (1.0 - (exp2(tmpvar_26) / 128.0));
  lowp float tmpvar_29;
  tmpvar_29 = max (max (abs(tmpvar_4.x), abs(tmpvar_4.y)), abs(tmpvar_4.z));
  lowp float tmpvar_30;
  tmpvar_30 = abs(tmpvar_4.x);
  if ((tmpvar_30 != tmpvar_29)) {
    vec_27.x = (tmpvar_4.x * tmpvar_28);
  };
  lowp float tmpvar_31;
  tmpvar_31 = abs(tmpvar_4.y);
  if ((tmpvar_31 != tmpvar_29)) {
    vec_27.y = (tmpvar_4.y * tmpvar_28);
  };
  lowp float tmpvar_32;
  tmpvar_32 = abs(tmpvar_4.z);
  if ((tmpvar_32 != tmpvar_29)) {
    vec_27.z = (tmpvar_4.z * tmpvar_28);
  };
  fixedReflDir_23.yz = vec_27.yz;
  fixedReflDir_23.x = -(vec_27.x);
  cubes_22[0] = texture (texture_prefilteredCubeMap128, fixedReflDir_23);
  cubes_22[1] = texture (texture_prefilteredCubeMap64, fixedReflDir_23);
  cubes_22[2] = texture (texture_prefilteredCubeMap32, fixedReflDir_23);
  cubes_22[3] = texture (texture_prefilteredCubeMap16, fixedReflDir_23);
  cubes_22[4] = texture (texture_prefilteredCubeMap8, fixedReflDir_23);
  cubes_22[5] = texture (texture_prefilteredCubeMap4, fixedReflDir_23);
  for (highp int i_19 = 0; i_19 < 6; i_19++) {
    if ((i_19 == index1_25)) {
      cube_0_20 = cubes_22[i_19];
    };
    if ((i_19 == index2_24)) {
      cube_1_21 = cubes_22[i_19];
    };
  };
  lowp vec4 tmpvar_33;
  tmpvar_33 = mix (cube_0_20, cube_1_21, fract(tmpvar_26));
  lowp vec3 tmpvar_34;
  tmpvar_34 = ((8.0 * tmpvar_33.w) * tmpvar_33.xyz);
  lowp vec4 tmpvar_35;
  tmpvar_35.xyz = ((tmpvar_34 * tmpvar_34) * skyboxIntensity);
  tmpvar_35.w = material_reflectivity;
  dLightDirW = (vPositionW - light0_position);
  vec3 tmpvar_36;
  tmpvar_36 = normalize(dLightDirW);
  lowp float tmpvar_37;
  tmpvar_37 = max (((light0_radius -
    sqrt(dot (dLightDirW, dLightDirW))
  ) / light0_radius), 0.0);
  dAtten = tmpvar_37;
  if ((tmpvar_37 > 1e-05)) {
    float tmpvar_38;
    tmpvar_38 = clamp (((
      dot (tmpvar_36, light0_direction)
     - light0_outerConeAngle) / (light0_innerConeAngle - light0_outerConeAngle)), 0.0, 1.0);
    dAtten = (tmpvar_37 * (tmpvar_38 * (tmpvar_38 *
      (3.0 - (2.0 * tmpvar_38))
    )));
    dAtten = (dAtten * max (dot (dNormalW,
      -(tmpvar_36)
    ), 0.0));
    dDiffuseLight = (dDiffuseLight + (dAtten * light0_color));
    lowp float tmpvar_39;
    tmpvar_39 = exp2((dGlossiness * 11.0));
    lowp float tmpvar_40;
    tmpvar_40 = max ((tmpvar_39 * mix (1.0,
      (1.0/((1.0 + (tmpvar_39 * (
        (1.0/(clamp (sqrt(dot (tmpvar_3, tmpvar_3)), 0.0, 1.0)))
       - 1.0)))))
    , material_bumpiness)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_36) + tmpvar_1)
      ), dNormalW), 0.0), tmpvar_40)
     *
      (tmpvar_40 + 2.0)
    ) / 8.0));
    dSpecularLight = (dAtten * light0_color);
  };
  dLightDirW = (vPositionW - light1_position);
  vec3 tmpvar_41;
  tmpvar_41 = normalize(dLightDirW);
  float falloff_42;
  float tmpvar_43;
  tmpvar_43 = dot (dLightDirW, dLightDirW);
  float tmpvar_44;
  tmpvar_44 = (1.0/(light1_radius));
  falloff_42 = ((1.0/((tmpvar_43 + 1.0))) * 16.0);
  float x_45;
  x_45 = (tmpvar_43 * (tmpvar_44 * tmpvar_44));
  float tmpvar_46;
  tmpvar_46 = clamp ((1.0 - (x_45 * x_45)), 0.0, 1.0);
  falloff_42 = (falloff_42 * (tmpvar_46 * tmpvar_46));
  dAtten = falloff_42;
  if ((falloff_42 > 1e-05)) {
    float tmpvar_47;
    tmpvar_47 = clamp (((
      dot (tmpvar_41, light1_direction)
     - light1_outerConeAngle) / (light1_innerConeAngle - light1_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_42 * (tmpvar_47 * (tmpvar_47 *
      (3.0 - (2.0 * tmpvar_47))
    )));
    dAtten = (dAtten * max (dot (dNormalW,
      -(tmpvar_41)
    ), 0.0));
    dDiffuseLight = (dDiffuseLight + (dAtten * light1_color));
    lowp float tmpvar_48;
    tmpvar_48 = exp2((dGlossiness * 11.0));
    lowp float tmpvar_49;
    tmpvar_49 = max ((tmpvar_48 * mix (1.0,
      (1.0/((1.0 + (tmpvar_48 * (
        (1.0/(clamp (sqrt(dot (tmpvar_3, tmpvar_3)), 0.0, 1.0)))
       - 1.0)))))
    , material_bumpiness)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_41) + tmpvar_1)
      ), dNormalW), 0.0), tmpvar_49)
     *
      (tmpvar_49 + 2.0)
    ) / 8.0));
    dSpecularLight = (dSpecularLight + (dAtten * light1_color));
  };
  dLightDirW = (vPositionW - light2_position);
  vec3 tmpvar_50;
  tmpvar_50 = normalize(dLightDirW);
  lowp float tmpvar_51;
  tmpvar_51 = max (((light2_radius -
    sqrt(dot (dLightDirW, dLightDirW))
  ) / light2_radius), 0.0);
  dAtten = tmpvar_51;
  if ((tmpvar_51 > 1e-05)) {
    float tmpvar_52;
    tmpvar_52 = clamp (((
      dot (tmpvar_50, light2_direction)
     - light2_outerConeAngle) / (light2_innerConeAngle - light2_outerConeAngle)), 0.0, 1.0);
    dAtten = (tmpvar_51 * (tmpvar_52 * (tmpvar_52 *
      (3.0 - (2.0 * tmpvar_52))
    )));
    dAtten = (dAtten * max (dot (dNormalW,
      -(tmpvar_50)
    ), 0.0));
    vec4 projPos_53;
    vec4 tmpvar_54;
    tmpvar_54.w = 1.0;
    tmpvar_54.xyz = vPositionW;
    vec4 tmpvar_55;
    tmpvar_55 = (light2_shadowMatrix * tmpvar_54);
    projPos_53.zw = tmpvar_55.zw;
    projPos_53.xy = (tmpvar_55.xy / tmpvar_55.w);
    float Z_56;
    Z_56 = ((sqrt(
      dot (dLightDirW, dLightDirW)
    ) * light2_shadowParams.w) + light2_shadowParams.z);
    lowp vec4 tmpvar_57;
    tmpvar_57 = texture (light2_shadowMap, projPos_53.xy);
    lowp vec3 tmpvar_58;
    tmpvar_58.z = 0.0;
    tmpvar_58.x = ((tmpvar_57.y * 0.003921569) + tmpvar_57.x);
    tmpvar_58.y = ((tmpvar_57.w * 0.003921569) + tmpvar_57.z);
    float tmpvar_59;
    tmpvar_59 = (light2_shadowParams.y * Z_56);
    lowp float tmpvar_60;
    tmpvar_60 = max ((tmpvar_58.y - (tmpvar_58.x * tmpvar_58.x)), (tmpvar_59 * tmpvar_59));
    lowp float tmpvar_61;
    tmpvar_61 = (Z_56 - tmpvar_58.x);
    lowp float tmpvar_62;
    tmpvar_62 = clamp (((
      (tmpvar_60 / (tmpvar_60 + (tmpvar_61 * tmpvar_61)))
     - 0.1) / 0.9), 0.0, 1.0);
    lowp float tmpvar_63;
    if ((Z_56 <= tmpvar_58.x)) {
      tmpvar_63 = 1.0;
    } else {
      tmpvar_63 = tmpvar_62;
    };
    dAtten = (dAtten * tmpvar_63);
    dDiffuseLight = (dDiffuseLight + (dAtten * light2_color));
    lowp float tmpvar_64;
    tmpvar_64 = exp2((dGlossiness * 11.0));
    lowp float tmpvar_65;
    tmpvar_65 = max ((tmpvar_64 * mix (1.0,
      (1.0/((1.0 + (tmpvar_64 * (
        (1.0/(clamp (sqrt(dot (tmpvar_3, tmpvar_3)), 0.0, 1.0)))
       - 1.0)))))
    , material_bumpiness)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_50) + tmpvar_1)
      ), dNormalW), 0.0), tmpvar_65)
     *
      (tmpvar_65 + 2.0)
    ) / 8.0));
    dSpecularLight = (dSpecularLight + (dAtten * light2_color));
  };
  lowp vec3 tmpvar_66;
  tmpvar_66 = mix ((rgba_5.xyz * dDiffuseLight), (dSpecularLight + (tmpvar_35.xyz * material_reflectivity)), dSpecularity);
  pc_fragColor.xyz = tmpvar_66;
  pc_fragColor.xyz = (pc_fragColor.xyz + material_emissive);
  vec3 tmpvar_67;
  tmpvar_67 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_67, tmpvar_67))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = 1.0;
  pc_fragColor.x += 0.014551129976082544;
}



