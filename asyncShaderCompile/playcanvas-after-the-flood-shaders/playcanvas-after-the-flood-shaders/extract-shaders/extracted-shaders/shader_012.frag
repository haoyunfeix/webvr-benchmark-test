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
uniform vec3 material_emissive;
void main ()
{
  dAlpha = texture (texture_opacityMap, vUv0).y;
  pc_fragColor.xyz = (material_diffuse * light_globalAmbient);
  pc_fragColor.xyz = (pc_fragColor.xyz + material_emissive);
  vec3 tmpvar_1;
  tmpvar_1 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_1, tmpvar_1))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = dAlpha;
  pc_fragColor.x += 0.7175553443676166;
}



