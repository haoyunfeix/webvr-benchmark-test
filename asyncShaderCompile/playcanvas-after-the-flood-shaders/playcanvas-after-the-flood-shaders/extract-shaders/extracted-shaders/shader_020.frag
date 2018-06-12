#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vNormalW;
lowp vec3 dDiffuseLight;
uniform float skyboxIntensity;
uniform lowp samplerCube texture_prefilteredCubeMap4;
uniform vec3 material_ambient;
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
  dDiffuseLight = (dDiffuseLight * material_ambient);
  pc_fragColor.xyz = dDiffuseLight;
  pc_fragColor.xyz = pow (pc_fragColor.xyz, vec3(0.5, 0.5, 0.5));
  pc_fragColor.xyz = (pc_fragColor.xyz / 8.0);
  pc_fragColor.w = clamp (max (max (pc_fragColor.x, pc_fragColor.y), max (pc_fragColor.z, 0.003921569)), 0.0, 1.0);
  pc_fragColor.w = (ceil((pc_fragColor.w * 255.0)) / 255.0);
  pc_fragColor.xyz = (pc_fragColor.xyz / pc_fragColor.w);
  pc_fragColor.x += 0.23483893317536908;
}



