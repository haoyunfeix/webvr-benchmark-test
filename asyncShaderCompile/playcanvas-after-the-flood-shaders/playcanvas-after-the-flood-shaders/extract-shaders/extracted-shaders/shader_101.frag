#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
in vec3 vNormalW;
uniform vec3 view_position;
lowp vec3 dDiffuseLight;
uniform vec3 fog_color;
uniform float fog_density;
uniform float skyboxIntensity;
uniform vec3 material_diffuse;
uniform vec3 material_emissive;
uniform lowp samplerCube texture_prefilteredCubeMap4;
void main ()
{
  dDiffuseLight = vec3(0.0, 0.0, 0.0);
  vec3 tmpvar_1;
  tmpvar_1 = normalize(vNormalW);
  vec3 fixedReflDir_2;
  vec3 vec_3;
  vec_3 = tmpvar_1;
  float tmpvar_4;
  tmpvar_4 = max (max (abs(tmpvar_1.x), abs(tmpvar_1.y)), abs(tmpvar_1.z));
  float tmpvar_5;
  tmpvar_5 = abs(tmpvar_1.x);
  if ((tmpvar_5 != tmpvar_4)) {
    vec_3.x = (tmpvar_1.x * 0.75);
  };
  float tmpvar_6;
  tmpvar_6 = abs(tmpvar_1.y);
  if ((tmpvar_6 != tmpvar_4)) {
    vec_3.y = (tmpvar_1.y * 0.75);
  };
  float tmpvar_7;
  tmpvar_7 = abs(tmpvar_1.z);
  if ((tmpvar_7 != tmpvar_4)) {
    vec_3.z = (tmpvar_1.z * 0.75);
  };
  fixedReflDir_2.yz = vec_3.yz;
  fixedReflDir_2.x = -(vec_3.x);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (texture_prefilteredCubeMap4, fixedReflDir_2);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((8.0 * tmpvar_8.w) * tmpvar_8.xyz);
  dDiffuseLight = ((tmpvar_9 * tmpvar_9) * skyboxIntensity);
  lowp vec3 tmpvar_10;
  tmpvar_10 = (material_diffuse * dDiffuseLight);
  pc_fragColor.xyz = tmpvar_10;
  pc_fragColor.xyz = (pc_fragColor.xyz + material_emissive);
  vec3 tmpvar_11;
  tmpvar_11 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_11, tmpvar_11))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = 1.0;
  pc_fragColor.x += 0.9537714458485989;
}



