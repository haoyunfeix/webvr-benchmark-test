#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
uniform vec3 view_position;
uniform vec3 light_globalAmbient;
uniform vec3 fog_color;
uniform float fog_density;
uniform vec3 material_diffuse;
uniform vec3 material_emissive;
void main ()
{
  pc_fragColor.xyz = (material_diffuse * light_globalAmbient);
  pc_fragColor.xyz = (pc_fragColor.xyz + material_emissive);
  vec3 tmpvar_1;
  tmpvar_1 = (vPositionW - view_position);
  pc_fragColor.xyz = mix (fog_color, pc_fragColor.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_1, tmpvar_1))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = 1.0;
  pc_fragColor.x += 0.9837849514125712;
}



