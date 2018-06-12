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
uniform sampler2D topMap;
uniform vec3 leavesPos;
void main ()
{
  vec2 offsets_1[8];
  lowp vec3 shadow_2;
  float height_3;
  vec2 topUv_4;
  dReflection = vec4(0.0, 0.0, 0.0, 0.0);
  vec3 tmpvar_5;
  tmpvar_5 = normalize((view_position - vPositionW));
  mat3 tmpvar_6;
  tmpvar_6[uint(0)] = normalize(vTangentW);
  tmpvar_6[1u] = normalize(vBinormalW);
  tmpvar_6[2u] = normalize(vNormalW);
  dNormalW = (tmpvar_6 * normalize(mix (vec3(0.0, 0.0, 1.0),
    ((texture (texture_normalMap, vUV0_1).xyz * 2.0) - 1.0)
  , material_bumpiness)));
  lowp vec3 tmpvar_7;
  tmpvar_7 = normalize(((2.0 *
    (dot (dNormalW, tmpvar_5) * dNormalW)
  ) - tmpvar_5));
  lowp vec4 rgba_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (texture_diffuseMap, vUV0_1);
  rgba_8.w = tmpvar_9.w;
  rgba_8.xyz = pow (tmpvar_9.xyz, vec3(2.2, 2.2, 2.2));
  lowp vec3 tmpvar_10;
  tmpvar_10 = mix (vec3(0.04, 0.04, 0.04), rgba_8.xyz, material_metalness);
  dAlbedo = (rgba_8.xyz * (1.0 - material_metalness));
  dGlossiness = ((material_shininess * texture (texture_glossMap, vUV0_1).y) + 1e-07);
  lowp float fresnel_11;
  lowp float tmpvar_12;
  tmpvar_12 = (1.0 - max (dot (dNormalW, tmpvar_5), 0.0));
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_12 * tmpvar_12);
  fresnel_11 = (tmpvar_12 * (tmpvar_13 * tmpvar_13));
  fresnel_11 = (fresnel_11 * (dGlossiness * dGlossiness));
  dSpecularity = (tmpvar_10 + ((1.0 - tmpvar_10) * fresnel_11));
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture (texture_aoMap, vUv1);
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture (texture_lightMap, vUv1);
  lowp vec3 tmpvar_16;
  tmpvar_16 = ((8.0 * tmpvar_15.w) * tmpvar_15.xyz);
  dDiffuseLight = (tmpvar_16 * tmpvar_16);
  lowp vec4 cube_0_18;
  lowp vec4 cube_1_19;
  lowp vec4 cubes_20[6];
  lowp vec3 fixedReflDir_21;
  lowp int index2_22;
  lowp int index1_23;
  lowp float tmpvar_24;
  tmpvar_24 = (clamp ((1.0 - dGlossiness), 0.0, 1.0) * 5.0);
  index1_23 = int(tmpvar_24);
  index2_22 = int(min ((tmpvar_24 + 1.0), 7.0));
  lowp vec3 vec_25;
  vec_25 = tmpvar_7;
  lowp float tmpvar_26;
  tmpvar_26 = (1.0 - (exp2(tmpvar_24) / 128.0));
  lowp float tmpvar_27;
  tmpvar_27 = max (max (abs(tmpvar_7.x), abs(tmpvar_7.y)), abs(tmpvar_7.z));
  lowp float tmpvar_28;
  tmpvar_28 = abs(tmpvar_7.x);
  if ((tmpvar_28 != tmpvar_27)) {
    vec_25.x = (tmpvar_7.x * tmpvar_26);
  };
  lowp float tmpvar_29;
  tmpvar_29 = abs(tmpvar_7.y);
  if ((tmpvar_29 != tmpvar_27)) {
    vec_25.y = (tmpvar_7.y * tmpvar_26);
  };
  lowp float tmpvar_30;
  tmpvar_30 = abs(tmpvar_7.z);
  if ((tmpvar_30 != tmpvar_27)) {
    vec_25.z = (tmpvar_7.z * tmpvar_26);
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
  tmpvar_33.xyz = (tmpvar_32 * tmpvar_32);
  tmpvar_33.w = material_reflectivity;
  dReflection = (tmpvar_33 * tmpvar_14.z);
  vec3 tmpvar_34;
  tmpvar_34 = (vPositionW - leavesPos);
  vec2 tmpvar_35;
  tmpvar_35 = (((tmpvar_34.xz / vec2(16.0, -16.0)) * 0.5) + 0.5);
  topUv_4 = tmpvar_35;
  height_3 = 0.0;
  if ((((
    (tmpvar_34.x > -1.1)
   &&
    (tmpvar_34.x < 1.1)
  ) && (tmpvar_34.z > -1.1)) && (tmpvar_34.z < 1.1))) {
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
    for (highp int i_36 = 0; i_36 < 8; i_36++) {
      lowp vec4 tmpvar_37;
      tmpvar_37 = texture (topMap, (topUv_4 + offsets_1[i_36]));
      lowp float tmpvar_38;
      tmpvar_38 = tmpvar_37.w;
      lowp vec3 tmpvar_39;
      if ((height_3 < tmpvar_37.w)) {
        lowp vec3 tmpvar_40;
        tmpvar_40.xz = vec2(0.125, 1.0);
        tmpvar_40.y = tmpvar_38;
        tmpvar_39 = tmpvar_40;
      } else {
        tmpvar_39 = vec3(0.0, 0.0, 0.0);
      };
      shadow_2 = (shadow_2 + tmpvar_39);
    };
    shadow_2.x = (1.0 - (shadow_2.x * 0.3));
    shadow_2.y = (shadow_2.y / shadow_2.z);
    dDiffuseLight = (dDiffuseLight * mix (shadow_2.x, 1.0, clamp (shadow_2.y, 0.0, 1.0)));
    lowp vec4 tmpvar_41;
    tmpvar_41 = texture (topMap, tmpvar_35);
    dDiffuseLight = (dDiffuseLight * mix (1.0, (1.0 -
      clamp (((tmpvar_41.x - tmpvar_41.y) * 4.0), 0.0, 1.0)
    ), clamp (vNormalW.y, 0.0, 1.0)));
  };
  lowp vec3 tmpvar_42;
  tmpvar_42 = mix ((dAlbedo * dDiffuseLight), (dReflection.xyz * dReflection.w), dSpecularity);
  pc_fragColor.xyz = tmpvar_42;
  pc_fragColor.xyz = (pc_fragColor.xyz + material_emissive);
  vec3 tmpvar_43;
  tmpvar_43 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_43, tmpvar_43))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = 1.0;
  pc_fragColor.x += 0.8298074158538467;
}



