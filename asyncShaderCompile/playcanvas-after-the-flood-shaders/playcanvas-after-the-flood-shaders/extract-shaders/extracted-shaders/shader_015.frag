#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
in vec2 vUv0;
in vec2 vUv1;
uniform vec3 view_position;
lowp float dAlpha;
uniform vec3 fog_color;
uniform float fog_density;
uniform sampler2D texture_diffuseMap;
uniform sampler2D texture_opacityMap;
uniform vec3 material_emissive;
uniform sampler2D texture_lightMap;
uniform float alpha_ref;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture (texture_opacityMap, vUv1);
  dAlpha = tmpvar_1.w;
  if ((tmpvar_1.w < alpha_ref)) {
    discard;
  };
  lowp vec4 rgba_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture (texture_diffuseMap, vUv1);
  rgba_2.w = tmpvar_3.w;
  rgba_2.xyz = pow (tmpvar_3.xyz, vec3(2.2, 2.2, 2.2));
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture (texture_lightMap, vUv0);
  lowp vec3 tmpvar_5;
  tmpvar_5 = ((8.0 * tmpvar_4.w) * tmpvar_4.xyz);
  lowp vec3 tmpvar_6;
  tmpvar_6 = (rgba_2.xyz * (tmpvar_5 * tmpvar_5));
  pc_fragColor.xyz = tmpvar_6;
  pc_fragColor.xyz = (pc_fragColor.xyz + material_emissive);
  vec3 tmpvar_7;
  tmpvar_7 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_7, tmpvar_7))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = dAlpha;
  pc_fragColor.x += 0.3637571502966628;
}



