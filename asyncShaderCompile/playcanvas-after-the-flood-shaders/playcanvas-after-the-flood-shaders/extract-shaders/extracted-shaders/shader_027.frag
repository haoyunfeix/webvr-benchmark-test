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
uniform float material_opacity;
uniform vec3 material_emissive;
uniform sampler2D texture_lightMap;
uniform float alpha_ref;
void main ()
{
  dAlpha = (texture (texture_opacityMap, vUv0).w * material_opacity);
  if ((dAlpha < alpha_ref)) {
    discard;
  };
  lowp vec4 rgba_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture (texture_diffuseMap, vUv0);
  rgba_1.w = tmpvar_2.w;
  rgba_1.xyz = pow (tmpvar_2.xyz, vec3(2.2, 2.2, 2.2));
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture (texture_lightMap, vUv1);
  lowp vec3 tmpvar_4;
  tmpvar_4 = ((8.0 * tmpvar_3.w) * tmpvar_3.xyz);
  lowp vec3 tmpvar_5;
  tmpvar_5 = (rgba_1.xyz * (tmpvar_4 * tmpvar_4));
  pc_fragColor.xyz = tmpvar_5;
  pc_fragColor.xyz = (pc_fragColor.xyz + material_emissive);
  vec3 tmpvar_6;
  tmpvar_6 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_6, tmpvar_6))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = dAlpha;
  pc_fragColor.x += 0.30597651340369025;
}



