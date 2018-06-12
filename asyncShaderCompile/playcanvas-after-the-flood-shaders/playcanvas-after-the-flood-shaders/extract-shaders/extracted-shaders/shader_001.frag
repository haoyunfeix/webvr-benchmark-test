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
lowp vec3 dSpecularity;
lowp float dGlossiness;
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
  dReflection = vec4(0.0, 0.0, 0.0, 0.0);
  vec3 tmpvar_1;
  tmpvar_1 = normalize((view_position - vPositionW));
  mat3 tmpvar_2;
  tmpvar_2[uint(0)] = normalize(vTangentW);
  tmpvar_2[1u] = normalize(vBinormalW);
  tmpvar_2[2u] = normalize(vNormalW);
  dNormalW = (tmpvar_2 * normalize(mix (vec3(0.0, 0.0, 1.0),
    ((texture (texture_normalMap, vUV0_1).xyz * 2.0) - 1.0)
  , material_bumpiness)));
  lowp vec3 tmpvar_3;
  tmpvar_3 = normalize(((2.0 *
    (dot (dNormalW, tmpvar_1) * dNormalW)
  ) - tmpvar_1));
  lowp vec4 rgba_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture (texture_diffuseMap, vUV0_1);
  rgba_4.w = tmpvar_5.w;
  rgba_4.xyz = pow (tmpvar_5.xyz, vec3(2.2, 2.2, 2.2));
  lowp vec3 tmpvar_6;
  tmpvar_6 = mix (vec3(0.04, 0.04, 0.04), rgba_4.xyz, material_metalness);
  dAlbedo = (rgba_4.xyz * (1.0 - material_metalness));
  dGlossiness = ((material_shininess * texture (texture_glossMap, vUV0_1).y) + 1e-07);
  lowp float fresnel_7;
  lowp float tmpvar_8;
  tmpvar_8 = (1.0 - max (dot (dNormalW, tmpvar_1), 0.0));
  lowp float tmpvar_9;
  tmpvar_9 = (tmpvar_8 * tmpvar_8);
  fresnel_7 = (tmpvar_8 * (tmpvar_9 * tmpvar_9));
  fresnel_7 = (fresnel_7 * (dGlossiness * dGlossiness));
  dSpecularity = (tmpvar_6 + ((1.0 - tmpvar_6) * fresnel_7));
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
  vec_21 = tmpvar_3;
  lowp float tmpvar_22;
  tmpvar_22 = (1.0 - (exp2(tmpvar_20) / 128.0));
  lowp float tmpvar_23;
  tmpvar_23 = max (max (abs(tmpvar_3.x), abs(tmpvar_3.y)), abs(tmpvar_3.z));
  lowp float tmpvar_24;
  tmpvar_24 = abs(tmpvar_3.x);
  if ((tmpvar_24 != tmpvar_23)) {
    vec_21.x = (tmpvar_3.x * tmpvar_22);
  };
  lowp float tmpvar_25;
  tmpvar_25 = abs(tmpvar_3.y);
  if ((tmpvar_25 != tmpvar_23)) {
    vec_21.y = (tmpvar_3.y * tmpvar_22);
  };
  lowp float tmpvar_26;
  tmpvar_26 = abs(tmpvar_3.z);
  if ((tmpvar_26 != tmpvar_23)) {
    vec_21.z = (tmpvar_3.z * tmpvar_22);
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
  dReflection = (tmpvar_29 * tmpvar_10.z);
  lowp vec3 tmpvar_30;
  tmpvar_30 = mix ((dAlbedo * dDiffuseLight), (dReflection.xyz * dReflection.w), dSpecularity);
  pc_fragColor.xyz = tmpvar_30;
  pc_fragColor.xyz = (pc_fragColor.xyz + material_emissive);
  vec3 tmpvar_31;
  tmpvar_31 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_31, tmpvar_31))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = 1.0;
  pc_fragColor.x += 0.1243792267645436;
}



