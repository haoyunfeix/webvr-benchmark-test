#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
in vec3 vNormalW;
in vec3 vTangentW;
in vec3 vBinormalW;
in vec2 vUv1;
in vec2 vUV0_1;
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
uniform mat4 light0_shadowMatrix;
uniform vec4 light0_shadowParams;
uniform sampler2D light0_shadowMap;
uniform vec3 light1_color;
uniform vec3 light1_position;
uniform float light1_radius;
uniform vec3 light1_direction;
uniform float light1_innerConeAngle;
uniform float light1_outerConeAngle;
uniform mat4 light1_shadowMatrix;
uniform vec4 light1_shadowParams;
uniform sampler2D light1_shadowMap;
uniform sampler2D texture_normalMap;
uniform float material_bumpiness;
uniform vec3 fog_color;
uniform float fog_density;
uniform sampler2D texture_diffuseMap;
uniform vec3 material_emissive;
uniform float material_metalness;
uniform sampler2D texture_glossMap;
uniform float material_shininess;
uniform sampler2D texture_aoMap;
uniform lowp samplerCube texture_prefilteredCubeMap128;
uniform lowp samplerCube texture_prefilteredCubeMap64;
uniform lowp samplerCube texture_prefilteredCubeMap32;
uniform lowp samplerCube texture_prefilteredCubeMap16;
uniform lowp samplerCube texture_prefilteredCubeMap8;
uniform lowp samplerCube texture_prefilteredCubeMap4;
uniform float material_reflectivity;
uniform sampler2D texture_lightMap;
uniform sampler2D topMap;
uniform vec3 leavesPos;
void main ()
{
  vec2 offsets_1[8];
  lowp vec3 shadow_2;
  float height_3;
  vec2 topUv_4;
  dSpecularLight = vec3(0.0, 0.0, 0.0);
  dReflection = vec4(0.0, 0.0, 0.0, 0.0);
  vec3 tmpvar_5;
  tmpvar_5 = normalize((view_position - vPositionW));
  mat3 tmpvar_6;
  tmpvar_6[uint(0)] = normalize(vTangentW);
  tmpvar_6[1u] = normalize(vBinormalW);
  tmpvar_6[2u] = normalize(vNormalW);
  lowp vec3 tmpvar_7;
  tmpvar_7 = ((texture (texture_normalMap, vUV0_1).xyz * 2.0) - 1.0);
  dNormalW = (tmpvar_6 * normalize(mix (vec3(0.0, 0.0, 1.0), tmpvar_7, material_bumpiness)));
  lowp vec3 tmpvar_8;
  tmpvar_8 = normalize(((2.0 *
    (dot (dNormalW, tmpvar_5) * dNormalW)
  ) - tmpvar_5));
  lowp vec4 rgba_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (texture_diffuseMap, vUV0_1);
  rgba_9.w = tmpvar_10.w;
  rgba_9.xyz = pow (tmpvar_10.xyz, vec3(2.2, 2.2, 2.2));
  lowp vec3 tmpvar_11;
  tmpvar_11 = mix (vec3(0.04, 0.04, 0.04), rgba_9.xyz, material_metalness);
  dAlbedo = (rgba_9.xyz * (1.0 - material_metalness));
  dGlossiness = ((material_shininess * texture (texture_glossMap, vUV0_1).y) + 1e-07);
  lowp float fresnel_12;
  lowp float tmpvar_13;
  tmpvar_13 = (1.0 - max (dot (dNormalW, tmpvar_5), 0.0));
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_13 * tmpvar_13);
  fresnel_12 = (tmpvar_13 * (tmpvar_14 * tmpvar_14));
  fresnel_12 = (fresnel_12 * (dGlossiness * dGlossiness));
  dSpecularity = (tmpvar_11 + ((1.0 - tmpvar_11) * fresnel_12));
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture (texture_aoMap, vUv1);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture (texture_lightMap, vUv1);
  lowp vec3 tmpvar_17;
  tmpvar_17 = ((8.0 * tmpvar_16.w) * tmpvar_16.xyz);
  dDiffuseLight = (tmpvar_17 * tmpvar_17);
  lowp vec4 cube_0_19;
  lowp vec4 cube_1_20;
  lowp vec4 cubes_21[6];
  lowp vec3 fixedReflDir_22;
  lowp int index2_23;
  lowp int index1_24;
  lowp float tmpvar_25;
  tmpvar_25 = (clamp ((1.0 - dGlossiness), 0.0, 1.0) * 5.0);
  index1_24 = int(tmpvar_25);
  index2_23 = int(min ((tmpvar_25 + 1.0), 7.0));
  lowp vec3 vec_26;
  vec_26 = tmpvar_8;
  lowp float tmpvar_27;
  tmpvar_27 = (1.0 - (exp2(tmpvar_25) / 128.0));
  lowp float tmpvar_28;
  tmpvar_28 = max (max (abs(tmpvar_8.x), abs(tmpvar_8.y)), abs(tmpvar_8.z));
  lowp float tmpvar_29;
  tmpvar_29 = abs(tmpvar_8.x);
  if ((tmpvar_29 != tmpvar_28)) {
    vec_26.x = (tmpvar_8.x * tmpvar_27);
  };
  lowp float tmpvar_30;
  tmpvar_30 = abs(tmpvar_8.y);
  if ((tmpvar_30 != tmpvar_28)) {
    vec_26.y = (tmpvar_8.y * tmpvar_27);
  };
  lowp float tmpvar_31;
  tmpvar_31 = abs(tmpvar_8.z);
  if ((tmpvar_31 != tmpvar_28)) {
    vec_26.z = (tmpvar_8.z * tmpvar_27);
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
  tmpvar_34.xyz = (tmpvar_33 * tmpvar_33);
  tmpvar_34.w = material_reflectivity;
  dReflection = tmpvar_34;
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
    dAtten = (dAtten * max (dot (dNormalW,
      -(tmpvar_35)
    ), 0.0));
    vec4 projPos_42;
    vec4 tmpvar_43;
    tmpvar_43.w = 1.0;
    tmpvar_43.xyz = vPositionW;
    vec4 tmpvar_44;
    tmpvar_44 = (light0_shadowMatrix * tmpvar_43);
    projPos_42.zw = tmpvar_44.zw;
    projPos_42.xy = (tmpvar_44.xy / tmpvar_44.w);
    float Z_45;
    Z_45 = ((sqrt(
      dot (dLightDirW, dLightDirW)
    ) * light0_shadowParams.w) + light0_shadowParams.z);
    lowp vec4 tmpvar_46;
    tmpvar_46 = texture (light0_shadowMap, projPos_42.xy);
    lowp vec3 tmpvar_47;
    tmpvar_47.z = 0.0;
    tmpvar_47.x = ((tmpvar_46.y * 0.003921569) + tmpvar_46.x);
    tmpvar_47.y = ((tmpvar_46.w * 0.003921569) + tmpvar_46.z);
    float tmpvar_48;
    tmpvar_48 = (light0_shadowParams.y * Z_45);
    lowp float tmpvar_49;
    tmpvar_49 = max ((tmpvar_47.y - (tmpvar_47.x * tmpvar_47.x)), (tmpvar_48 * tmpvar_48));
    lowp float tmpvar_50;
    tmpvar_50 = (Z_45 - tmpvar_47.x);
    lowp float tmpvar_51;
    tmpvar_51 = clamp (((
      (tmpvar_49 / (tmpvar_49 + (tmpvar_50 * tmpvar_50)))
     - 0.1) / 0.9), 0.0, 1.0);
    lowp float tmpvar_52;
    if ((Z_45 <= tmpvar_47.x)) {
      tmpvar_52 = 1.0;
    } else {
      tmpvar_52 = tmpvar_51;
    };
    dAtten = (dAtten * tmpvar_52);
    dDiffuseLight = (dDiffuseLight + (dAtten * light0_color));
    lowp float tmpvar_53;
    tmpvar_53 = exp2((dGlossiness * 11.0));
    lowp float tmpvar_54;
    tmpvar_54 = max ((tmpvar_53 * mix (1.0,
      (1.0/((1.0 + (tmpvar_53 * (
        (1.0/(clamp (sqrt(dot (tmpvar_7, tmpvar_7)), 0.0, 1.0)))
       - 1.0)))))
    , material_bumpiness)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_35) + tmpvar_5)
      ), dNormalW), 0.0), tmpvar_54)
     *
      (tmpvar_54 + 2.0)
    ) / 8.0));
    dSpecularLight = (dAtten * light0_color);
  };
  dLightDirW = (vPositionW - light1_position);
  vec3 tmpvar_55;
  tmpvar_55 = normalize(dLightDirW);
  float falloff_56;
  float tmpvar_57;
  tmpvar_57 = dot (dLightDirW, dLightDirW);
  float tmpvar_58;
  tmpvar_58 = (1.0/(light1_radius));
  falloff_56 = ((1.0/((tmpvar_57 + 1.0))) * 16.0);
  float x_59;
  x_59 = (tmpvar_57 * (tmpvar_58 * tmpvar_58));
  float tmpvar_60;
  tmpvar_60 = clamp ((1.0 - (x_59 * x_59)), 0.0, 1.0);
  falloff_56 = (falloff_56 * (tmpvar_60 * tmpvar_60));
  dAtten = falloff_56;
  if ((falloff_56 > 1e-05)) {
    float tmpvar_61;
    tmpvar_61 = clamp (((
      dot (tmpvar_55, light1_direction)
     - light1_outerConeAngle) / (light1_innerConeAngle - light1_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_56 * (tmpvar_61 * (tmpvar_61 *
      (3.0 - (2.0 * tmpvar_61))
    )));
    dAtten = (dAtten * max (dot (dNormalW,
      -(tmpvar_55)
    ), 0.0));
    vec4 projPos_62;
    vec4 tmpvar_63;
    tmpvar_63.w = 1.0;
    tmpvar_63.xyz = vPositionW;
    vec4 tmpvar_64;
    tmpvar_64 = (light1_shadowMatrix * tmpvar_63);
    projPos_62.zw = tmpvar_64.zw;
    projPos_62.xy = (tmpvar_64.xy / tmpvar_64.w);
    float Z_65;
    Z_65 = ((sqrt(
      dot (dLightDirW, dLightDirW)
    ) * light1_shadowParams.w) + light1_shadowParams.z);
    lowp vec4 tmpvar_66;
    tmpvar_66 = texture (light1_shadowMap, projPos_62.xy);
    lowp vec3 tmpvar_67;
    tmpvar_67.z = 0.0;
    tmpvar_67.x = ((tmpvar_66.y * 0.003921569) + tmpvar_66.x);
    tmpvar_67.y = ((tmpvar_66.w * 0.003921569) + tmpvar_66.z);
    float tmpvar_68;
    tmpvar_68 = (light1_shadowParams.y * Z_65);
    lowp float tmpvar_69;
    tmpvar_69 = max ((tmpvar_67.y - (tmpvar_67.x * tmpvar_67.x)), (tmpvar_68 * tmpvar_68));
    lowp float tmpvar_70;
    tmpvar_70 = (Z_65 - tmpvar_67.x);
    lowp float tmpvar_71;
    tmpvar_71 = clamp (((
      (tmpvar_69 / (tmpvar_69 + (tmpvar_70 * tmpvar_70)))
     - 0.1) / 0.9), 0.0, 1.0);
    lowp float tmpvar_72;
    if ((Z_65 <= tmpvar_67.x)) {
      tmpvar_72 = 1.0;
    } else {
      tmpvar_72 = tmpvar_71;
    };
    dAtten = (dAtten * tmpvar_72);
    dDiffuseLight = (dDiffuseLight + (dAtten * light1_color));
    lowp float tmpvar_73;
    tmpvar_73 = exp2((dGlossiness * 11.0));
    lowp float tmpvar_74;
    tmpvar_74 = max ((tmpvar_73 * mix (1.0,
      (1.0/((1.0 + (tmpvar_73 * (
        (1.0/(clamp (sqrt(dot (tmpvar_7, tmpvar_7)), 0.0, 1.0)))
       - 1.0)))))
    , material_bumpiness)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_55) + tmpvar_5)
      ), dNormalW), 0.0), tmpvar_74)
     *
      (tmpvar_74 + 2.0)
    ) / 8.0));
    dSpecularLight = (dSpecularLight + (dAtten * light1_color));
  };
  dSpecularLight = (dSpecularLight * tmpvar_15.z);
  dReflection = (tmpvar_34 * tmpvar_15.z);
  vec3 tmpvar_75;
  tmpvar_75 = (vPositionW - leavesPos);
  vec2 tmpvar_76;
  tmpvar_76 = (((tmpvar_75.xz / vec2(16.0, -16.0)) * 0.5) + 0.5);
  topUv_4 = tmpvar_76;
  height_3 = 0.0;
  if ((((
    (tmpvar_75.x > -1.1)
   &&
    (tmpvar_75.x < 1.1)
  ) && (tmpvar_75.z > -1.1)) && (tmpvar_75.z < 1.1))) {
    height_3 = 1.0;
  };
  height_3 = ((height_3 / 4.0) + 0.01);
  shadow_2 = vec3(0.0, 0.0, 0.0);
  offsets_1[0] = vec2(-0.003196313, -0.00186043);
  offsets_1[1] = vec2(-0.002162161, -0.006022575);
  offsets_1[2] = vec2(-0.00398718, 0.002402105);
  offsets_1[3] = vec2(0.003552565, 0.00177002);
  offsets_1[4] = vec2(-0.0001136277, 0.005086533);
  offsets_1[5] = vec2(0.002264441, -0.003647392);
  offsets_1[6] = vec2(0.006564216, -0.002330364);
  offsets_1[7] = vec2(0.005495788, 0.005262966);
  if ((vNormalW.y > 0.0)) {
    for (highp int i_77 = 0; i_77 < 8; i_77++) {
      lowp vec4 tmpvar_78;
      tmpvar_78 = texture (topMap, (topUv_4 + offsets_1[i_77]));
      lowp float tmpvar_79;
      tmpvar_79 = tmpvar_78.w;
      lowp vec3 tmpvar_80;
      if ((height_3 < tmpvar_78.w)) {
        lowp vec3 tmpvar_81;
        tmpvar_81.xz = vec2(0.125, 1.0);
        tmpvar_81.y = tmpvar_79;
        tmpvar_80 = tmpvar_81;
      } else {
        tmpvar_80 = vec3(0.0, 0.0, 0.0);
      };
      shadow_2 = (shadow_2 + tmpvar_80);
    };
    shadow_2.x = (1.0 - (shadow_2.x * 0.3));
    shadow_2.y = (shadow_2.y / shadow_2.z);
    dDiffuseLight = (dDiffuseLight * mix (shadow_2.x, 1.0, clamp (shadow_2.y, 0.0, 1.0)));
    lowp vec4 tmpvar_82;
    tmpvar_82 = texture (topMap, tmpvar_76);
    dDiffuseLight = (dDiffuseLight * mix (1.0, (1.0 -
      clamp (((tmpvar_82.x - tmpvar_82.y) * 4.0), 0.0, 1.0)
    ), clamp (vNormalW.y, 0.0, 1.0)));
  };
  lowp vec3 tmpvar_83;
  tmpvar_83 = mix ((dAlbedo * dDiffuseLight), (dSpecularLight + (dReflection.xyz * dReflection.w)), dSpecularity);
  pc_fragColor.xyz = tmpvar_83;
  pc_fragColor.xyz = (pc_fragColor.xyz + material_emissive);
  vec3 tmpvar_84;
  tmpvar_84 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_84, tmpvar_84))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = 1.0;
  pc_fragColor.x += 0.6969628304152238;
}



