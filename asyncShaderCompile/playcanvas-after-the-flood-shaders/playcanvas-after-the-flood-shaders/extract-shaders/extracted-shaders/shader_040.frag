#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
in vec3 vNormalW;
in vec2 vUv0;
uniform vec3 view_position;
vec3 dSpecularity;
float dGlossiness;
uniform vec3 fog_color;
uniform float fog_density;
uniform sampler2D texture_diffuseMap;
uniform sampler2D texture_emissiveMap;
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
  tmpvar_5 = texture (texture_diffuseMap, vUv0);
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
  lowp vec3 tmpvar_17;
  tmpvar_17 = ((8.0 * tmpvar_15.w) * tmpvar_15.xyz);
  tmpvar_16 = (tmpvar_17 * tmpvar_17);
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
  vec_26 = tmpvar_3;
  float tmpvar_27;
  tmpvar_27 = (1.0 - (exp2(tmpvar_25) / 128.0));
  float tmpvar_28;
  tmpvar_28 = max (max (abs(tmpvar_3.x), abs(tmpvar_3.y)), abs(tmpvar_3.z));
  float tmpvar_29;
  tmpvar_29 = abs(tmpvar_3.x);
  if ((tmpvar_29 != tmpvar_28)) {
    vec_26.x = (tmpvar_3.x * tmpvar_27);
  };
  float tmpvar_30;
  tmpvar_30 = abs(tmpvar_3.y);
  if ((tmpvar_30 != tmpvar_28)) {
    vec_26.y = (tmpvar_3.y * tmpvar_27);
  };
  float tmpvar_31;
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
  tmpvar_34.xyz = (tmpvar_33 * tmpvar_33);
  tmpvar_34.w = material_reflectivity;
  lowp vec3 tmpvar_35;
  tmpvar_35 = mix ((rgba_4.xyz * tmpvar_16), (tmpvar_34.xyz * material_reflectivity), dSpecularity);
  pc_fragColor.xyz = tmpvar_35;
  lowp vec3 tmpvar_36;
  lowp vec4 rgba_37;
  lowp vec4 tmpvar_38;
  tmpvar_38 = texture (texture_emissiveMap, vUv0);
  rgba_37.w = tmpvar_38.w;
  rgba_37.xyz = pow (tmpvar_38.xyz, vec3(2.2, 2.2, 2.2));
  tmpvar_36 = (rgba_37.yyy * material_emissive);
  pc_fragColor.xyz = (pc_fragColor.xyz + tmpvar_36);
  vec3 tmpvar_39;
  tmpvar_39 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_39, tmpvar_39))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = 1.0;
  pc_fragColor.x += 0.8008199313006927;
}



