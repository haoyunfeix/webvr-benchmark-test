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
lowp vec3 dSpecularity;
lowp float dGlossiness;
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
  vec3 tmpvar_1;
  tmpvar_1 = normalize((view_position - vPositionW));
  mat3 tmpvar_2;
  tmpvar_2[uint(0)] = normalize(vTangentW);
  tmpvar_2[1u] = normalize(vBinormalW);
  tmpvar_2[2u] = normalize(vNormalW);
  dNormalW = (tmpvar_2 * normalize(mix (vec3(0.0, 0.0, 1.0),
    ((texture (texture_normalMap, vUv0).xyz * 2.0) - 1.0)
  , material_bumpiness)));
  lowp vec3 tmpvar_3;
  tmpvar_3 = normalize(((2.0 *
    (dot (dNormalW, tmpvar_1) * dNormalW)
  ) - tmpvar_1));
  lowp vec4 rgba_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture (texture_diffuseMap, vUv0);
  rgba_4.w = tmpvar_5.w;
  rgba_4.xyz = pow (tmpvar_5.xyz, vec3(2.2, 2.2, 2.2));
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture (texture_specularMap, vUv0);
  dGlossiness = ((material_shininess * texture (texture_glossMap, vUv0).y) + 1e-07);
  lowp float fresnel_7;
  lowp float tmpvar_8;
  tmpvar_8 = (1.0 - max (dot (dNormalW, tmpvar_1), 0.0));
  lowp float tmpvar_9;
  tmpvar_9 = (tmpvar_8 * tmpvar_8);
  fresnel_7 = (tmpvar_8 * (tmpvar_9 * tmpvar_9));
  fresnel_7 = (fresnel_7 * (dGlossiness * dGlossiness));
  dSpecularity = (tmpvar_6.xxx + ((1.0 - tmpvar_6.xxx) * fresnel_7));
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
  dDiffuseLight = ((tmpvar_17 * tmpvar_17) * skyboxIntensity);
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
  vec_26 = tmpvar_3;
  lowp float tmpvar_27;
  tmpvar_27 = (1.0 - (exp2(tmpvar_25) / 128.0));
  lowp float tmpvar_28;
  tmpvar_28 = max (max (abs(tmpvar_3.x), abs(tmpvar_3.y)), abs(tmpvar_3.z));
  lowp float tmpvar_29;
  tmpvar_29 = abs(tmpvar_3.x);
  if ((tmpvar_29 != tmpvar_28)) {
    vec_26.x = (tmpvar_3.x * tmpvar_27);
  };
  lowp float tmpvar_30;
  tmpvar_30 = abs(tmpvar_3.y);
  if ((tmpvar_30 != tmpvar_28)) {
    vec_26.y = (tmpvar_3.y * tmpvar_27);
  };
  lowp float tmpvar_31;
  tmpvar_31 = abs(tmpvar_3.z);
  if ((tmpvar_31 != tmpvar_28)) {
    vec_26.z = (tmpvar_3.z * tmpvar_27);
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
  lowp vec3 tmpvar_35;
  tmpvar_35 = mix ((rgba_4.xyz * dDiffuseLight), (tmpvar_34.xyz * material_reflectivity), dSpecularity);
  pc_fragColor.xyz = tmpvar_35;
  pc_fragColor.xyz = (pc_fragColor.xyz + material_emissive);
  vec3 tmpvar_36;
  tmpvar_36 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_36, tmpvar_36))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = 1.0;
  pc_fragColor.x += 0.8554323666263253;
}



