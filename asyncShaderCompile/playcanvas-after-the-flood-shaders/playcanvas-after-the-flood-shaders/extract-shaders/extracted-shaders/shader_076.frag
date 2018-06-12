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
  tmpvar_3 = ((texture (texture_normalMap, vUV0_1).xyz * 2.0) - 1.0);
  dNormalW = (tmpvar_2 * normalize(mix (vec3(0.0, 0.0, 1.0), tmpvar_3, material_bumpiness)));
  lowp vec3 tmpvar_4;
  tmpvar_4 = normalize(((2.0 *
    (dot (dNormalW, tmpvar_1) * dNormalW)
  ) - tmpvar_1));
  lowp vec4 rgba_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture (texture_diffuseMap, vUV0_1);
  rgba_5.w = tmpvar_6.w;
  rgba_5.xyz = pow (tmpvar_6.xyz, vec3(2.2, 2.2, 2.2));
  lowp vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.04, 0.04, 0.04), rgba_5.xyz, material_metalness);
  dAlbedo = (rgba_5.xyz * (1.0 - material_metalness));
  dGlossiness = ((material_shininess * texture (texture_glossMap, vUV0_1).y) + 1e-07);
  lowp float fresnel_8;
  lowp float tmpvar_9;
  tmpvar_9 = (1.0 - max (dot (dNormalW, tmpvar_1), 0.0));
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_9 * tmpvar_9);
  fresnel_8 = (tmpvar_9 * (tmpvar_10 * tmpvar_10));
  fresnel_8 = (fresnel_8 * (dGlossiness * dGlossiness));
  dSpecularity = (tmpvar_7 + ((1.0 - tmpvar_7) * fresnel_8));
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (texture_aoMap, vUv1);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (texture_lightMap, vUv1);
  lowp vec3 tmpvar_13;
  tmpvar_13 = ((8.0 * tmpvar_12.w) * tmpvar_12.xyz);
  dDiffuseLight = (tmpvar_13 * tmpvar_13);
  lowp vec4 cube_0_15;
  lowp vec4 cube_1_16;
  lowp vec4 cubes_17[6];
  lowp vec3 fixedReflDir_18;
  lowp int index2_19;
  lowp int index1_20;
  lowp float tmpvar_21;
  tmpvar_21 = (clamp ((1.0 - dGlossiness), 0.0, 1.0) * 5.0);
  index1_20 = int(tmpvar_21);
  index2_19 = int(min ((tmpvar_21 + 1.0), 7.0));
  lowp vec3 vec_22;
  vec_22 = tmpvar_4;
  lowp float tmpvar_23;
  tmpvar_23 = (1.0 - (exp2(tmpvar_21) / 128.0));
  lowp float tmpvar_24;
  tmpvar_24 = max (max (abs(tmpvar_4.x), abs(tmpvar_4.y)), abs(tmpvar_4.z));
  lowp float tmpvar_25;
  tmpvar_25 = abs(tmpvar_4.x);
  if ((tmpvar_25 != tmpvar_24)) {
    vec_22.x = (tmpvar_4.x * tmpvar_23);
  };
  lowp float tmpvar_26;
  tmpvar_26 = abs(tmpvar_4.y);
  if ((tmpvar_26 != tmpvar_24)) {
    vec_22.y = (tmpvar_4.y * tmpvar_23);
  };
  lowp float tmpvar_27;
  tmpvar_27 = abs(tmpvar_4.z);
  if ((tmpvar_27 != tmpvar_24)) {
    vec_22.z = (tmpvar_4.z * tmpvar_23);
  };
  fixedReflDir_18.yz = vec_22.yz;
  fixedReflDir_18.x = -(vec_22.x);
  cubes_17[0] = texture (texture_prefilteredCubeMap128, fixedReflDir_18);
  cubes_17[1] = texture (texture_prefilteredCubeMap64, fixedReflDir_18);
  cubes_17[2] = texture (texture_prefilteredCubeMap32, fixedReflDir_18);
  cubes_17[3] = texture (texture_prefilteredCubeMap16, fixedReflDir_18);
  cubes_17[4] = texture (texture_prefilteredCubeMap8, fixedReflDir_18);
  cubes_17[5] = texture (texture_prefilteredCubeMap4, fixedReflDir_18);
  for (highp int i_14 = 0; i_14 < 6; i_14++) {
    if ((i_14 == index1_20)) {
      cube_0_15 = cubes_17[i_14];
    };
    if ((i_14 == index2_19)) {
      cube_1_16 = cubes_17[i_14];
    };
  };
  lowp vec4 tmpvar_28;
  tmpvar_28 = mix (cube_0_15, cube_1_16, fract(tmpvar_21));
  lowp vec3 tmpvar_29;
  tmpvar_29 = ((8.0 * tmpvar_28.w) * tmpvar_28.xyz);
  lowp vec4 tmpvar_30;
  tmpvar_30.xyz = (tmpvar_29 * tmpvar_29);
  tmpvar_30.w = material_reflectivity;
  dReflection = tmpvar_30;
  dLightDirW = (vPositionW - light0_position);
  vec3 tmpvar_31;
  tmpvar_31 = normalize(dLightDirW);
  float falloff_32;
  float tmpvar_33;
  tmpvar_33 = dot (dLightDirW, dLightDirW);
  float tmpvar_34;
  tmpvar_34 = (1.0/(light0_radius));
  falloff_32 = ((1.0/((tmpvar_33 + 1.0))) * 16.0);
  float x_35;
  x_35 = (tmpvar_33 * (tmpvar_34 * tmpvar_34));
  float tmpvar_36;
  tmpvar_36 = clamp ((1.0 - (x_35 * x_35)), 0.0, 1.0);
  falloff_32 = (falloff_32 * (tmpvar_36 * tmpvar_36));
  dAtten = falloff_32;
  if ((falloff_32 > 1e-05)) {
    float tmpvar_37;
    tmpvar_37 = clamp (((
      dot (tmpvar_31, light0_direction)
     - light0_outerConeAngle) / (light0_innerConeAngle - light0_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_32 * (tmpvar_37 * (tmpvar_37 *
      (3.0 - (2.0 * tmpvar_37))
    )));
    dAtten = (dAtten * max (dot (dNormalW,
      -(tmpvar_31)
    ), 0.0));
    vec4 projPos_38;
    vec4 tmpvar_39;
    tmpvar_39.w = 1.0;
    tmpvar_39.xyz = vPositionW;
    vec4 tmpvar_40;
    tmpvar_40 = (light0_shadowMatrix * tmpvar_39);
    projPos_38.zw = tmpvar_40.zw;
    projPos_38.xy = (tmpvar_40.xy / tmpvar_40.w);
    float Z_41;
    Z_41 = ((sqrt(
      dot (dLightDirW, dLightDirW)
    ) * light0_shadowParams.w) + light0_shadowParams.z);
    lowp vec4 tmpvar_42;
    tmpvar_42 = texture (light0_shadowMap, projPos_38.xy);
    lowp vec3 tmpvar_43;
    tmpvar_43.z = 0.0;
    tmpvar_43.x = ((tmpvar_42.y * 0.003921569) + tmpvar_42.x);
    tmpvar_43.y = ((tmpvar_42.w * 0.003921569) + tmpvar_42.z);
    float tmpvar_44;
    tmpvar_44 = (light0_shadowParams.y * Z_41);
    lowp float tmpvar_45;
    tmpvar_45 = max ((tmpvar_43.y - (tmpvar_43.x * tmpvar_43.x)), (tmpvar_44 * tmpvar_44));
    lowp float tmpvar_46;
    tmpvar_46 = (Z_41 - tmpvar_43.x);
    lowp float tmpvar_47;
    tmpvar_47 = clamp (((
      (tmpvar_45 / (tmpvar_45 + (tmpvar_46 * tmpvar_46)))
     - 0.1) / 0.9), 0.0, 1.0);
    lowp float tmpvar_48;
    if ((Z_41 <= tmpvar_43.x)) {
      tmpvar_48 = 1.0;
    } else {
      tmpvar_48 = tmpvar_47;
    };
    dAtten = (dAtten * tmpvar_48);
    dDiffuseLight = (dDiffuseLight + (dAtten * light0_color));
    lowp float tmpvar_49;
    tmpvar_49 = exp2((dGlossiness * 11.0));
    lowp float tmpvar_50;
    tmpvar_50 = max ((tmpvar_49 * mix (1.0,
      (1.0/((1.0 + (tmpvar_49 * (
        (1.0/(clamp (sqrt(dot (tmpvar_3, tmpvar_3)), 0.0, 1.0)))
       - 1.0)))))
    , material_bumpiness)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_31) + tmpvar_1)
      ), dNormalW), 0.0), tmpvar_50)
     *
      (tmpvar_50 + 2.0)
    ) / 8.0));
    dSpecularLight = (dAtten * light0_color);
  };
  dSpecularLight = (dSpecularLight * tmpvar_11.z);
  dReflection = (tmpvar_30 * tmpvar_11.z);
  lowp vec3 tmpvar_51;
  tmpvar_51 = mix ((dAlbedo * dDiffuseLight), (dSpecularLight + (dReflection.xyz * dReflection.w)), dSpecularity);
  pc_fragColor.xyz = tmpvar_51;
  pc_fragColor.xyz = (pc_fragColor.xyz + material_emissive);
  vec3 tmpvar_52;
  tmpvar_52 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_52, tmpvar_52))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = 1.0;
  pc_fragColor.x += 0.5726263774766198;
}



