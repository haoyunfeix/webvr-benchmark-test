#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
in vec3 vNormalW;
in vec3 vTangentW;
in vec3 vBinormalW;
in vec2 vUv0;
in vec2 vUv1;
uniform vec3 view_position;
lowp vec4 dReflection;
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
uniform sampler2D texture_specularMap;
uniform vec3 material_specular;
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
void main ()
{
  dSpecularLight = vec3(0.0, 0.0, 0.0);
  dReflection = vec4(0.0, 0.0, 0.0, 0.0);
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
  dSpecularity = (texture (texture_specularMap, vUv0).xyz * material_specular);
  dGlossiness = ((material_shininess * texture (texture_glossMap, vUv0).y) + 1e-07);
  lowp float fresnel_7;
  lowp float tmpvar_8;
  tmpvar_8 = (1.0 - max (dot (dNormalW, tmpvar_1), 0.0));
  lowp float tmpvar_9;
  tmpvar_9 = (tmpvar_8 * tmpvar_8);
  fresnel_7 = (tmpvar_8 * (tmpvar_9 * tmpvar_9));
  fresnel_7 = (fresnel_7 * (dGlossiness * dGlossiness));
  dSpecularity = (dSpecularity + ((1.0 - dSpecularity) * fresnel_7));
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (texture_aoMap, vUv1);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (texture_lightMap, vUv1);
  lowp vec3 tmpvar_12;
  tmpvar_12 = ((8.0 * tmpvar_11.w) * tmpvar_11.xyz);
  dDiffuseLight = (tmpvar_12 * tmpvar_12);
  lowp vec4 cube_0_14;
  lowp vec4 cube_1_15;
  lowp vec4 cubes_16[6];
  lowp vec3 fixedReflDir_17;
  lowp int index2_18;
  lowp int index1_19;
  lowp float tmpvar_20;
  tmpvar_20 = (clamp ((1.0 - dGlossiness), 0.0, 1.0) * 5.0);
  index1_19 = int(tmpvar_20);
  index2_18 = int(min ((tmpvar_20 + 1.0), 7.0));
  lowp vec3 vec_21;
  vec_21 = tmpvar_4;
  lowp float tmpvar_22;
  tmpvar_22 = (1.0 - (exp2(tmpvar_20) / 128.0));
  lowp float tmpvar_23;
  tmpvar_23 = max (max (abs(tmpvar_4.x), abs(tmpvar_4.y)), abs(tmpvar_4.z));
  lowp float tmpvar_24;
  tmpvar_24 = abs(tmpvar_4.x);
  if ((tmpvar_24 != tmpvar_23)) {
    vec_21.x = (tmpvar_4.x * tmpvar_22);
  };
  lowp float tmpvar_25;
  tmpvar_25 = abs(tmpvar_4.y);
  if ((tmpvar_25 != tmpvar_23)) {
    vec_21.y = (tmpvar_4.y * tmpvar_22);
  };
  lowp float tmpvar_26;
  tmpvar_26 = abs(tmpvar_4.z);
  if ((tmpvar_26 != tmpvar_23)) {
    vec_21.z = (tmpvar_4.z * tmpvar_22);
  };
  fixedReflDir_17.yz = vec_21.yz;
  fixedReflDir_17.x = -(vec_21.x);
  cubes_16[0] = texture (texture_prefilteredCubeMap128, fixedReflDir_17);
  cubes_16[1] = texture (texture_prefilteredCubeMap64, fixedReflDir_17);
  cubes_16[2] = texture (texture_prefilteredCubeMap32, fixedReflDir_17);
  cubes_16[3] = texture (texture_prefilteredCubeMap16, fixedReflDir_17);
  cubes_16[4] = texture (texture_prefilteredCubeMap8, fixedReflDir_17);
  cubes_16[5] = texture (texture_prefilteredCubeMap4, fixedReflDir_17);
  for (highp int i_13 = 0; i_13 < 6; i_13++) {
    if ((i_13 == index1_19)) {
      cube_0_14 = cubes_16[i_13];
    };
    if ((i_13 == index2_18)) {
      cube_1_15 = cubes_16[i_13];
    };
  };
  lowp vec4 tmpvar_27;
  tmpvar_27 = mix (cube_0_14, cube_1_15, fract(tmpvar_20));
  lowp vec3 tmpvar_28;
  tmpvar_28 = ((8.0 * tmpvar_27.w) * tmpvar_27.xyz);
  lowp vec4 tmpvar_29;
  tmpvar_29.xyz = (tmpvar_28 * tmpvar_28);
  tmpvar_29.w = material_reflectivity;
  dReflection = tmpvar_29;
  dLightDirW = (vPositionW - light0_position);
  vec3 tmpvar_30;
  tmpvar_30 = normalize(dLightDirW);
  float falloff_31;
  float tmpvar_32;
  tmpvar_32 = dot (dLightDirW, dLightDirW);
  float tmpvar_33;
  tmpvar_33 = (1.0/(light0_radius));
  falloff_31 = ((1.0/((tmpvar_32 + 1.0))) * 16.0);
  float x_34;
  x_34 = (tmpvar_32 * (tmpvar_33 * tmpvar_33));
  float tmpvar_35;
  tmpvar_35 = clamp ((1.0 - (x_34 * x_34)), 0.0, 1.0);
  falloff_31 = (falloff_31 * (tmpvar_35 * tmpvar_35));
  dAtten = falloff_31;
  if ((falloff_31 > 1e-05)) {
    float tmpvar_36;
    tmpvar_36 = clamp (((
      dot (tmpvar_30, light0_direction)
     - light0_outerConeAngle) / (light0_innerConeAngle - light0_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_31 * (tmpvar_36 * (tmpvar_36 *
      (3.0 - (2.0 * tmpvar_36))
    )));
    dAtten = (dAtten * max (dot (dNormalW,
      -(tmpvar_30)
    ), 0.0));
    vec4 projPos_37;
    vec4 tmpvar_38;
    tmpvar_38.w = 1.0;
    tmpvar_38.xyz = vPositionW;
    vec4 tmpvar_39;
    tmpvar_39 = (light0_shadowMatrix * tmpvar_38);
    projPos_37.zw = tmpvar_39.zw;
    projPos_37.xy = (tmpvar_39.xy / tmpvar_39.w);
    float Z_40;
    Z_40 = ((sqrt(
      dot (dLightDirW, dLightDirW)
    ) * light0_shadowParams.w) + light0_shadowParams.z);
    lowp vec4 tmpvar_41;
    tmpvar_41 = texture (light0_shadowMap, projPos_37.xy);
    lowp vec3 tmpvar_42;
    tmpvar_42.z = 0.0;
    tmpvar_42.x = ((tmpvar_41.y * 0.003921569) + tmpvar_41.x);
    tmpvar_42.y = ((tmpvar_41.w * 0.003921569) + tmpvar_41.z);
    float tmpvar_43;
    tmpvar_43 = (light0_shadowParams.y * Z_40);
    lowp float tmpvar_44;
    tmpvar_44 = max ((tmpvar_42.y - (tmpvar_42.x * tmpvar_42.x)), (tmpvar_43 * tmpvar_43));
    lowp float tmpvar_45;
    tmpvar_45 = (Z_40 - tmpvar_42.x);
    lowp float tmpvar_46;
    tmpvar_46 = clamp (((
      (tmpvar_44 / (tmpvar_44 + (tmpvar_45 * tmpvar_45)))
     - 0.1) / 0.9), 0.0, 1.0);
    lowp float tmpvar_47;
    if ((Z_40 <= tmpvar_42.x)) {
      tmpvar_47 = 1.0;
    } else {
      tmpvar_47 = tmpvar_46;
    };
    dAtten = (dAtten * tmpvar_47);
    dDiffuseLight = (dDiffuseLight + (dAtten * light0_color));
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
        (-(tmpvar_30) + tmpvar_1)
      ), dNormalW), 0.0), tmpvar_49)
     *
      (tmpvar_49 + 2.0)
    ) / 8.0));
    dSpecularLight = (dAtten * light0_color);
  };
  dLightDirW = (vPositionW - light1_position);
  vec3 tmpvar_50;
  tmpvar_50 = normalize(dLightDirW);
  float falloff_51;
  float tmpvar_52;
  tmpvar_52 = dot (dLightDirW, dLightDirW);
  float tmpvar_53;
  tmpvar_53 = (1.0/(light1_radius));
  falloff_51 = ((1.0/((tmpvar_52 + 1.0))) * 16.0);
  float x_54;
  x_54 = (tmpvar_52 * (tmpvar_53 * tmpvar_53));
  float tmpvar_55;
  tmpvar_55 = clamp ((1.0 - (x_54 * x_54)), 0.0, 1.0);
  falloff_51 = (falloff_51 * (tmpvar_55 * tmpvar_55));
  dAtten = falloff_51;
  if ((falloff_51 > 1e-05)) {
    float tmpvar_56;
    tmpvar_56 = clamp (((
      dot (tmpvar_50, light1_direction)
     - light1_outerConeAngle) / (light1_innerConeAngle - light1_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_51 * (tmpvar_56 * (tmpvar_56 *
      (3.0 - (2.0 * tmpvar_56))
    )));
    dAtten = (dAtten * max (dot (dNormalW,
      -(tmpvar_50)
    ), 0.0));
    vec4 projPos_57;
    vec4 tmpvar_58;
    tmpvar_58.w = 1.0;
    tmpvar_58.xyz = vPositionW;
    vec4 tmpvar_59;
    tmpvar_59 = (light1_shadowMatrix * tmpvar_58);
    projPos_57.zw = tmpvar_59.zw;
    projPos_57.xy = (tmpvar_59.xy / tmpvar_59.w);
    float Z_60;
    Z_60 = ((sqrt(
      dot (dLightDirW, dLightDirW)
    ) * light1_shadowParams.w) + light1_shadowParams.z);
    lowp vec4 tmpvar_61;
    tmpvar_61 = texture (light1_shadowMap, projPos_57.xy);
    lowp vec3 tmpvar_62;
    tmpvar_62.z = 0.0;
    tmpvar_62.x = ((tmpvar_61.y * 0.003921569) + tmpvar_61.x);
    tmpvar_62.y = ((tmpvar_61.w * 0.003921569) + tmpvar_61.z);
    float tmpvar_63;
    tmpvar_63 = (light1_shadowParams.y * Z_60);
    lowp float tmpvar_64;
    tmpvar_64 = max ((tmpvar_62.y - (tmpvar_62.x * tmpvar_62.x)), (tmpvar_63 * tmpvar_63));
    lowp float tmpvar_65;
    tmpvar_65 = (Z_60 - tmpvar_62.x);
    lowp float tmpvar_66;
    tmpvar_66 = clamp (((
      (tmpvar_64 / (tmpvar_64 + (tmpvar_65 * tmpvar_65)))
     - 0.1) / 0.9), 0.0, 1.0);
    lowp float tmpvar_67;
    if ((Z_60 <= tmpvar_62.x)) {
      tmpvar_67 = 1.0;
    } else {
      tmpvar_67 = tmpvar_66;
    };
    dAtten = (dAtten * tmpvar_67);
    dDiffuseLight = (dDiffuseLight + (dAtten * light1_color));
    lowp float tmpvar_68;
    tmpvar_68 = exp2((dGlossiness * 11.0));
    lowp float tmpvar_69;
    tmpvar_69 = max ((tmpvar_68 * mix (1.0,
      (1.0/((1.0 + (tmpvar_68 * (
        (1.0/(clamp (sqrt(dot (tmpvar_3, tmpvar_3)), 0.0, 1.0)))
       - 1.0)))))
    , material_bumpiness)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_50) + tmpvar_1)
      ), dNormalW), 0.0), tmpvar_69)
     *
      (tmpvar_69 + 2.0)
    ) / 8.0));
    dSpecularLight = (dSpecularLight + (dAtten * light1_color));
  };
  dSpecularLight = (dSpecularLight * tmpvar_10.z);
  dReflection = (tmpvar_29 * tmpvar_10.z);
  lowp vec3 tmpvar_70;
  tmpvar_70 = mix ((rgba_5.xyz * dDiffuseLight), (dSpecularLight + (dReflection.xyz * dReflection.w)), dSpecularity);
  pc_fragColor.xyz = tmpvar_70;
  pc_fragColor.xyz = (pc_fragColor.xyz + material_emissive);
  vec3 tmpvar_71;
  tmpvar_71 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_71, tmpvar_71))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = 1.0;
  pc_fragColor.x += 0.3706201844143002;
}



