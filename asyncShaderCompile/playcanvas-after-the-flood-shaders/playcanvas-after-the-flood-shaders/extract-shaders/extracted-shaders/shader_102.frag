#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
in vec3 vNormalW;
in vec2 vUv0;
uniform vec3 view_position;
vec3 dAlbedo;
lowp vec3 dDiffuseLight;
lowp vec3 dSpecularLight;
vec3 dLightDirW;
lowp vec3 dSpecularity;
lowp float dGlossiness;
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
uniform vec3 material_diffuse;
uniform sampler2D texture_emissiveMap;
uniform float material_emissiveIntensity;
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
  dDiffuseLight = vec3(0.0, 0.0, 0.0);
  dSpecularLight = vec3(0.0, 0.0, 0.0);
  vec3 tmpvar_1;
  tmpvar_1 = normalize((view_position - vPositionW));
  vec3 tmpvar_2;
  tmpvar_2 = normalize(vNormalW);
  lowp vec3 tmpvar_3;
  tmpvar_3 = normalize(((2.0 *
    (dot (tmpvar_2, tmpvar_1) * tmpvar_2)
  ) - tmpvar_1));
  lowp vec3 tmpvar_4;
  tmpvar_4 = mix (vec3(0.04, 0.04, 0.04), material_diffuse, material_metalness);
  dAlbedo = (material_diffuse * (1.0 - material_metalness));
  dGlossiness = ((material_shininess * texture (texture_glossMap, vUv0).y) + 1e-07);
  lowp float fresnel_5;
  lowp float tmpvar_6;
  tmpvar_6 = (1.0 - max (dot (tmpvar_2, tmpvar_1), 0.0));
  lowp float tmpvar_7;
  tmpvar_7 = (tmpvar_6 * tmpvar_6);
  fresnel_5 = (tmpvar_6 * (tmpvar_7 * tmpvar_7));
  fresnel_5 = (fresnel_5 * (dGlossiness * dGlossiness));
  dSpecularity = (tmpvar_4 + ((1.0 - tmpvar_4) * fresnel_5));
  vec3 fixedReflDir_8;
  vec3 vec_9;
  vec_9 = tmpvar_2;
  float tmpvar_10;
  tmpvar_10 = max (max (abs(tmpvar_2.x), abs(tmpvar_2.y)), abs(tmpvar_2.z));
  float tmpvar_11;
  tmpvar_11 = abs(tmpvar_2.x);
  if ((tmpvar_11 != tmpvar_10)) {
    vec_9.x = (tmpvar_2.x * 0.75);
  };
  float tmpvar_12;
  tmpvar_12 = abs(tmpvar_2.y);
  if ((tmpvar_12 != tmpvar_10)) {
    vec_9.y = (tmpvar_2.y * 0.75);
  };
  float tmpvar_13;
  tmpvar_13 = abs(tmpvar_2.z);
  if ((tmpvar_13 != tmpvar_10)) {
    vec_9.z = (tmpvar_2.z * 0.75);
  };
  fixedReflDir_8.yz = vec_9.yz;
  fixedReflDir_8.x = -(vec_9.x);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture (texture_prefilteredCubeMap4, fixedReflDir_8);
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  tmpvar_16 = ((8.0 * tmpvar_14.w) * tmpvar_14.xyz);
  tmpvar_15 = (tmpvar_16 * tmpvar_16);
  dDiffuseLight = tmpvar_15;
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
  vec_25 = tmpvar_3;
  lowp float tmpvar_26;
  tmpvar_26 = (1.0 - (exp2(tmpvar_24) / 128.0));
  lowp float tmpvar_27;
  tmpvar_27 = max (max (abs(tmpvar_3.x), abs(tmpvar_3.y)), abs(tmpvar_3.z));
  lowp float tmpvar_28;
  tmpvar_28 = abs(tmpvar_3.x);
  if ((tmpvar_28 != tmpvar_27)) {
    vec_25.x = (tmpvar_3.x * tmpvar_26);
  };
  lowp float tmpvar_29;
  tmpvar_29 = abs(tmpvar_3.y);
  if ((tmpvar_29 != tmpvar_27)) {
    vec_25.y = (tmpvar_3.y * tmpvar_26);
  };
  lowp float tmpvar_30;
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
  tmpvar_33.xyz = (tmpvar_32 * tmpvar_32);
  tmpvar_33.w = material_reflectivity;
  dLightDirW = (vPositionW - light0_position);
  vec3 tmpvar_34;
  tmpvar_34 = normalize(dLightDirW);
  float falloff_35;
  float tmpvar_36;
  tmpvar_36 = dot (dLightDirW, dLightDirW);
  float tmpvar_37;
  tmpvar_37 = (1.0/(light0_radius));
  falloff_35 = ((1.0/((tmpvar_36 + 1.0))) * 16.0);
  float x_38;
  x_38 = (tmpvar_36 * (tmpvar_37 * tmpvar_37));
  float tmpvar_39;
  tmpvar_39 = clamp ((1.0 - (x_38 * x_38)), 0.0, 1.0);
  falloff_35 = (falloff_35 * (tmpvar_39 * tmpvar_39));
  dAtten = falloff_35;
  if ((falloff_35 > 1e-05)) {
    float tmpvar_40;
    tmpvar_40 = clamp (((
      dot (tmpvar_34, light0_direction)
     - light0_outerConeAngle) / (light0_innerConeAngle - light0_outerConeAngle)), 0.0, 1.0);
    dAtten = (falloff_35 * (tmpvar_40 * (tmpvar_40 *
      (3.0 - (2.0 * tmpvar_40))
    )));
    dAtten = (dAtten * max (dot (tmpvar_2,
      -(tmpvar_34)
    ), 0.0));
    vec4 projPos_41;
    vec4 tmpvar_42;
    tmpvar_42.w = 1.0;
    tmpvar_42.xyz = vPositionW;
    vec4 tmpvar_43;
    tmpvar_43 = (light0_shadowMatrix * tmpvar_42);
    projPos_41.zw = tmpvar_43.zw;
    projPos_41.xy = (tmpvar_43.xy / tmpvar_43.w);
    float Z_44;
    Z_44 = ((sqrt(
      dot (dLightDirW, dLightDirW)
    ) * light0_shadowParams.w) + light0_shadowParams.z);
    lowp vec4 tmpvar_45;
    tmpvar_45 = texture (light0_shadowMap, projPos_41.xy);
    lowp vec3 tmpvar_46;
    tmpvar_46.z = 0.0;
    tmpvar_46.x = ((tmpvar_45.y * 0.003921569) + tmpvar_45.x);
    tmpvar_46.y = ((tmpvar_45.w * 0.003921569) + tmpvar_45.z);
    float tmpvar_47;
    tmpvar_47 = (light0_shadowParams.y * Z_44);
    lowp float tmpvar_48;
    tmpvar_48 = max ((tmpvar_46.y - (tmpvar_46.x * tmpvar_46.x)), (tmpvar_47 * tmpvar_47));
    lowp float tmpvar_49;
    tmpvar_49 = (Z_44 - tmpvar_46.x);
    lowp float tmpvar_50;
    tmpvar_50 = clamp (((
      (tmpvar_48 / (tmpvar_48 + (tmpvar_49 * tmpvar_49)))
     - 0.1) / 0.9), 0.0, 1.0);
    lowp float tmpvar_51;
    if ((Z_44 <= tmpvar_46.x)) {
      tmpvar_51 = 1.0;
    } else {
      tmpvar_51 = tmpvar_50;
    };
    dAtten = (dAtten * tmpvar_51);
    dDiffuseLight = (tmpvar_15 + (dAtten * light0_color));
    lowp float tmpvar_52;
    tmpvar_52 = max (exp2((dGlossiness * 11.0)), 0.0001);
    dAtten = (dAtten * ((
      pow (max (dot (normalize(
        (-(tmpvar_34) + tmpvar_1)
      ), tmpvar_2), 0.0), tmpvar_52)
     *
      (tmpvar_52 + 2.0)
    ) / 8.0));
    dSpecularLight = (dAtten * light0_color);
  };
  lowp vec3 tmpvar_53;
  tmpvar_53 = mix ((dAlbedo * dDiffuseLight), (dSpecularLight + (tmpvar_33.xyz * material_reflectivity)), dSpecularity);
  pc_fragColor.xyz = tmpvar_53;
  lowp vec3 tmpvar_54;
  lowp vec4 rgba_55;
  lowp vec4 tmpvar_56;
  tmpvar_56 = texture (texture_emissiveMap, vUv0);
  rgba_55.w = tmpvar_56.w;
  rgba_55.xyz = pow (tmpvar_56.xyz, vec3(2.2, 2.2, 2.2));
  tmpvar_54 = (rgba_55.xyz * material_emissiveIntensity);
  pc_fragColor.xyz = (pc_fragColor.xyz + tmpvar_54);
  vec3 tmpvar_57;
  tmpvar_57 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_57, tmpvar_57))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = 1.0;
  pc_fragColor.x += 0.8891888535066306;
}



