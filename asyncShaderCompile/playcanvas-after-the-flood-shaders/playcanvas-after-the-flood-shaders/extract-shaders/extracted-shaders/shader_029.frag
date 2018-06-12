#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
in vec3 vNormalW;
in vec2 vUv0;
uniform vec3 view_position;
lowp vec3 dDiffuseLight;
lowp float dAlpha;
uniform vec3 fog_color;
uniform float fog_density;
uniform float skyboxIntensity;
uniform sampler2D texture_diffuseMap;
uniform sampler2D texture_opacityMap;
uniform sampler2D texture_emissiveMap;
uniform float material_emissiveIntensity;
uniform lowp samplerCube texture_prefilteredCubeMap4;
uniform float alpha_ref;
void main ()
{
  dDiffuseLight = vec3(0.0, 0.0, 0.0);
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture (texture_opacityMap, vUv0);
  dAlpha = tmpvar_1.w;
  if ((tmpvar_1.w < alpha_ref)) {
    discard;
  };
  vec3 tmpvar_2;
  tmpvar_2 = normalize(vNormalW);
  lowp vec4 rgba_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture (texture_diffuseMap, vUv0);
  rgba_3.w = tmpvar_4.w;
  rgba_3.xyz = pow (tmpvar_4.xyz, vec3(2.2, 2.2, 2.2));
  vec3 fixedReflDir_5;
  vec3 vec_6;
  vec_6 = tmpvar_2;
  float tmpvar_7;
  tmpvar_7 = max (max (abs(tmpvar_2.x), abs(tmpvar_2.y)), abs(tmpvar_2.z));
  float tmpvar_8;
  tmpvar_8 = abs(tmpvar_2.x);
  if ((tmpvar_8 != tmpvar_7)) {
    vec_6.x = (tmpvar_2.x * 0.75);
  };
  float tmpvar_9;
  tmpvar_9 = abs(tmpvar_2.y);
  if ((tmpvar_9 != tmpvar_7)) {
    vec_6.y = (tmpvar_2.y * 0.75);
  };
  float tmpvar_10;
  tmpvar_10 = abs(tmpvar_2.z);
  if ((tmpvar_10 != tmpvar_7)) {
    vec_6.z = (tmpvar_2.z * 0.75);
  };
  fixedReflDir_5.yz = vec_6.yz;
  fixedReflDir_5.x = -(vec_6.x);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (texture_prefilteredCubeMap4, fixedReflDir_5);
  lowp vec3 tmpvar_12;
  tmpvar_12 = ((8.0 * tmpvar_11.w) * tmpvar_11.xyz);
  dDiffuseLight = ((tmpvar_12 * tmpvar_12) * skyboxIntensity);
  lowp vec3 tmpvar_13;
  tmpvar_13 = (rgba_3.xyz * dDiffuseLight);
  pc_fragColor.xyz = tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec4 rgba_15;
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture (texture_emissiveMap, vUv0);
  rgba_15.w = tmpvar_16.w;
  rgba_15.xyz = pow (tmpvar_16.xyz, vec3(2.2, 2.2, 2.2));
  tmpvar_14 = (rgba_15.xyz * material_emissiveIntensity);
  pc_fragColor.xyz = (pc_fragColor.xyz + tmpvar_14);
  vec3 tmpvar_17;
  tmpvar_17 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_17, tmpvar_17))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = dAlpha;
  pc_fragColor.x += 0.897052497939721;
}



