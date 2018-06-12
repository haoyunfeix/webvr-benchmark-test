#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec4 vVertexColor;
in vec3 vPositionW;
in vec3 vNormalW;
in vec2 vUv0;
in vec2 vUv1;
uniform vec3 view_position;
lowp vec3 dAlbedo;
lowp vec3 dDiffuseLight;
lowp vec3 dSpecularLight;
vec3 dLightDirW;
lowp vec3 dSpecularity;
float dGlossiness;
lowp float dAlpha;
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
uniform vec3 fog_color;
uniform float fog_density;
uniform float skyboxIntensity;
uniform sampler2D texture_diffuseMap;
uniform vec3 material_diffuse;
uniform sampler2D texture_opacityMap;
uniform sampler2D texture_emissiveMap;
uniform float material_emissiveIntensity;
uniform sampler2D texture_specularMap;
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
  dDiffuseLight = vec3(0.0, 0.0, 0.0);
  dSpecularLight = vec3(0.0, 0.0, 0.0);
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
  dAlbedo = (rgba_5.xyz * material_diffuse);
  dSpecularity = (texture (texture_specularMap, vUv1).xyz * material_specular);
  dGlossiness = ((material_shininess * clamp (vVertexColor.x, 0.0, 1.0)) + 1e-07);
  float fresnel_7;
  float tmpvar_8;
  tmpvar_8 = (1.0 - max (dot (tmpvar_3, tmpvar_2), 0.0));
  float tmpvar_9;
  tmpvar_9 = (tmpvar_8 * tmpvar_8);
  fresnel_7 = (tmpvar_8 * (tmpvar_9 * tmpvar_9));
  fresnel_7 = (fresnel_7 * (dGlossiness * dGlossiness));
  dSpecularity = (dSpecularity + ((1.0 - dSpecularity) * fresnel_7));
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
  tmpvar_17 = ((8.0 * tmpvar_16.w) * tmpvar_16.xyz);
  dDiffuseLight = ((tmpvar_17 * tmpvar_17) * skyboxIntensity);
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
  vec_26 = tmpvar_4;
  float tmpvar_27;
  tmpvar_27 = (1.0 - (exp2(tmpvar_25) / 128.0));
  float tmpvar_28;
  tmpvar_28 = max (max (abs(tmpvar_4.x), abs(tmpvar_4.y)), abs(tmpvar_4.z));
  float tmpvar_29;
  tmpvar_29 = abs(tmpvar_4.x);
  if ((tmpvar_29 != tmpvar_28)) {
    vec_26.x = (tmpvar_4.x * tmpvar_27);
  };
  float tmpvar_30;
  tmpvar_30 = abs(tmpvar_4.y);
  if ((tmpvar_30 != tmpvar_28)) {
    vec_26.y = (tmpvar_4.y * tmpvar_27);
  };
  float tmpvar_31;
  tmpvar_31 = abs(tmpvar_4.z);
  if ((tmpvar_31 != tmpvar_28)) {
    vec_26.z = (tmpvar_4.z * tmpvar_27);
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
  dLightDirW = (vPositionW - light0_position);
  vec3 tmpvar_35;
  tmpvar_35 = normalize(dLightDirW);
  float falloff_36;
  float tmpvar_37;
  tmpvar_37 = dot (dLightDirW, dLightDirW);
  float tmpvar_38;
  tmpvar_38 = (1.0/(light0_radius));
  falloff_36 = ((1.0/((tmpvar_37 + 1.0))) * 16.0);
  float x_39;
  x_39 = (tmpvar_37 * (tmpvar_38 * tmpvar_38));
  float tmpvar_40;
  tmpvar_40 = clamp ((1.0 - (x_39 * x_39)), 0.0, 1.0);
  falloff_36 = (falloff_36 * (tmpvar_40 * tmpvar_40));
  dAtten = falloff_36;
  if ((falloff_36 > 1e-05)) {
    float tmpvar_41;
    tmpvar_41 = clamp (((
      dot (tmpvar_35, light0_direction)
     - light0_outerConeAngle) / (light0_innerConeAngle - light0_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_36 * (tmpvar_41 * (tmpvar_41 *
      (3.0 - (2.0 * tmpvar_41))
    )));
    dAtten = (dAtten * max (dot (tmpvar_3,
      -(tmpvar_35)
    ), 0.0));
    vec4 projPos_42;
    vec4 tmpvar_43;
    tmpvar_43.w = 1.0;
    tmpvar_43.xyz = vPositionW;
    vec4 tmpvar_44;
    tmpvar_44 = (light0_shadowMatrix * tmpvar_43);
    projPos_42.zw = tmpvar_44.zw;
    projPos_42.xy = (tmpvar_44.xy / tmpvar_44.w);
    float Z_45;
    Z_45 = ((sqrt(
      dot (dLightDirW, dLightDirW)
    ) * light0_shadowParams.w) + light0_shadowParams.z);
    lowp vec4 tmpvar_46;
    tmpvar_46 = texture (light0_shadowMap, projPos_42.xy);
    lowp vec3 tmpvar_47;
    tmpvar_47.z = 0.0;
    tmpvar_47.x = ((tmpvar_46.y * 0.003921569) + tmpvar_46.x);
    tmpvar_47.y = ((tmpvar_46.w * 0.003921569) + tmpvar_46.z);
    float tmpvar_48;
    tmpvar_48 = (light0_shadowParams.y * Z_45);
    lowp float tmpvar_49;
    tmpvar_49 = max ((tmpvar_47.y - (tmpvar_47.x * tmpvar_47.x)), (tmpvar_48 * tmpvar_48));
    lowp float tmpvar_50;
    tmpvar_50 = (Z_45 - tmpvar_47.x);
    lowp float tmpvar_51;
    tmpvar_51 = clamp (((
      (tmpvar_49 / (tmpvar_49 + (tmpvar_50 * tmpvar_50)))
     - 0.1) / 0.9), 0.0, 1.0);
    lowp float tmpvar_52;
    if ((Z_45 <= tmpvar_47.x)) {
      tmpvar_52 = 1.0;
    } else {
      tmpvar_52 = tmpvar_51;
    };
    dAtten = (dAtten * tmpvar_52);
    dDiffuseLight = (dDiffuseLight + (dAtten * light0_color));
    float tmpvar_53;
    tmpvar_53 = max (exp2((dGlossiness * 11.0)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_35) + tmpvar_2)
      ), tmpvar_3), 0.0), tmpvar_53)
     *
      (tmpvar_53 + 2.0)
    ) / 8.0));
    dSpecularLight = (dAtten * light0_color);
  };
  lowp vec3 tmpvar_54;
  tmpvar_54 = mix ((dAlbedo * dDiffuseLight), (dSpecularLight + (tmpvar_34.xyz * material_reflectivity)), dSpecularity);
  pc_fragColor.xyz = tmpvar_54;
  lowp vec3 tmpvar_55;
  float translucency_56;
  translucency_56 = (clamp (dot (tmpvar_35,
    -(vNormalW)
  ), 0.0, 1.0) * clamp (dot (
    normalize((view_position - vPositionW))
  , tmpvar_35), 0.0, 1.0));
  translucency_56 = (translucency_56 * ((1.0/(
    (dot (dLightDirW, dLightDirW) + 1.0)
  )) * 4.0));
  float tmpvar_57;
  tmpvar_57 = clamp ((translucency_56 + 0.0025), 0.0, 1.0);
  translucency_56 = tmpvar_57;
  lowp vec4 rgba_58;
  lowp vec4 tmpvar_59;
  tmpvar_59 = texture (texture_emissiveMap, vUv0);
  rgba_58.w = tmpvar_59.w;
  rgba_58.xyz = pow (tmpvar_59.xyz, vec3(2.2, 2.2, 2.2));
  tmpvar_55 = (((rgba_58.xyz * material_emissiveIntensity) * (200.0 * tmpvar_57)) * vVertexColor.w);
  pc_fragColor.xyz = (pc_fragColor.xyz + tmpvar_55);
  vec3 tmpvar_60;
  tmpvar_60 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_60, tmpvar_60))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = dAlpha;
  pc_fragColor.x += 0.12742196622659296;
}



