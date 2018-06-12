#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
in vec2 vUv0;
uniform vec3 view_position;
uniform vec3 light_globalAmbient;
lowp float dAlpha;
uniform vec3 fog_color;
uniform float fog_density;
uniform vec3 material_diffuse;
uniform sampler2D texture_opacityMap;
in float vFade;
uniform sampler2D texture_emissiveMap;
uniform float alpha_ref;
void main ()
{
  dAlpha = (texture (texture_opacityMap, vUv0).w * vFade);
  if ((dAlpha < alpha_ref)) {
    discard;
  };
  pc_fragColor.xyz = (material_diffuse * light_globalAmbient);
  lowp vec4 rgba_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture (texture_emissiveMap, vUv0);
  rgba_1.w = tmpvar_2.w;
  rgba_1.xyz = pow (tmpvar_2.xyz, vec3(2.2, 2.2, 2.2));
  pc_fragColor.xyz = (pc_fragColor.xyz + rgba_1.xyz);
  vec3 tmpvar_3;
  tmpvar_3 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_3, tmpvar_3))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = dAlpha;
  pc_fragColor.x += 0.9991284524165025;
}



