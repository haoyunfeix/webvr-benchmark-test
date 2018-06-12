#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
in vec3 vNormalW;
uniform vec3 view_position;
vec3 dSpecularity;
float dGlossiness;
uniform vec3 fog_color;
uniform float fog_density;
uniform vec3 envBoxMin;
uniform vec3 envBoxMax;
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
  lowp vec3 tmpvar_15;
  tmpvar_15 = ((8.0 * tmpvar_13.w) * tmpvar_13.xyz);
  tmpvar_14 = (tmpvar_15 * tmpvar_15);
  lowp vec4 cube_0_17;
  lowp vec4 cube_1_18;
  lowp vec4 cubes_19[6];
  vec3 fixedReflDir_20;
  highp int index2_21;
  highp int index1_22;
  float tmpvar_23;
  tmpvar_23 = (clamp ((1.0 - dGlossiness), 0.0, 1.0) * 5.0);
  index1_22 = int(tmpvar_23);
  index2_21 = int(min ((tmpvar_23 + 1.0), 7.0));
  vec3 tmpvar_24;
  vec3 tmpvar_25;
  tmpvar_25 = ((envBoxMax - vPositionW) / tmpvar_3);
  vec3 tmpvar_26;
  tmpvar_26 = ((envBoxMin - vPositionW) / tmpvar_3);
  float tmpvar_27;
  if ((tmpvar_3.x > 0.0)) {
    tmpvar_27 = tmpvar_25.x;
  } else {
    tmpvar_27 = tmpvar_26.x;
  };
  float tmpvar_28;
  if ((tmpvar_3.y > 0.0)) {
    tmpvar_28 = tmpvar_25.y;
  } else {
    tmpvar_28 = tmpvar_26.y;
  };
  float tmpvar_29;
  if ((tmpvar_3.z > 0.0)) {
    tmpvar_29 = tmpvar_25.z;
  } else {
    tmpvar_29 = tmpvar_26.z;
  };
  tmpvar_24 = ((vPositionW + (tmpvar_3 *
    min (min (tmpvar_27, tmpvar_28), tmpvar_29)
  )) - ((envBoxMin + envBoxMax) * 0.5));
  vec3 vec_30;
  vec_30 = tmpvar_24;
  float tmpvar_31;
  tmpvar_31 = (1.0 - (exp2(tmpvar_23) / 128.0));
  float tmpvar_32;
  tmpvar_32 = max (max (abs(tmpvar_24.x), abs(tmpvar_24.y)), abs(tmpvar_24.z));
  float tmpvar_33;
  tmpvar_33 = abs(tmpvar_24.x);
  if ((tmpvar_33 != tmpvar_32)) {
    vec_30.x = (tmpvar_24.x * tmpvar_31);
  };
  float tmpvar_34;
  tmpvar_34 = abs(tmpvar_24.y);
  if ((tmpvar_34 != tmpvar_32)) {
    vec_30.y = (tmpvar_24.y * tmpvar_31);
  };
  float tmpvar_35;
  tmpvar_35 = abs(tmpvar_24.z);
  if ((tmpvar_35 != tmpvar_32)) {
    vec_30.z = (tmpvar_24.z * tmpvar_31);
  };
  fixedReflDir_20.yz = vec_30.yz;
  fixedReflDir_20.x = -(vec_30.x);
  cubes_19[0] = texture (texture_prefilteredCubeMap128, fixedReflDir_20);
  cubes_19[1] = texture (texture_prefilteredCubeMap64, fixedReflDir_20);
  cubes_19[2] = texture (texture_prefilteredCubeMap32, fixedReflDir_20);
  cubes_19[3] = texture (texture_prefilteredCubeMap16, fixedReflDir_20);
  cubes_19[4] = texture (texture_prefilteredCubeMap8, fixedReflDir_20);
  cubes_19[5] = texture (texture_prefilteredCubeMap4, fixedReflDir_20);
  for (highp int i_16 = 0; i_16 < 6; i_16++) {
    if ((i_16 == index1_22)) {
      cube_0_17 = cubes_19[i_16];
    };
    if ((i_16 == index2_21)) {
      cube_1_18 = cubes_19[i_16];
    };
  };
  lowp vec4 tmpvar_36;
  tmpvar_36 = mix (cube_0_17, cube_1_18, fract(tmpvar_23));
  lowp vec3 tmpvar_37;
  tmpvar_37 = ((8.0 * tmpvar_36.w) * tmpvar_36.xyz);
  lowp vec4 tmpvar_38;
  tmpvar_38.xyz = (tmpvar_37 * tmpvar_37);
  tmpvar_38.w = material_reflectivity;
  lowp vec3 tmpvar_39;
  tmpvar_39 = mix ((material_diffuse * tmpvar_14), (tmpvar_38.xyz * material_reflectivity), dSpecularity);
  pc_fragColor.xyz = tmpvar_39;
  pc_fragColor.xyz = (pc_fragColor.xyz + material_emissive);
  vec3 tmpvar_40;
  tmpvar_40 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_40, tmpvar_40))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = 1.0;
  pc_fragColor.x += 0.6089322675159905;
}



