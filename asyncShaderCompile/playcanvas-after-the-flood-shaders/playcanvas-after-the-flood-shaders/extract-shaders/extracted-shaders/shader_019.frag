#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
in vec3 vNormalW;
in vec3 vTangentW;
in vec3 vBinormalW;
in vec2 vUv0;
uniform vec3 view_position;
lowp vec3 dNormalW;
lowp vec3 dDiffuseLight;
uniform sampler2D texture_normalMap;
uniform float material_bumpiness;
uniform vec3 fog_color;
uniform float fog_density;
uniform float skyboxIntensity;
uniform sampler2D texture_diffuseMap;
uniform vec3 material_emissive;
uniform lowp samplerCube texture_prefilteredCubeMap4;
void main ()
{
  dDiffuseLight = vec3(0.0, 0.0, 0.0);
  mat3 tmpvar_1;
  tmpvar_1[uint(0)] = normalize(vTangentW);
  tmpvar_1[1u] = normalize(vBinormalW);
  tmpvar_1[2u] = normalize(vNormalW);
  dNormalW = (tmpvar_1 * normalize(mix (vec3(0.0, 0.0, 1.0),
    ((texture (texture_normalMap, vUv0).xyz * 2.0) - 1.0)
  , material_bumpiness)));
  lowp vec4 rgba_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture (texture_diffuseMap, vUv0);
  rgba_2.w = tmpvar_3.w;
  rgba_2.xyz = pow (tmpvar_3.xyz, vec3(2.2, 2.2, 2.2));
  lowp vec3 fixedReflDir_4;
  lowp vec3 vec_5;
  vec_5 = dNormalW;
  lowp float tmpvar_6;
  tmpvar_6 = max (max (abs(dNormalW.x), abs(dNormalW.y)), abs(dNormalW.z));
  lowp float tmpvar_7;
  tmpvar_7 = abs(dNormalW.x);
  if ((tmpvar_7 != tmpvar_6)) {
    vec_5.x = (dNormalW.x * 0.75);
  };
  lowp float tmpvar_8;
  tmpvar_8 = abs(dNormalW.y);
  if ((tmpvar_8 != tmpvar_6)) {
    vec_5.y = (dNormalW.y * 0.75);
  };
  lowp float tmpvar_9;
  tmpvar_9 = abs(dNormalW.z);
  if ((tmpvar_9 != tmpvar_6)) {
    vec_5.z = (dNormalW.z * 0.75);
  };
  fixedReflDir_4.yz = vec_5.yz;
  fixedReflDir_4.x = -(vec_5.x);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (texture_prefilteredCubeMap4, fixedReflDir_4);
  lowp vec3 tmpvar_11;
  tmpvar_11 = ((8.0 * tmpvar_10.w) * tmpvar_10.xyz);
  dDiffuseLight = ((tmpvar_11 * tmpvar_11) * skyboxIntensity);
  lowp vec3 tmpvar_12;
  tmpvar_12 = (rgba_2.xyz * dDiffuseLight);
  pc_fragColor.xyz = tmpvar_12;
  pc_fragColor.xyz = (pc_fragColor.xyz + material_emissive);
  vec3 tmpvar_13;
  tmpvar_13 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_13, tmpvar_13))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = 1.0;
  pc_fragColor.x += 0.5858748409048211;
}



