#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec4 vVertexColor;
in vec3 vPositionW;
in vec3 vNormalW;
in vec2 vUv0;
in vec2 vUv1;
uniform vec3 view_position;
lowp vec3 dAlbedo;
lowp vec3 dDiffuseLight;
lowp vec3 dSpecularLight;
vec3 dLightDirW;
lowp vec3 dSpecularity;
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
uniform vec3 light4_color;
uniform vec3 light4_position;
uniform float light4_radius;
uniform vec3 light4_direction;
uniform float light4_innerConeAngle;
uniform float light4_outerConeAngle;
uniform vec3 light5_color;
uniform vec3 light5_position;
uniform float light5_radius;
uniform vec3 light5_direction;
uniform float light5_innerConeAngle;
uniform float light5_outerConeAngle;
uniform mat4 light5_shadowMatrix;
uniform vec4 light5_shadowParams;
uniform sampler2D light5_shadowMap;
uniform vec3 fog_color;
uniform float fog_density;
uniform float skyboxIntensity;
uniform sampler2D texture_diffuseMap;
uniform vec3 material_diffuse;
uniform sampler2D texture_opacityMap;
uniform sampler2D texture_emissiveMap;
uniform float material_emissiveIntensity;
uniform sampler2D texture_specularMap;
uniform vec3 material_specular;
uniform float material_shininess;
uniform lowp samplerCube texture_prefilteredCubeMap128;
uniform lowp samplerCube texture_prefilteredCubeMap64;
uniform lowp samplerCube texture_prefilteredCubeMap32;
uniform lowp samplerCube texture_prefilteredCubeMap16;
uniform lowp samplerCube texture_prefilteredCubeMap8;
uniform lowp samplerCube texture_prefilteredCubeMap4;
uniform float material_reflectivity;
uniform float alpha_ref;
void main ()
{
  dDiffuseLight = vec3(0.0, 0.0, 0.0);
  dSpecularLight = vec3(0.0, 0.0, 0.0);
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture (texture_opacityMap, vUv0);
  dAlpha = tmpvar_1.w;
  if ((tmpvar_1.w < alpha_ref)) {
    discard;
  };
  vec3 tmpvar_2;
  tmpvar_2 = normalize((view_position - vPositionW));
  vec3 tmpvar_3;
  tmpvar_3 = normalize(vNormalW);
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((2.0 *
    (dot (tmpvar_3, tmpvar_2) * tmpvar_3)
  ) - tmpvar_2));
  lowp vec4 rgba_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture (texture_diffuseMap, vUv0);
  rgba_5.w = tmpvar_6.w;
  rgba_5.xyz = pow (tmpvar_6.xyz, vec3(2.2, 2.2, 2.2));
  dAlbedo = (rgba_5.xyz * material_diffuse);
  dSpecularity = (texture (texture_specularMap, vUv1).xyz * material_specular);
  dGlossiness = ((material_shininess * clamp (vVertexColor.x, 0.0, 1.0)) + 1e-07);
  float fresnel_7;
  float tmpvar_8;
  tmpvar_8 = (1.0 - max (dot (tmpvar_3, tmpvar_2), 0.0));
  float tmpvar_9;
  tmpvar_9 = (tmpvar_8 * tmpvar_8);
  fresnel_7 = (tmpvar_8 * (tmpvar_9 * tmpvar_9));
  fresnel_7 = (fresnel_7 * (dGlossiness * dGlossiness));
  dSpecularity = (dSpecularity + ((1.0 - dSpecularity) * fresnel_7));
  vec3 fixedReflDir_10;
  vec3 vec_11;
  vec_11 = tmpvar_3;
  float tmpvar_12;
  tmpvar_12 = max (max (abs(tmpvar_3.x), abs(tmpvar_3.y)), abs(tmpvar_3.z));
  float tmpvar_13;
  tmpvar_13 = abs(tmpvar_3.x);
  if ((tmpvar_13 != tmpvar_12)) {
    vec_11.x = (tmpvar_3.x * 0.75);
  };
  float tmpvar_14;
  tmpvar_14 = abs(tmpvar_3.y);
  if ((tmpvar_14 != tmpvar_12)) {
    vec_11.y = (tmpvar_3.y * 0.75);
  };
  float tmpvar_15;
  tmpvar_15 = abs(tmpvar_3.z);
  if ((tmpvar_15 != tmpvar_12)) {
    vec_11.z = (tmpvar_3.z * 0.75);
  };
  fixedReflDir_10.yz = vec_11.yz;
  fixedReflDir_10.x = -(vec_11.x);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture (texture_prefilteredCubeMap4, fixedReflDir_10);
  lowp vec3 tmpvar_17;
  tmpvar_17 = ((8.0 * tmpvar_16.w) * tmpvar_16.xyz);
  dDiffuseLight = ((tmpvar_17 * tmpvar_17) * skyboxIntensity);
  lowp vec4 cube_0_19;
  lowp vec4 cube_1_20;
  lowp vec4 cubes_21[6];
  vec3 fixedReflDir_22;
  highp int index2_23;
  highp int index1_24;
  float tmpvar_25;
  tmpvar_25 = (clamp ((1.0 - dGlossiness), 0.0, 1.0) * 5.0);
  index1_24 = int(tmpvar_25);
  index2_23 = int(min ((tmpvar_25 + 1.0), 7.0));
  vec3 vec_26;
  vec_26 = tmpvar_4;
  float tmpvar_27;
  tmpvar_27 = (1.0 - (exp2(tmpvar_25) / 128.0));
  float tmpvar_28;
  tmpvar_28 = max (max (abs(tmpvar_4.x), abs(tmpvar_4.y)), abs(tmpvar_4.z));
  float tmpvar_29;
  tmpvar_29 = abs(tmpvar_4.x);
  if ((tmpvar_29 != tmpvar_28)) {
    vec_26.x = (tmpvar_4.x * tmpvar_27);
  };
  float tmpvar_30;
  tmpvar_30 = abs(tmpvar_4.y);
  if ((tmpvar_30 != tmpvar_28)) {
    vec_26.y = (tmpvar_4.y * tmpvar_27);
  };
  float tmpvar_31;
  tmpvar_31 = abs(tmpvar_4.z);
  if ((tmpvar_31 != tmpvar_28)) {
    vec_26.z = (tmpvar_4.z * tmpvar_27);
  };
  fixedReflDir_22.yz = vec_26.yz;
  fixedReflDir_22.x = -(vec_26.x);
  cubes_21[0] = texture (texture_prefilteredCubeMap128, fixedReflDir_22);
  cubes_21[1] = texture (texture_prefilteredCubeMap64, fixedReflDir_22);
  cubes_21[2] = texture (texture_prefilteredCubeMap32, fixedReflDir_22);
  cubes_21[3] = texture (texture_prefilteredCubeMap16, fixedReflDir_22);
  cubes_21[4] = texture (texture_prefilteredCubeMap8, fixedReflDir_22);
  cubes_21[5] = texture (texture_prefilteredCubeMap4, fixedReflDir_22);
  for (highp int i_18 = 0; i_18 < 6; i_18++) {
    if ((i_18 == index1_24)) {
      cube_0_19 = cubes_21[i_18];
    };
    if ((i_18 == index2_23)) {
      cube_1_20 = cubes_21[i_18];
    };
  };
  lowp vec4 tmpvar_32;
  tmpvar_32 = mix (cube_0_19, cube_1_20, fract(tmpvar_25));
  lowp vec3 tmpvar_33;
  tmpvar_33 = ((8.0 * tmpvar_32.w) * tmpvar_32.xyz);
  lowp vec4 tmpvar_34;
  tmpvar_34.xyz = ((tmpvar_33 * tmpvar_33) * skyboxIntensity);
  tmpvar_34.w = material_reflectivity;
  dLightDirW = (vPositionW - light0_position);
  vec3 tmpvar_35;
  tmpvar_35 = normalize(dLightDirW);
  float falloff_36;
  float tmpvar_37;
  tmpvar_37 = dot (dLightDirW, dLightDirW);
  float tmpvar_38;
  tmpvar_38 = (1.0/(light0_radius));
  falloff_36 = ((1.0/((tmpvar_37 + 1.0))) * 16.0);
  float x_39;
  x_39 = (tmpvar_37 * (tmpvar_38 * tmpvar_38));
  float tmpvar_40;
  tmpvar_40 = clamp ((1.0 - (x_39 * x_39)), 0.0, 1.0);
  falloff_36 = (falloff_36 * (tmpvar_40 * tmpvar_40));
  dAtten = falloff_36;
  if ((falloff_36 > 1e-05)) {
    float tmpvar_41;
    tmpvar_41 = clamp (((
      dot (tmpvar_35, light0_direction)
     - light0_outerConeAngle) / (light0_innerConeAngle - light0_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_36 * (tmpvar_41 * (tmpvar_41 *
      (3.0 - (2.0 * tmpvar_41))
    )));
    dAtten = (dAtten * max (dot (tmpvar_3,
      -(tmpvar_35)
    ), 0.0));
    dDiffuseLight = (dDiffuseLight + (dAtten * light0_color));
    float tmpvar_42;
    tmpvar_42 = max (exp2((dGlossiness * 11.0)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_35) + tmpvar_2)
      ), tmpvar_3), 0.0), tmpvar_42)
     *
      (tmpvar_42 + 2.0)
    ) / 8.0));
    dSpecularLight = (dAtten * light0_color);
  };
  dLightDirW = (vPositionW - light1_position);
  vec3 tmpvar_43;
  tmpvar_43 = normalize(dLightDirW);
  float falloff_44;
  float tmpvar_45;
  tmpvar_45 = dot (dLightDirW, dLightDirW);
  float tmpvar_46;
  tmpvar_46 = (1.0/(light1_radius));
  falloff_44 = ((1.0/((tmpvar_45 + 1.0))) * 16.0);
  float x_47;
  x_47 = (tmpvar_45 * (tmpvar_46 * tmpvar_46));
  float tmpvar_48;
  tmpvar_48 = clamp ((1.0 - (x_47 * x_47)), 0.0, 1.0);
  falloff_44 = (falloff_44 * (tmpvar_48 * tmpvar_48));
  dAtten = falloff_44;
  if ((falloff_44 > 1e-05)) {
    float tmpvar_49;
    tmpvar_49 = clamp (((
      dot (tmpvar_43, light1_direction)
     - light1_outerConeAngle) / (light1_innerConeAngle - light1_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_44 * (tmpvar_49 * (tmpvar_49 *
      (3.0 - (2.0 * tmpvar_49))
    )));
    dAtten = (dAtten * max (dot (tmpvar_3,
      -(tmpvar_43)
    ), 0.0));
    dDiffuseLight = (dDiffuseLight + (dAtten * light1_color));
    float tmpvar_50;
    tmpvar_50 = max (exp2((dGlossiness * 11.0)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_43) + tmpvar_2)
      ), tmpvar_3), 0.0), tmpvar_50)
     *
      (tmpvar_50 + 2.0)
    ) / 8.0));
    dSpecularLight = (dSpecularLight + (dAtten * light1_color));
  };
  dLightDirW = (vPositionW - light2_position);
  vec3 tmpvar_51;
  tmpvar_51 = normalize(dLightDirW);
  float falloff_52;
  float tmpvar_53;
  tmpvar_53 = dot (dLightDirW, dLightDirW);
  float tmpvar_54;
  tmpvar_54 = (1.0/(light2_radius));
  falloff_52 = ((1.0/((tmpvar_53 + 1.0))) * 16.0);
  float x_55;
  x_55 = (tmpvar_53 * (tmpvar_54 * tmpvar_54));
  float tmpvar_56;
  tmpvar_56 = clamp ((1.0 - (x_55 * x_55)), 0.0, 1.0);
  falloff_52 = (falloff_52 * (tmpvar_56 * tmpvar_56));
  dAtten = falloff_52;
  if ((falloff_52 > 1e-05)) {
    float tmpvar_57;
    tmpvar_57 = clamp (((
      dot (tmpvar_51, light2_direction)
     - light2_outerConeAngle) / (light2_innerConeAngle - light2_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_52 * (tmpvar_57 * (tmpvar_57 *
      (3.0 - (2.0 * tmpvar_57))
    )));
    dAtten = (dAtten * max (dot (tmpvar_3,
      -(tmpvar_51)
    ), 0.0));
    dDiffuseLight = (dDiffuseLight + (dAtten * light2_color));
    float tmpvar_58;
    tmpvar_58 = max (exp2((dGlossiness * 11.0)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_51) + tmpvar_2)
      ), tmpvar_3), 0.0), tmpvar_58)
     *
      (tmpvar_58 + 2.0)
    ) / 8.0));
    dSpecularLight = (dSpecularLight + (dAtten * light2_color));
  };
  dLightDirW = (vPositionW - light3_position);
  vec3 tmpvar_59;
  tmpvar_59 = normalize(dLightDirW);
  float falloff_60;
  float tmpvar_61;
  tmpvar_61 = dot (dLightDirW, dLightDirW);
  float tmpvar_62;
  tmpvar_62 = (1.0/(light3_radius));
  falloff_60 = ((1.0/((tmpvar_61 + 1.0))) * 16.0);
  float x_63;
  x_63 = (tmpvar_61 * (tmpvar_62 * tmpvar_62));
  float tmpvar_64;
  tmpvar_64 = clamp ((1.0 - (x_63 * x_63)), 0.0, 1.0);
  falloff_60 = (falloff_60 * (tmpvar_64 * tmpvar_64));
  dAtten = falloff_60;
  if ((falloff_60 > 1e-05)) {
    float tmpvar_65;
    tmpvar_65 = clamp (((
      dot (tmpvar_59, light3_direction)
     - light3_outerConeAngle) / (light3_innerConeAngle - light3_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_60 * (tmpvar_65 * (tmpvar_65 *
      (3.0 - (2.0 * tmpvar_65))
    )));
    dAtten = (dAtten * max (dot (tmpvar_3,
      -(tmpvar_59)
    ), 0.0));
    dDiffuseLight = (dDiffuseLight + (dAtten * light3_color));
    float tmpvar_66;
    tmpvar_66 = max (exp2((dGlossiness * 11.0)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_59) + tmpvar_2)
      ), tmpvar_3), 0.0), tmpvar_66)
     *
      (tmpvar_66 + 2.0)
    ) / 8.0));
    dSpecularLight = (dSpecularLight + (dAtten * light3_color));
  };
  dLightDirW = (vPositionW - light4_position);
  vec3 tmpvar_67;
  tmpvar_67 = normalize(dLightDirW);
  float falloff_68;
  float tmpvar_69;
  tmpvar_69 = dot (dLightDirW, dLightDirW);
  float tmpvar_70;
  tmpvar_70 = (1.0/(light4_radius));
  falloff_68 = ((1.0/((tmpvar_69 + 1.0))) * 16.0);
  float x_71;
  x_71 = (tmpvar_69 * (tmpvar_70 * tmpvar_70));
  float tmpvar_72;
  tmpvar_72 = clamp ((1.0 - (x_71 * x_71)), 0.0, 1.0);
  falloff_68 = (falloff_68 * (tmpvar_72 * tmpvar_72));
  dAtten = falloff_68;
  if ((falloff_68 > 1e-05)) {
    float tmpvar_73;
    tmpvar_73 = clamp (((
      dot (tmpvar_67, light4_direction)
     - light4_outerConeAngle) / (light4_innerConeAngle - light4_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_68 * (tmpvar_73 * (tmpvar_73 *
      (3.0 - (2.0 * tmpvar_73))
    )));
    dAtten = (dAtten * max (dot (tmpvar_3,
      -(tmpvar_67)
    ), 0.0));
    dDiffuseLight = (dDiffuseLight + (dAtten * light4_color));
    float tmpvar_74;
    tmpvar_74 = max (exp2((dGlossiness * 11.0)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_67) + tmpvar_2)
      ), tmpvar_3), 0.0), tmpvar_74)
     *
      (tmpvar_74 + 2.0)
    ) / 8.0));
    dSpecularLight = (dSpecularLight + (dAtten * light4_color));
  };
  dLightDirW = (vPositionW - light5_position);
  vec3 tmpvar_75;
  tmpvar_75 = normalize(dLightDirW);
  float falloff_76;
  float tmpvar_77;
  tmpvar_77 = dot (dLightDirW, dLightDirW);
  float tmpvar_78;
  tmpvar_78 = (1.0/(light5_radius));
  falloff_76 = ((1.0/((tmpvar_77 + 1.0))) * 16.0);
  float x_79;
  x_79 = (tmpvar_77 * (tmpvar_78 * tmpvar_78));
  float tmpvar_80;
  tmpvar_80 = clamp ((1.0 - (x_79 * x_79)), 0.0, 1.0);
  falloff_76 = (falloff_76 * (tmpvar_80 * tmpvar_80));
  dAtten = falloff_76;
  if ((falloff_76 > 1e-05)) {
    float tmpvar_81;
    tmpvar_81 = clamp (((
      dot (tmpvar_75, light5_direction)
     - light5_outerConeAngle) / (light5_innerConeAngle - light5_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_76 * (tmpvar_81 * (tmpvar_81 *
      (3.0 - (2.0 * tmpvar_81))
    )));
    dAtten = (dAtten * max (dot (tmpvar_3,
      -(tmpvar_75)
    ), 0.0));
    vec4 projPos_82;
    vec4 tmpvar_83;
    tmpvar_83.w = 1.0;
    tmpvar_83.xyz = vPositionW;
    vec4 tmpvar_84;
    tmpvar_84 = (light5_shadowMatrix * tmpvar_83);
    projPos_82.zw = tmpvar_84.zw;
    projPos_82.xy = (tmpvar_84.xy / tmpvar_84.w);
    float Z_85;
    Z_85 = ((sqrt(
      dot (dLightDirW, dLightDirW)
    ) * light5_shadowParams.w) + light5_shadowParams.z);
    lowp vec4 tmpvar_86;
    tmpvar_86 = texture (light5_shadowMap, projPos_82.xy);
    lowp vec3 tmpvar_87;
    tmpvar_87.z = 0.0;
    tmpvar_87.x = ((tmpvar_86.y * 0.003921569) + tmpvar_86.x);
    tmpvar_87.y = ((tmpvar_86.w * 0.003921569) + tmpvar_86.z);
    float tmpvar_88;
    tmpvar_88 = (light5_shadowParams.y * Z_85);
    lowp float tmpvar_89;
    tmpvar_89 = max ((tmpvar_87.y - (tmpvar_87.x * tmpvar_87.x)), (tmpvar_88 * tmpvar_88));
    lowp float tmpvar_90;
    tmpvar_90 = (Z_85 - tmpvar_87.x);
    lowp float tmpvar_91;
    tmpvar_91 = clamp (((
      (tmpvar_89 / (tmpvar_89 + (tmpvar_90 * tmpvar_90)))
     - 0.1) / 0.9), 0.0, 1.0);
    lowp float tmpvar_92;
    if ((Z_85 <= tmpvar_87.x)) {
      tmpvar_92 = 1.0;
    } else {
      tmpvar_92 = tmpvar_91;
    };
    dAtten = (dAtten * tmpvar_92);
    dDiffuseLight = (dDiffuseLight + (dAtten * light5_color));
    float tmpvar_93;
    tmpvar_93 = max (exp2((dGlossiness * 11.0)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_75) + tmpvar_2)
      ), tmpvar_3), 0.0), tmpvar_93)
     *
      (tmpvar_93 + 2.0)
    ) / 8.0));
    dSpecularLight = (dSpecularLight + (dAtten * light5_color));
  };
  lowp vec3 tmpvar_94;
  tmpvar_94 = mix ((dAlbedo * dDiffuseLight), (dSpecularLight + (tmpvar_34.xyz * material_reflectivity)), dSpecularity);
  pc_fragColor.xyz = tmpvar_94;
  lowp vec3 tmpvar_95;
  float translucency_96;
  translucency_96 = (clamp (dot (tmpvar_75,
    -(vNormalW)
  ), 0.0, 1.0) * clamp (dot (
    normalize((view_position - vPositionW))
  , tmpvar_75), 0.0, 1.0));
  translucency_96 = (translucency_96 * ((1.0/(
    (dot (dLightDirW, dLightDirW) + 1.0)
  )) * 4.0));
  float tmpvar_97;
  tmpvar_97 = clamp ((translucency_96 + 0.0025), 0.0, 1.0);
  translucency_96 = tmpvar_97;
  lowp vec4 rgba_98;
  lowp vec4 tmpvar_99;
  tmpvar_99 = texture (texture_emissiveMap, vUv0);
  rgba_98.w = tmpvar_99.w;
  rgba_98.xyz = pow (tmpvar_99.xyz, vec3(2.2, 2.2, 2.2));
  tmpvar_95 = (((rgba_98.xyz * material_emissiveIntensity) * (200.0 * tmpvar_97)) * vVertexColor.w);
  pc_fragColor.xyz = (pc_fragColor.xyz + tmpvar_95);
  vec3 tmpvar_100;
  tmpvar_100 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_100, tmpvar_100))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = dAlpha;
  pc_fragColor.x += 0.7476113322475952;
}



