#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
in vec3 vNormalW;
in vec2 vUv0;
uniform vec3 view_position;
lowp vec4 dReflection;
lowp vec3 dAlbedo;
lowp vec3 dDiffuseLight;
lowp vec3 dSpecularLight;
vec3 dLightDirW;
lowp vec3 dSpecularity;
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
uniform vec3 material_emissive;
uniform float material_metalness;
uniform float material_shininess;
uniform sampler2D texture_aoMap;
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
  dReflection = vec4(0.0, 0.0, 0.0, 0.0);
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
  lowp vec3 tmpvar_6;
  tmpvar_6 = mix (vec3(0.04, 0.04, 0.04), rgba_4.xyz, material_metalness);
  dAlbedo = (rgba_4.xyz * (1.0 - material_metalness));
  dGlossiness = (material_shininess + 1e-07);
  float fresnel_7;
  float tmpvar_8;
  tmpvar_8 = (1.0 - max (dot (tmpvar_2, tmpvar_1), 0.0));
  float tmpvar_9;
  tmpvar_9 = (tmpvar_8 * tmpvar_8);
  fresnel_7 = (tmpvar_8 * (tmpvar_9 * tmpvar_9));
  fresnel_7 = (fresnel_7 * (dGlossiness * dGlossiness));
  dSpecularity = (tmpvar_6 + ((1.0 - tmpvar_6) * fresnel_7));
  vec3 fixedReflDir_10;
  vec3 vec_11;
  vec_11 = tmpvar_2;
  float tmpvar_12;
  tmpvar_12 = max (max (abs(tmpvar_2.x), abs(tmpvar_2.y)), abs(tmpvar_2.z));
  float tmpvar_13;
  tmpvar_13 = abs(tmpvar_2.x);
  if ((tmpvar_13 != tmpvar_12)) {
    vec_11.x = (tmpvar_2.x * 0.75);
  };
  float tmpvar_14;
  tmpvar_14 = abs(tmpvar_2.y);
  if ((tmpvar_14 != tmpvar_12)) {
    vec_11.y = (tmpvar_2.y * 0.75);
  };
  float tmpvar_15;
  tmpvar_15 = abs(tmpvar_2.z);
  if ((tmpvar_15 != tmpvar_12)) {
    vec_11.z = (tmpvar_2.z * 0.75);
  };
  fixedReflDir_10.yz = vec_11.yz;
  fixedReflDir_10.x = -(vec_11.x);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture (texture_prefilteredCubeMap4, fixedReflDir_10);
  lowp vec3 tmpvar_17;
  tmpvar_17 = ((8.0 * tmpvar_16.w) * tmpvar_16.xyz);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture (texture_aoMap, vUv0);
  dDiffuseLight = ((tmpvar_17 * tmpvar_17) * tmpvar_18.x);
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
  vec_27 = tmpvar_3;
  float tmpvar_28;
  tmpvar_28 = (1.0 - (exp2(tmpvar_26) / 128.0));
  float tmpvar_29;
  tmpvar_29 = max (max (abs(tmpvar_3.x), abs(tmpvar_3.y)), abs(tmpvar_3.z));
  float tmpvar_30;
  tmpvar_30 = abs(tmpvar_3.x);
  if ((tmpvar_30 != tmpvar_29)) {
    vec_27.x = (tmpvar_3.x * tmpvar_28);
  };
  float tmpvar_31;
  tmpvar_31 = abs(tmpvar_3.y);
  if ((tmpvar_31 != tmpvar_29)) {
    vec_27.y = (tmpvar_3.y * tmpvar_28);
  };
  float tmpvar_32;
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
  dReflection = tmpvar_35;
  dLightDirW = (vPositionW - light0_position);
  vec3 tmpvar_36;
  tmpvar_36 = normalize(dLightDirW);
  float falloff_37;
  float tmpvar_38;
  tmpvar_38 = dot (dLightDirW, dLightDirW);
  float tmpvar_39;
  tmpvar_39 = (1.0/(light0_radius));
  falloff_37 = ((1.0/((tmpvar_38 + 1.0))) * 16.0);
  float x_40;
  x_40 = (tmpvar_38 * (tmpvar_39 * tmpvar_39));
  float tmpvar_41;
  tmpvar_41 = clamp ((1.0 - (x_40 * x_40)), 0.0, 1.0);
  falloff_37 = (falloff_37 * (tmpvar_41 * tmpvar_41));
  dAtten = falloff_37;
  if ((falloff_37 > 1e-05)) {
    float tmpvar_42;
    tmpvar_42 = clamp (((
      dot (tmpvar_36, light0_direction)
     - light0_outerConeAngle) / (light0_innerConeAngle - light0_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_37 * (tmpvar_42 * (tmpvar_42 *
      (3.0 - (2.0 * tmpvar_42))
    )));
    dAtten = (dAtten * max (dot (tmpvar_2,
      -(tmpvar_36)
    ), 0.0));
    dDiffuseLight = (dDiffuseLight + (dAtten * light0_color));
    float tmpvar_43;
    tmpvar_43 = max (exp2((dGlossiness * 11.0)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_36) + tmpvar_1)
      ), tmpvar_2), 0.0), tmpvar_43)
     *
      (tmpvar_43 + 2.0)
    ) / 8.0));
    dSpecularLight = (dAtten * light0_color);
  };
  dLightDirW = (vPositionW - light1_position);
  vec3 tmpvar_44;
  tmpvar_44 = normalize(dLightDirW);
  float falloff_45;
  float tmpvar_46;
  tmpvar_46 = dot (dLightDirW, dLightDirW);
  float tmpvar_47;
  tmpvar_47 = (1.0/(light1_radius));
  falloff_45 = ((1.0/((tmpvar_46 + 1.0))) * 16.0);
  float x_48;
  x_48 = (tmpvar_46 * (tmpvar_47 * tmpvar_47));
  float tmpvar_49;
  tmpvar_49 = clamp ((1.0 - (x_48 * x_48)), 0.0, 1.0);
  falloff_45 = (falloff_45 * (tmpvar_49 * tmpvar_49));
  dAtten = falloff_45;
  if ((falloff_45 > 1e-05)) {
    float tmpvar_50;
    tmpvar_50 = clamp (((
      dot (tmpvar_44, light1_direction)
     - light1_outerConeAngle) / (light1_innerConeAngle - light1_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_45 * (tmpvar_50 * (tmpvar_50 *
      (3.0 - (2.0 * tmpvar_50))
    )));
    dAtten = (dAtten * max (dot (tmpvar_2,
      -(tmpvar_44)
    ), 0.0));
    vec4 projPos_51;
    vec4 tmpvar_52;
    tmpvar_52.w = 1.0;
    tmpvar_52.xyz = vPositionW;
    vec4 tmpvar_53;
    tmpvar_53 = (light1_shadowMatrix * tmpvar_52);
    projPos_51.zw = tmpvar_53.zw;
    projPos_51.xy = (tmpvar_53.xy / tmpvar_53.w);
    float Z_54;
    Z_54 = ((sqrt(
      dot (dLightDirW, dLightDirW)
    ) * light1_shadowParams.w) + light1_shadowParams.z);
    lowp vec4 tmpvar_55;
    tmpvar_55 = texture (light1_shadowMap, projPos_51.xy);
    lowp vec3 tmpvar_56;
    tmpvar_56.z = 0.0;
    tmpvar_56.x = ((tmpvar_55.y * 0.003921569) + tmpvar_55.x);
    tmpvar_56.y = ((tmpvar_55.w * 0.003921569) + tmpvar_55.z);
    float tmpvar_57;
    tmpvar_57 = (light1_shadowParams.y * Z_54);
    lowp float tmpvar_58;
    tmpvar_58 = max ((tmpvar_56.y - (tmpvar_56.x * tmpvar_56.x)), (tmpvar_57 * tmpvar_57));
    lowp float tmpvar_59;
    tmpvar_59 = (Z_54 - tmpvar_56.x);
    lowp float tmpvar_60;
    tmpvar_60 = clamp (((
      (tmpvar_58 / (tmpvar_58 + (tmpvar_59 * tmpvar_59)))
     - 0.1) / 0.9), 0.0, 1.0);
    lowp float tmpvar_61;
    if ((Z_54 <= tmpvar_56.x)) {
      tmpvar_61 = 1.0;
    } else {
      tmpvar_61 = tmpvar_60;
    };
    dAtten = (dAtten * tmpvar_61);
    dDiffuseLight = (dDiffuseLight + (dAtten * light1_color));
    float tmpvar_62;
    tmpvar_62 = max (exp2((dGlossiness * 11.0)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_44) + tmpvar_1)
      ), tmpvar_2), 0.0), tmpvar_62)
     *
      (tmpvar_62 + 2.0)
    ) / 8.0));
    dSpecularLight = (dSpecularLight + (dAtten * light1_color));
  };
  dSpecularLight = (dSpecularLight * tmpvar_18.x);
  dReflection = (tmpvar_35 * tmpvar_18.x);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix ((dAlbedo * dDiffuseLight), (dSpecularLight + (dReflection.xyz * dReflection.w)), dSpecularity);
  pc_fragColor.xyz = tmpvar_63;
  pc_fragColor.xyz = (pc_fragColor.xyz + material_emissive);
  vec3 tmpvar_64;
  tmpvar_64 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_64, tmpvar_64))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = 1.0;
  pc_fragColor.x += 0.5552637366200026;
}



