#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
in vec2 vUv0;
uniform vec3 view_position;
uniform vec3 fog_color;
uniform float fog_density;
uniform vec3 material_diffuse;
uniform vec3 material_emissive;
uniform sampler2D texture_lightMap;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture (texture_lightMap, vUv0);
  lowp vec3 tmpvar_2;
  tmpvar_2 = ((8.0 * tmpvar_1.w) * tmpvar_1.xyz);
  lowp vec3 tmpvar_3;
  tmpvar_3 = (material_diffuse * (tmpvar_2 * tmpvar_2));
  pc_fragColor.xyz = tmpvar_3;
  pc_fragColor.xyz = (pc_fragColor.xyz + material_emissive);
  vec3 tmpvar_4;
  tmpvar_4 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_4, tmpvar_4))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = 1.0;
  pc_fragColor.x += 0.16176894324086133;
}



