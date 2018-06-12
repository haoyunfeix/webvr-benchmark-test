#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
uniform vec3 light_globalAmbient;
uniform vec3 material_diffuse;
uniform vec3 material_emissive;
void main ()
{
  pc_fragColor.xyz = (material_diffuse * light_globalAmbient);
  pc_fragColor.xyz = (pc_fragColor.xyz + material_emissive);
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.xyz = pc_fragColor.xyz;
  pc_fragColor.w = 1.0;
  pc_fragColor.x += 0.8099641417936252;
}



