#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
in vec3 vNormalW;
in vec2 vUV0_1;
uniform vec3 view_position;
lowp vec3 dDiffuseLight;
vec3 dSpecularity;
float dGlossiness;
uniform vec3 fog_color;
uniform float fog_density;
uniform float skyboxIntensity;
uniform sampler2D texture_diffuseMap;
uniform sampler2D texture_emissiveMap;
uniform float material_emissiveIntensity;
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
  tmpvar_5 = texture (texture_diffuseMap, vUV0_1);
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
  lowp vec3 tmpvar_34;
  tmpvar_34 = mix ((rgba_4.xyz * dDiffuseLight), (tmpvar_33.xyz * material_reflectivity), dSpecularity);
  pc_fragColor.xyz = tmpvar_34;
  lowp vec3 tmpvar_35;
  lowp vec4 rgba_36;
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture (texture_emissiveMap, vUV0_1);
  rgba_36.w = tmpvar_37.w;
  rgba_36.xyz = pow (tmpvar_37.xyz, vec3(2.2, 2.2, 2.2));
  tmpvar_35 = (rgba_36.xyz * material_emissiveIntensity);
  pc_fragColor.xyz = (pc_fragColor.xyz + tmpvar_35);
  vec3 tmpvar_38;
  tmpvar_38 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_38, tmpvar_38))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = 1.0;
  pc_fragColor.x += 0.8932400860623806;
}



