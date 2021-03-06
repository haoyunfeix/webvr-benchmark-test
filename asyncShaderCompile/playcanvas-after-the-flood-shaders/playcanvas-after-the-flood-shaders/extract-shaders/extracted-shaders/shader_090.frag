#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec4 vVertexColor;
in vec3 vPositionW;
in vec3 vNormalW;
in vec2 vUv0;
uniform vec3 view_position;
lowp vec3 dAlbedo;
vec3 dSpecularity;
float dGlossiness;
lowp float dAlpha;
uniform vec3 fog_color;
uniform float fog_density;
uniform sampler2D texture_diffuseMap;
uniform float isLeaves;
uniform sampler2D texture_opacityMap;
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
uniform float alpha_ref;
void main ()
{
  dSpecularity = vec3(0.0, 0.0, 0.0);
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture (texture_opacityMap, vUv0);
  dAlpha = tmpvar_1.w;
  if ((tmpvar_1.w < alpha_ref)) {
    discard;
  };
  vec3 tmpvar_2;
  tmpvar_2 = normalize((view_position - vPositionW));
  vec3 tmpvar_3;
  tmpvar_3 = normalize(vNormalW);
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((2.0 *
    (dot (tmpvar_3, tmpvar_2) * tmpvar_3)
  ) - tmpvar_2));
  lowp vec4 rgba_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture (texture_diffuseMap, vUv0);
  rgba_5.w = tmpvar_6.w;
  rgba_5.xyz = pow (tmpvar_6.xyz, vec3(2.2, 2.2, 2.2));
  dAlbedo = rgba_5.xyz;
  if ((isLeaves > 0.5)) {
    dAlbedo = (rgba_5.xyz * vec3((vVertexColor.w * 2.0)));
  } else {
    dAlbedo = (dAlbedo * vec3(clamp ((
      (vVertexColor.w * vVertexColor.w)
     *
      (vVertexColor.w * 5.0)
    ), 0.0, 1.0)));
  };
  dGlossiness = (material_shininess + 1e-07);
  float fresnel_7;
  float tmpvar_8;
  tmpvar_8 = (1.0 - max (dot (tmpvar_3, tmpvar_2), 0.0));
  float tmpvar_9;
  tmpvar_9 = (tmpvar_8 * tmpvar_8);
  fresnel_7 = (tmpvar_8 * (tmpvar_9 * tmpvar_9));
  fresnel_7 = (fresnel_7 * (dGlossiness * dGlossiness));
  dSpecularity = (material_specular + ((1.0 - material_specular) * fresnel_7));
  vec3 fixedReflDir_10;
  vec3 vec_11;
  vec_11 = tmpvar_3;
  float tmpvar_12;
  tmpvar_12 = max (max (abs(tmpvar_3.x), abs(tmpvar_3.y)), abs(tmpvar_3.z));
  float tmpvar_13;
  tmpvar_13 = abs(tmpvar_3.x);
  if ((tmpvar_13 != tmpvar_12)) {
    vec_11.x = (tmpvar_3.x * 0.75);
  };
  float tmpvar_14;
  tmpvar_14 = abs(tmpvar_3.y);
  if ((tmpvar_14 != tmpvar_12)) {
    vec_11.y = (tmpvar_3.y * 0.75);
  };
  float tmpvar_15;
  tmpvar_15 = abs(tmpvar_3.z);
  if ((tmpvar_15 != tmpvar_12)) {
    vec_11.z = (tmpvar_3.z * 0.75);
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
  vec3 fixedReflDir_23;
  highp int index2_24;
  highp int index1_25;
  float tmpvar_26;
  tmpvar_26 = (clamp ((1.0 - dGlossiness), 0.0, 1.0) * 5.0);
  index1_25 = int(tmpvar_26);
  index2_24 = int(min ((tmpvar_26 + 1.0), 7.0));
  vec3 vec_27;
  vec_27 = tmpvar_4;
  float tmpvar_28;
  tmpvar_28 = (1.0 - (exp2(tmpvar_26) / 128.0));
  float tmpvar_29;
  tmpvar_29 = max (max (abs(tmpvar_4.x), abs(tmpvar_4.y)), abs(tmpvar_4.z));
  float tmpvar_30;
  tmpvar_30 = abs(tmpvar_4.x);
  if ((tmpvar_30 != tmpvar_29)) {
    vec_27.x = (tmpvar_4.x * tmpvar_28);
  };
  float tmpvar_31;
  tmpvar_31 = abs(tmpvar_4.y);
  if ((tmpvar_31 != tmpvar_29)) {
    vec_27.y = (tmpvar_4.y * tmpvar_28);
  };
  float tmpvar_32;
  tmpvar_32 = abs(tmpvar_4.z);
  if ((tmpvar_32 != tmpvar_29)) {
    vec_27.z = (tmpvar_4.z * tmpvar_28);
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
  pc_fragColor.xyz = (pc_fragColor.xyz + (pow (
    clamp (vVertexColor.xyz, vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0))
  , vec3(2.2, 2.2, 2.2)) * material_emissive));
  vec3 tmpvar_37;
  tmpvar_37 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_37, tmpvar_37))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = dAlpha;
  pc_fragColor.x += 0.2364966123490575;
}



