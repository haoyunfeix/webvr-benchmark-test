#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
in vec3 vNormalW;
in vec3 vTangentW;
in vec3 vBinormalW;
in vec2 vUV0_1;
uniform vec3 view_position;
lowp vec3 dAlbedo;
lowp vec3 dNormalW;
lowp vec3 dSpecularity;
lowp float dGlossiness;
uniform sampler2D texture_normalMap;
uniform float material_bumpiness;
uniform vec3 fog_color;
uniform float fog_density;
uniform sampler2D texture_diffuseMap;
uniform vec3 material_diffuse;
uniform vec3 material_emissive;
uniform float material_metalness;
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
  dAlbedo = (rgba_4.xyz * material_diffuse);
  lowp vec3 tmpvar_6;
  tmpvar_6 = mix (vec3(0.04, 0.04, 0.04), dAlbedo, material_metalness);
  dAlbedo = (dAlbedo * (1.0 - material_metalness));
  dGlossiness = ((material_shininess * texture (texture_glossMap, vUV0_1).y) + 1e-07);
  lowp float fresnel_7;
  lowp float tmpvar_8;
  tmpvar_8 = (1.0 - max (dot (dNormalW, tmpvar_1), 0.0));
  lowp float tmpvar_9;
  tmpvar_9 = (tmpvar_8 * tmpvar_8);
  fresnel_7 = (tmpvar_8 * (tmpvar_9 * tmpvar_9));
  fresnel_7 = (fresnel_7 * (dGlossiness * dGlossiness));
  dSpecularity = (tmpvar_6 + ((1.0 - tmpvar_6) * fresnel_7));
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
  lowp vec3 tmpvar_18;
  tmpvar_18 = ((8.0 * tmpvar_16.w) * tmpvar_16.xyz);
  tmpvar_17 = (tmpvar_18 * tmpvar_18);
  lowp vec4 cube_0_20;
  lowp vec4 cube_1_21;
  lowp vec4 cubes_22[6];
  lowp vec3 fixedReflDir_23;
  lowp int index2_24;
  lowp int index1_25;
  lowp float tmpvar_26;
  tmpvar_26 = (clamp ((1.0 - dGlossiness), 0.0, 1.0) * 5.0);
  index1_25 = int(tmpvar_26);
  index2_24 = int(min ((tmpvar_26 + 1.0), 7.0));
  lowp vec3 vec_27;
  vec_27 = tmpvar_3;
  lowp float tmpvar_28;
  tmpvar_28 = (1.0 - (exp2(tmpvar_26) / 128.0));
  lowp float tmpvar_29;
  tmpvar_29 = max (max (abs(tmpvar_3.x), abs(tmpvar_3.y)), abs(tmpvar_3.z));
  lowp float tmpvar_30;
  tmpvar_30 = abs(tmpvar_3.x);
  if ((tmpvar_30 != tmpvar_29)) {
    vec_27.x = (tmpvar_3.x * tmpvar_28);
  };
  lowp float tmpvar_31;
  tmpvar_31 = abs(tmpvar_3.y);
  if ((tmpvar_31 != tmpvar_29)) {
    vec_27.y = (tmpvar_3.y * tmpvar_28);
  };
  lowp float tmpvar_32;
  tmpvar_32 = abs(tmpvar_3.z);
  if ((tmpvar_32 != tmpvar_29)) {
    vec_27.z = (tmpvar_3.z * tmpvar_28);
  };
  fixedReflDir_23.yz = vec_27.yz;
  fixedReflDir_23.x = -(vec_27.x);
  cubes_22[0] = texture (texture_prefilteredCubeMap128, fixedReflDir_23);
  cubes_22[1] = texture (texture_prefilteredCubeMap64, fixedReflDir_23);
  cubes_22[2] = texture (texture_prefilteredCubeMap32, fixedReflDir_23);
  cubes_22[3] = texture (texture_prefilteredCubeMap16, fixedReflDir_23);
  cubes_22[4] = texture (texture_prefilteredCubeMap8, fixedReflDir_23);
  cubes_22[5] = texture (texture_prefilteredCubeMap4, fixedReflDir_23);
  for (highp int i_19 = 0; i_19 < 6; i_19++) {
    if ((i_19 == index1_25)) {
      cube_0_20 = cubes_22[i_19];
    };
    if ((i_19 == index2_24)) {
      cube_1_21 = cubes_22[i_19];
    };
  };
  lowp vec4 tmpvar_33;
  tmpvar_33 = mix (cube_0_20, cube_1_21, fract(tmpvar_26));
  lowp vec3 tmpvar_34;
  tmpvar_34 = ((8.0 * tmpvar_33.w) * tmpvar_33.xyz);
  lowp vec4 tmpvar_35;
  tmpvar_35.xyz = (tmpvar_34 * tmpvar_34);
  tmpvar_35.w = material_reflectivity;
  lowp vec3 tmpvar_36;
  tmpvar_36 = mix ((dAlbedo * tmpvar_17), (tmpvar_35.xyz * material_reflectivity), dSpecularity);
  pc_fragColor.xyz = tmpvar_36;
  pc_fragColor.xyz = (pc_fragColor.xyz + material_emissive);
  vec3 tmpvar_37;
  tmpvar_37 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_37, tmpvar_37))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = 1.0;
  pc_fragColor.x += 0.2668968800072127;
}



