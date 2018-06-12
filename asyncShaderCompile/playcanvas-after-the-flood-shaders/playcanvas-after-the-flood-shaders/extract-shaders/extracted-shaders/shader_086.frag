#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
in vec3 vNormalW;
uniform vec3 view_position;
lowp vec3 dDiffuseLight;
vec3 dSpecularity;
float dGlossiness;
uniform vec3 fog_color;
uniform float fog_density;
uniform float skyboxIntensity;
uniform vec3 material_diffuse;
uniform vec3 material_emissive;
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
  dGlossiness = (material_shininess + 1e-07);
  float fresnel_4;
  float tmpvar_5;
  tmpvar_5 = (1.0 - max (dot (tmpvar_2, tmpvar_1), 0.0));
  float tmpvar_6;
  tmpvar_6 = (tmpvar_5 * tmpvar_5);
  fresnel_4 = (tmpvar_5 * (tmpvar_6 * tmpvar_6));
  fresnel_4 = (fresnel_4 * (dGlossiness * dGlossiness));
  dSpecularity = (material_specular + ((1.0 - material_specular) * fresnel_4));
  vec3 fixedReflDir_7;
  vec3 vec_8;
  vec_8 = tmpvar_2;
  float tmpvar_9;
  tmpvar_9 = max (max (abs(tmpvar_2.x), abs(tmpvar_2.y)), abs(tmpvar_2.z));
  float tmpvar_10;
  tmpvar_10 = abs(tmpvar_2.x);
  if ((tmpvar_10 != tmpvar_9)) {
    vec_8.x = (tmpvar_2.x * 0.75);
  };
  float tmpvar_11;
  tmpvar_11 = abs(tmpvar_2.y);
  if ((tmpvar_11 != tmpvar_9)) {
    vec_8.y = (tmpvar_2.y * 0.75);
  };
  float tmpvar_12;
  tmpvar_12 = abs(tmpvar_2.z);
  if ((tmpvar_12 != tmpvar_9)) {
    vec_8.z = (tmpvar_2.z * 0.75);
  };
  fixedReflDir_7.yz = vec_8.yz;
  fixedReflDir_7.x = -(vec_8.x);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture (texture_prefilteredCubeMap4, fixedReflDir_7);
  lowp vec3 tmpvar_14;
  tmpvar_14 = ((8.0 * tmpvar_13.w) * tmpvar_13.xyz);
  dDiffuseLight = ((tmpvar_14 * tmpvar_14) * skyboxIntensity);
  lowp vec4 cube_0_16;
  lowp vec4 cube_1_17;
  lowp vec4 cubes_18[6];
  vec3 fixedReflDir_19;
  highp int index2_20;
  highp int index1_21;
  float tmpvar_22;
  tmpvar_22 = (clamp ((1.0 - dGlossiness), 0.0, 1.0) * 5.0);
  index1_21 = int(tmpvar_22);
  index2_20 = int(min ((tmpvar_22 + 1.0), 7.0));
  vec3 vec_23;
  vec_23 = tmpvar_3;
  float tmpvar_24;
  tmpvar_24 = (1.0 - (exp2(tmpvar_22) / 128.0));
  float tmpvar_25;
  tmpvar_25 = max (max (abs(tmpvar_3.x), abs(tmpvar_3.y)), abs(tmpvar_3.z));
  float tmpvar_26;
  tmpvar_26 = abs(tmpvar_3.x);
  if ((tmpvar_26 != tmpvar_25)) {
    vec_23.x = (tmpvar_3.x * tmpvar_24);
  };
  float tmpvar_27;
  tmpvar_27 = abs(tmpvar_3.y);
  if ((tmpvar_27 != tmpvar_25)) {
    vec_23.y = (tmpvar_3.y * tmpvar_24);
  };
  float tmpvar_28;
  tmpvar_28 = abs(tmpvar_3.z);
  if ((tmpvar_28 != tmpvar_25)) {
    vec_23.z = (tmpvar_3.z * tmpvar_24);
  };
  fixedReflDir_19.yz = vec_23.yz;
  fixedReflDir_19.x = -(vec_23.x);
  cubes_18[0] = texture (texture_prefilteredCubeMap128, fixedReflDir_19);
  cubes_18[1] = texture (texture_prefilteredCubeMap64, fixedReflDir_19);
  cubes_18[2] = texture (texture_prefilteredCubeMap32, fixedReflDir_19);
  cubes_18[3] = texture (texture_prefilteredCubeMap16, fixedReflDir_19);
  cubes_18[4] = texture (texture_prefilteredCubeMap8, fixedReflDir_19);
  cubes_18[5] = texture (texture_prefilteredCubeMap4, fixedReflDir_19);
  for (highp int i_15 = 0; i_15 < 6; i_15++) {
    if ((i_15 == index1_21)) {
      cube_0_16 = cubes_18[i_15];
    };
    if ((i_15 == index2_20)) {
      cube_1_17 = cubes_18[i_15];
    };
  };
  lowp vec4 tmpvar_29;
  tmpvar_29 = mix (cube_0_16, cube_1_17, fract(tmpvar_22));
  lowp vec3 tmpvar_30;
  tmpvar_30 = ((8.0 * tmpvar_29.w) * tmpvar_29.xyz);
  lowp vec4 tmpvar_31;
  tmpvar_31.xyz = ((tmpvar_30 * tmpvar_30) * skyboxIntensity);
  tmpvar_31.w = material_reflectivity;
  lowp vec3 tmpvar_32;
  tmpvar_32 = mix ((material_diffuse * dDiffuseLight), (tmpvar_31.xyz * material_reflectivity), dSpecularity);
  pc_fragColor.xyz = tmpvar_32;
  pc_fragColor.xyz = (pc_fragColor.xyz + material_emissive);
  vec3 tmpvar_33;
  tmpvar_33 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_33, tmpvar_33))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = 1.0;
  pc_fragColor.x += 0.06961011547827134;
}



