#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
in vec3 vNormalW;
in vec2 vUv0;
uniform vec3 view_position;
lowp vec3 dDiffuseLight;
lowp vec3 dSpecularLight;
vec3 dLightDirW;
vec3 dSpecularity;
float dGlossiness;
lowp float dAtten;
uniform vec3 light0_color;
uniform vec3 light0_position;
uniform float light0_radius;
uniform vec3 light0_direction;
uniform float light0_innerConeAngle;
uniform float light0_outerConeAngle;
uniform vec3 light1_color;
uniform vec3 light1_position;
uniform float light1_radius;
uniform vec3 light1_direction;
uniform float light1_innerConeAngle;
uniform float light1_outerConeAngle;
uniform mat4 light1_shadowMatrix;
uniform vec4 light1_shadowParams;
uniform sampler2D light1_shadowMap;
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
  dDiffuseLight = vec3(0.0, 0.0, 0.0);
  dSpecularLight = vec3(0.0, 0.0, 0.0);
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
  dDiffuseLight = tmpvar_16;
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
    dAtten = (dAtten * max (dot (tmpvar_2,
      -(tmpvar_35)
    ), 0.0));
    dDiffuseLight = (tmpvar_16 + (dAtten * light0_color));
    float tmpvar_42;
    tmpvar_42 = max (exp2((dGlossiness * 11.0)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_35) + tmpvar_1)
      ), tmpvar_2), 0.0), tmpvar_42)
     *
      (tmpvar_42 + 2.0)
    ) / 8.0));
    dSpecularLight = (dAtten * light0_color);
  };
  dLightDirW = (vPositionW - light1_position);
  vec3 tmpvar_43;
  tmpvar_43 = normalize(dLightDirW);
  float falloff_44;
  float tmpvar_45;
  tmpvar_45 = dot (dLightDirW, dLightDirW);
  float tmpvar_46;
  tmpvar_46 = (1.0/(light1_radius));
  falloff_44 = ((1.0/((tmpvar_45 + 1.0))) * 16.0);
  float x_47;
  x_47 = (tmpvar_45 * (tmpvar_46 * tmpvar_46));
  float tmpvar_48;
  tmpvar_48 = clamp ((1.0 - (x_47 * x_47)), 0.0, 1.0);
  falloff_44 = (falloff_44 * (tmpvar_48 * tmpvar_48));
  dAtten = falloff_44;
  if ((falloff_44 > 1e-05)) {
    float tmpvar_49;
    tmpvar_49 = clamp (((
      dot (tmpvar_43, light1_direction)
     - light1_outerConeAngle) / (light1_innerConeAngle - light1_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_44 * (tmpvar_49 * (tmpvar_49 *
      (3.0 - (2.0 * tmpvar_49))
    )));
    dAtten = (dAtten * max (dot (tmpvar_2,
      -(tmpvar_43)
    ), 0.0));
    vec4 projPos_50;
    vec4 tmpvar_51;
    tmpvar_51.w = 1.0;
    tmpvar_51.xyz = vPositionW;
    vec4 tmpvar_52;
    tmpvar_52 = (light1_shadowMatrix * tmpvar_51);
    projPos_50.zw = tmpvar_52.zw;
    projPos_50.xy = (tmpvar_52.xy / tmpvar_52.w);
    float Z_53;
    Z_53 = ((sqrt(
      dot (dLightDirW, dLightDirW)
    ) * light1_shadowParams.w) + light1_shadowParams.z);
    lowp vec4 tmpvar_54;
    tmpvar_54 = texture (light1_shadowMap, projPos_50.xy);
    lowp vec3 tmpvar_55;
    tmpvar_55.z = 0.0;
    tmpvar_55.x = ((tmpvar_54.y * 0.003921569) + tmpvar_54.x);
    tmpvar_55.y = ((tmpvar_54.w * 0.003921569) + tmpvar_54.z);
    float tmpvar_56;
    tmpvar_56 = (light1_shadowParams.y * Z_53);
    lowp float tmpvar_57;
    tmpvar_57 = max ((tmpvar_55.y - (tmpvar_55.x * tmpvar_55.x)), (tmpvar_56 * tmpvar_56));
    lowp float tmpvar_58;
    tmpvar_58 = (Z_53 - tmpvar_55.x);
    lowp float tmpvar_59;
    tmpvar_59 = clamp (((
      (tmpvar_57 / (tmpvar_57 + (tmpvar_58 * tmpvar_58)))
     - 0.1) / 0.9), 0.0, 1.0);
    lowp float tmpvar_60;
    if ((Z_53 <= tmpvar_55.x)) {
      tmpvar_60 = 1.0;
    } else {
      tmpvar_60 = tmpvar_59;
    };
    dAtten = (dAtten * tmpvar_60);
    dDiffuseLight = (dDiffuseLight + (dAtten * light1_color));
    float tmpvar_61;
    tmpvar_61 = max (exp2((dGlossiness * 11.0)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_43) + tmpvar_1)
      ), tmpvar_2), 0.0), tmpvar_61)
     *
      (tmpvar_61 + 2.0)
    ) / 8.0));
    dSpecularLight = (dSpecularLight + (dAtten * light1_color));
  };
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix ((rgba_4.xyz * dDiffuseLight), (dSpecularLight + (tmpvar_34.xyz * material_reflectivity)), dSpecularity);
  pc_fragColor.xyz = tmpvar_62;
  lowp vec3 tmpvar_63;
  lowp vec4 rgba_64;
  lowp vec4 tmpvar_65;
  tmpvar_65 = texture (texture_emissiveMap, vUv0);
  rgba_64.w = tmpvar_65.w;
  rgba_64.xyz = pow (tmpvar_65.xyz, vec3(2.2, 2.2, 2.2));
  tmpvar_63 = (rgba_64.yyy * material_emissive);
  pc_fragColor.xyz = (pc_fragColor.xyz + tmpvar_63);
  vec3 tmpvar_66;
  tmpvar_66 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_66, tmpvar_66))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = 1.0;
  pc_fragColor.x += 0.48564338786732275;
}



