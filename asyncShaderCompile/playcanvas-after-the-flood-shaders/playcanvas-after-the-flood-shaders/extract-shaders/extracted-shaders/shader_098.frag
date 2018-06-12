#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
in vec3 vNormalW;
in vec2 vUv0;
uniform vec3 view_position;
lowp vec3 dDiffuseLight;
uniform vec3 fog_color;
uniform float fog_density;
uniform float skyboxIntensity;
uniform sampler2D texture_diffuseMap;
uniform float material_opacity;
uniform vec3 material_emissive;
uniform lowp samplerCube texture_prefilteredCubeMap4;
void main ()
{
  dDiffuseLight = vec3(0.0, 0.0, 0.0);
  vec3 tmpvar_1;
  tmpvar_1 = normalize(vNormalW);
  lowp vec4 rgba_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture (texture_diffuseMap, vUv0);
  rgba_2.w = tmpvar_3.w;
  rgba_2.xyz = pow (tmpvar_3.xyz, vec3(2.2, 2.2, 2.2));
  vec3 fixedReflDir_4;
  vec3 vec_5;
  vec_5 = tmpvar_1;
  float tmpvar_6;
  tmpvar_6 = max (max (abs(tmpvar_1.x), abs(tmpvar_1.y)), abs(tmpvar_1.z));
  float tmpvar_7;
  tmpvar_7 = abs(tmpvar_1.x);
  if ((tmpvar_7 != tmpvar_6)) {
    vec_5.x = (tmpvar_1.x * 0.75);
  };
  float tmpvar_8;
  tmpvar_8 = abs(tmpvar_1.y);
  if ((tmpvar_8 != tmpvar_6)) {
    vec_5.y = (tmpvar_1.y * 0.75);
  };
  float tmpvar_9;
  tmpvar_9 = abs(tmpvar_1.z);
  if ((tmpvar_9 != tmpvar_6)) {
    vec_5.z = (tmpvar_1.z * 0.75);
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
  pc_fragColor.w = material_opacity;
  pc_fragColor.x += 0.7802531432757513;
}



