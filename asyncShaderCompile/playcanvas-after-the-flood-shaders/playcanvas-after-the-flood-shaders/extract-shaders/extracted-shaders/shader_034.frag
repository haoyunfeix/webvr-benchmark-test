#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec4 vVertexColor;
in vec3 vPositionW;
in vec3 vNormalW;
in vec3 vTangentW;
in vec3 vBinormalW;
in vec2 vUv0;
in vec2 vUv1;
uniform vec3 view_position;
lowp vec4 dReflection;
lowp vec3 dAlbedo;
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
uniform sampler2D texture_normalMap;
uniform float material_bumpiness;
uniform vec3 fog_color;
uniform float fog_density;
uniform sampler2D texture_diffuseMap;
uniform float isLeaves;
uniform vec3 material_emissive;
uniform sampler2D texture_specularMap;
uniform vec3 material_specular;
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
  dReflection = vec4(0.0, 0.0, 0.0, 0.0);
  dSpecularity = vec3(0.0, 0.0, 0.0);
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
  dAlbedo = rgba_5.xyz;
  if ((isLeaves > 0.5)) {
    dAlbedo = (rgba_5.xyz * vec3((vVertexColor.w * 2.0)));
  } else {
    dAlbedo = (dAlbedo * vec3(clamp ((
      (vVertexColor.w * vVertexColor.w)
     *
      (vVertexColor.w * 5.0)
    ), 0.0, 1.0)));
  };
  dSpecularity = (texture (texture_specularMap, vUv1).xyz * material_specular);
  dGlossiness = ((material_shininess * texture (texture_glossMap, vUv0).y) + 1e-07);
  lowp float fresnel_7;
  lowp float tmpvar_8;
  tmpvar_8 = (1.0 - max (dot (dNormalW, tmpvar_1), 0.0));
  lowp float tmpvar_9;
  tmpvar_9 = (tmpvar_8 * tmpvar_8);
  fresnel_7 = (tmpvar_8 * (tmpvar_9 * tmpvar_9));
  fresnel_7 = (fresnel_7 * (dGlossiness * dGlossiness));
  dSpecularity = (dSpecularity + ((1.0 - dSpecularity) * fresnel_7));
  lowp vec3 fixedReflDir_10;
  lowp vec3 vec_11;
  vec_11 = dNormalW;
  lowp float tmpvar_12;
  tmpvar_12 = max (max (abs(dNormalW.x), abs(dNormalW.y)), abs(dNormalW.z));
  lowp float tmpvar_13;
  tmpvar_13 = abs(dNormalW.x);
  if ((tmpvar_13 != tmpvar_12)) {
    vec_11.x = (dNormalW.x * 0.75);
  };
  lowp float tmpvar_14;
  tmpvar_14 = abs(dNormalW.y);
  if ((tmpvar_14 != tmpvar_12)) {
    vec_11.y = (dNormalW.y * 0.75);
  };
  lowp float tmpvar_15;
  tmpvar_15 = abs(dNormalW.z);
  if ((tmpvar_15 != tmpvar_12)) {
    vec_11.z = (dNormalW.z * 0.75);
  };
  fixedReflDir_10.yz = vec_11.yz;
  fixedReflDir_10.x = -(vec_11.x);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture (texture_prefilteredCubeMap4, fixedReflDir_10);
  lowp vec3 tmpvar_17;
  tmpvar_17 = ((8.0 * tmpvar_16.w) * tmpvar_16.xyz);
  float tmpvar_18;
  tmpvar_18 = clamp (vVertexColor.w, 0.0, 1.0);
  dDiffuseLight = ((tmpvar_17 * tmpvar_17) * tmpvar_18);
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
  tmpvar_35.xyz = (tmpvar_34 * tmpvar_34);
  tmpvar_35.w = material_reflectivity;
  dReflection = tmpvar_35;
  dLightDirW = (vPositionW - light0_position);
  vec3 tmpvar_36;
  tmpvar_36 = normalize(dLightDirW);
  float falloff_37;
  float tmpvar_38;
  tmpvar_38 = dot (dLightDirW, dLightDirW);
  float tmpvar_39;
  tmpvar_39 = (1.0/(light0_radius));
  falloff_37 = ((1.0/((tmpvar_38 + 1.0))) * 16.0);
  float x_40;
  x_40 = (tmpvar_38 * (tmpvar_39 * tmpvar_39));
  float tmpvar_41;
  tmpvar_41 = clamp ((1.0 - (x_40 * x_40)), 0.0, 1.0);
  falloff_37 = (falloff_37 * (tmpvar_41 * tmpvar_41));
  dAtten = falloff_37;
  if ((falloff_37 > 1e-05)) {
    float tmpvar_42;
    tmpvar_42 = clamp (((
      dot (tmpvar_36, light0_direction)
     - light0_outerConeAngle) / (light0_innerConeAngle - light0_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_37 * (tmpvar_42 * (tmpvar_42 *
      (3.0 - (2.0 * tmpvar_42))
    )));
    dAtten = (dAtten * max (dot (dNormalW,
      -(tmpvar_36)
    ), 0.0));
    dDiffuseLight = (dDiffuseLight + (dAtten * light0_color));
    lowp float tmpvar_43;
    tmpvar_43 = exp2((dGlossiness * 11.0));
    lowp float tmpvar_44;
    tmpvar_44 = max ((tmpvar_43 * mix (1.0,
      (1.0/((1.0 + (tmpvar_43 * (
        (1.0/(clamp (sqrt(dot (tmpvar_3, tmpvar_3)), 0.0, 1.0)))
       - 1.0)))))
    , material_bumpiness)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_36) + tmpvar_1)
      ), dNormalW), 0.0), tmpvar_44)
     *
      (tmpvar_44 + 2.0)
    ) / 8.0));
    dSpecularLight = (dAtten * light0_color);
  };
  dLightDirW = (vPositionW - light1_position);
  vec3 tmpvar_45;
  tmpvar_45 = normalize(dLightDirW);
  float falloff_46;
  float tmpvar_47;
  tmpvar_47 = dot (dLightDirW, dLightDirW);
  float tmpvar_48;
  tmpvar_48 = (1.0/(light1_radius));
  falloff_46 = ((1.0/((tmpvar_47 + 1.0))) * 16.0);
  float x_49;
  x_49 = (tmpvar_47 * (tmpvar_48 * tmpvar_48));
  float tmpvar_50;
  tmpvar_50 = clamp ((1.0 - (x_49 * x_49)), 0.0, 1.0);
  falloff_46 = (falloff_46 * (tmpvar_50 * tmpvar_50));
  dAtten = falloff_46;
  if ((falloff_46 > 1e-05)) {
    float tmpvar_51;
    tmpvar_51 = clamp (((
      dot (tmpvar_45, light1_direction)
     - light1_outerConeAngle) / (light1_innerConeAngle - light1_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_46 * (tmpvar_51 * (tmpvar_51 *
      (3.0 - (2.0 * tmpvar_51))
    )));
    dAtten = (dAtten * max (dot (dNormalW,
      -(tmpvar_45)
    ), 0.0));
    dDiffuseLight = (dDiffuseLight + (dAtten * light1_color));
    lowp float tmpvar_52;
    tmpvar_52 = exp2((dGlossiness * 11.0));
    lowp float tmpvar_53;
    tmpvar_53 = max ((tmpvar_52 * mix (1.0,
      (1.0/((1.0 + (tmpvar_52 * (
        (1.0/(clamp (sqrt(dot (tmpvar_3, tmpvar_3)), 0.0, 1.0)))
       - 1.0)))))
    , material_bumpiness)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_45) + tmpvar_1)
      ), dNormalW), 0.0), tmpvar_53)
     *
      (tmpvar_53 + 2.0)
    ) / 8.0));
    dSpecularLight = (dSpecularLight + (dAtten * light1_color));
  };
  dLightDirW = (vPositionW - light2_position);
  vec3 tmpvar_54;
  tmpvar_54 = normalize(dLightDirW);
  float falloff_55;
  float tmpvar_56;
  tmpvar_56 = dot (dLightDirW, dLightDirW);
  float tmpvar_57;
  tmpvar_57 = (1.0/(light2_radius));
  falloff_55 = ((1.0/((tmpvar_56 + 1.0))) * 16.0);
  float x_58;
  x_58 = (tmpvar_56 * (tmpvar_57 * tmpvar_57));
  float tmpvar_59;
  tmpvar_59 = clamp ((1.0 - (x_58 * x_58)), 0.0, 1.0);
  falloff_55 = (falloff_55 * (tmpvar_59 * tmpvar_59));
  dAtten = falloff_55;
  if ((falloff_55 > 1e-05)) {
    float tmpvar_60;
    tmpvar_60 = clamp (((
      dot (tmpvar_54, light2_direction)
     - light2_outerConeAngle) / (light2_innerConeAngle - light2_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_55 * (tmpvar_60 * (tmpvar_60 *
      (3.0 - (2.0 * tmpvar_60))
    )));
    dAtten = (dAtten * max (dot (dNormalW,
      -(tmpvar_54)
    ), 0.0));
    dDiffuseLight = (dDiffuseLight + (dAtten * light2_color));
    lowp float tmpvar_61;
    tmpvar_61 = exp2((dGlossiness * 11.0));
    lowp float tmpvar_62;
    tmpvar_62 = max ((tmpvar_61 * mix (1.0,
      (1.0/((1.0 + (tmpvar_61 * (
        (1.0/(clamp (sqrt(dot (tmpvar_3, tmpvar_3)), 0.0, 1.0)))
       - 1.0)))))
    , material_bumpiness)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_54) + tmpvar_1)
      ), dNormalW), 0.0), tmpvar_62)
     *
      (tmpvar_62 + 2.0)
    ) / 8.0));
    dSpecularLight = (dSpecularLight + (dAtten * light2_color));
  };
  dLightDirW = (vPositionW - light3_position);
  vec3 tmpvar_63;
  tmpvar_63 = normalize(dLightDirW);
  float falloff_64;
  float tmpvar_65;
  tmpvar_65 = dot (dLightDirW, dLightDirW);
  float tmpvar_66;
  tmpvar_66 = (1.0/(light3_radius));
  falloff_64 = ((1.0/((tmpvar_65 + 1.0))) * 16.0);
  float x_67;
  x_67 = (tmpvar_65 * (tmpvar_66 * tmpvar_66));
  float tmpvar_68;
  tmpvar_68 = clamp ((1.0 - (x_67 * x_67)), 0.0, 1.0);
  falloff_64 = (falloff_64 * (tmpvar_68 * tmpvar_68));
  dAtten = falloff_64;
  if ((falloff_64 > 1e-05)) {
    float tmpvar_69;
    tmpvar_69 = clamp (((
      dot (tmpvar_63, light3_direction)
     - light3_outerConeAngle) / (light3_innerConeAngle - light3_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_64 * (tmpvar_69 * (tmpvar_69 *
      (3.0 - (2.0 * tmpvar_69))
    )));
    dAtten = (dAtten * max (dot (dNormalW,
      -(tmpvar_63)
    ), 0.0));
    dDiffuseLight = (dDiffuseLight + (dAtten * light3_color));
    lowp float tmpvar_70;
    tmpvar_70 = exp2((dGlossiness * 11.0));
    lowp float tmpvar_71;
    tmpvar_71 = max ((tmpvar_70 * mix (1.0,
      (1.0/((1.0 + (tmpvar_70 * (
        (1.0/(clamp (sqrt(dot (tmpvar_3, tmpvar_3)), 0.0, 1.0)))
       - 1.0)))))
    , material_bumpiness)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_63) + tmpvar_1)
      ), dNormalW), 0.0), tmpvar_71)
     *
      (tmpvar_71 + 2.0)
    ) / 8.0));
    dSpecularLight = (dSpecularLight + (dAtten * light3_color));
  };
  dLightDirW = (vPositionW - light4_position);
  vec3 tmpvar_72;
  tmpvar_72 = normalize(dLightDirW);
  float falloff_73;
  float tmpvar_74;
  tmpvar_74 = dot (dLightDirW, dLightDirW);
  float tmpvar_75;
  tmpvar_75 = (1.0/(light4_radius));
  falloff_73 = ((1.0/((tmpvar_74 + 1.0))) * 16.0);
  float x_76;
  x_76 = (tmpvar_74 * (tmpvar_75 * tmpvar_75));
  float tmpvar_77;
  tmpvar_77 = clamp ((1.0 - (x_76 * x_76)), 0.0, 1.0);
  falloff_73 = (falloff_73 * (tmpvar_77 * tmpvar_77));
  dAtten = falloff_73;
  if ((falloff_73 > 1e-05)) {
    float tmpvar_78;
    tmpvar_78 = clamp (((
      dot (tmpvar_72, light4_direction)
     - light4_outerConeAngle) / (light4_innerConeAngle - light4_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_73 * (tmpvar_78 * (tmpvar_78 *
      (3.0 - (2.0 * tmpvar_78))
    )));
    dAtten = (dAtten * max (dot (dNormalW,
      -(tmpvar_72)
    ), 0.0));
    dDiffuseLight = (dDiffuseLight + (dAtten * light4_color));
    lowp float tmpvar_79;
    tmpvar_79 = exp2((dGlossiness * 11.0));
    lowp float tmpvar_80;
    tmpvar_80 = max ((tmpvar_79 * mix (1.0,
      (1.0/((1.0 + (tmpvar_79 * (
        (1.0/(clamp (sqrt(dot (tmpvar_3, tmpvar_3)), 0.0, 1.0)))
       - 1.0)))))
    , material_bumpiness)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_72) + tmpvar_1)
      ), dNormalW), 0.0), tmpvar_80)
     *
      (tmpvar_80 + 2.0)
    ) / 8.0));
    dSpecularLight = (dSpecularLight + (dAtten * light4_color));
  };
  dLightDirW = (vPositionW - light5_position);
  vec3 tmpvar_81;
  tmpvar_81 = normalize(dLightDirW);
  float falloff_82;
  float tmpvar_83;
  tmpvar_83 = dot (dLightDirW, dLightDirW);
  float tmpvar_84;
  tmpvar_84 = (1.0/(light5_radius));
  falloff_82 = ((1.0/((tmpvar_83 + 1.0))) * 16.0);
  float x_85;
  x_85 = (tmpvar_83 * (tmpvar_84 * tmpvar_84));
  float tmpvar_86;
  tmpvar_86 = clamp ((1.0 - (x_85 * x_85)), 0.0, 1.0);
  falloff_82 = (falloff_82 * (tmpvar_86 * tmpvar_86));
  dAtten = falloff_82;
  if ((falloff_82 > 1e-05)) {
    float tmpvar_87;
    tmpvar_87 = clamp (((
      dot (tmpvar_81, light5_direction)
     - light5_outerConeAngle) / (light5_innerConeAngle - light5_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_82 * (tmpvar_87 * (tmpvar_87 *
      (3.0 - (2.0 * tmpvar_87))
    )));
    dAtten = (dAtten * max (dot (dNormalW,
      -(tmpvar_81)
    ), 0.0));
    vec4 projPos_88;
    vec4 tmpvar_89;
    tmpvar_89.w = 1.0;
    tmpvar_89.xyz = vPositionW;
    vec4 tmpvar_90;
    tmpvar_90 = (light5_shadowMatrix * tmpvar_89);
    projPos_88.zw = tmpvar_90.zw;
    projPos_88.xy = (tmpvar_90.xy / tmpvar_90.w);
    float Z_91;
    Z_91 = ((sqrt(
      dot (dLightDirW, dLightDirW)
    ) * light5_shadowParams.w) + light5_shadowParams.z);
    lowp vec4 tmpvar_92;
    tmpvar_92 = texture (light5_shadowMap, projPos_88.xy);
    lowp vec3 tmpvar_93;
    tmpvar_93.z = 0.0;
    tmpvar_93.x = ((tmpvar_92.y * 0.003921569) + tmpvar_92.x);
    tmpvar_93.y = ((tmpvar_92.w * 0.003921569) + tmpvar_92.z);
    float tmpvar_94;
    tmpvar_94 = (light5_shadowParams.y * Z_91);
    lowp float tmpvar_95;
    tmpvar_95 = max ((tmpvar_93.y - (tmpvar_93.x * tmpvar_93.x)), (tmpvar_94 * tmpvar_94));
    lowp float tmpvar_96;
    tmpvar_96 = (Z_91 - tmpvar_93.x);
    lowp float tmpvar_97;
    tmpvar_97 = clamp (((
      (tmpvar_95 / (tmpvar_95 + (tmpvar_96 * tmpvar_96)))
     - 0.1) / 0.9), 0.0, 1.0);
    lowp float tmpvar_98;
    if ((Z_91 <= tmpvar_93.x)) {
      tmpvar_98 = 1.0;
    } else {
      tmpvar_98 = tmpvar_97;
    };
    dAtten = (dAtten * tmpvar_98);
    dDiffuseLight = (dDiffuseLight + (dAtten * light5_color));
    lowp float tmpvar_99;
    tmpvar_99 = exp2((dGlossiness * 11.0));
    lowp float tmpvar_100;
    tmpvar_100 = max ((tmpvar_99 * mix (1.0,
      (1.0/((1.0 + (tmpvar_99 * (
        (1.0/(clamp (sqrt(dot (tmpvar_3, tmpvar_3)), 0.0, 1.0)))
       - 1.0)))))
    , material_bumpiness)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_81) + tmpvar_1)
      ), dNormalW), 0.0), tmpvar_100)
     *
      (tmpvar_100 + 2.0)
    ) / 8.0));
    dSpecularLight = (dSpecularLight + (dAtten * light5_color));
  };
  dSpecularLight = (dSpecularLight * tmpvar_18);
  dReflection = (tmpvar_35 * tmpvar_18);
  lowp vec3 tmpvar_101;
  tmpvar_101 = mix ((dAlbedo * dDiffuseLight), (dSpecularLight + (dReflection.xyz * dReflection.w)), dSpecularity);
  pc_fragColor.xyz = tmpvar_101;
  pc_fragColor.xyz = (pc_fragColor.xyz + (pow (
    clamp (vVertexColor.xyz, vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0))
  , vec3(2.2, 2.2, 2.2)) * material_emissive));
  vec3 tmpvar_102;
  tmpvar_102 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_102, tmpvar_102))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = 1.0;
  pc_fragColor.x += 0.8292758752663281;
}



