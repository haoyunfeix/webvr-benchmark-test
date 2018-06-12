#version 300 es
precision highp sampler3D;
precision highp float;
out highp vec4 pc_fragColor;
uniform float exposure;
in vec2 vUv0;
uniform sampler2D uScreen;
uniform lowp sampler3D skyLutTex;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture (uScreen, vUv0);
  pc_fragColor = tmpvar_1;
  highp vec3 x_2;
  x_2 = (pc_fragColor.xyz * exposure);
  pc_fragColor.xyz = (((
    ((x_2 * ((0.15 * x_2) + 0.05)) + 0.004)
   /
    ((x_2 * ((0.15 * x_2) + 0.5)) + 0.06)
  ) - 0.06666666) * vec3(1.379064, 1.379064, 1.379064));
  pc_fragColor.xyz = pow ((pc_fragColor.xyz + vec3(1e-07, 1e-07, 1e-07)), vec3(0.45, 0.45, 0.45));
  lowp vec3 tmpvar_3;
  highp vec3 P_4;
  P_4 = ((clamp (pc_fragColor.xyz, vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0)) * vec3(0.9375, 0.9375, 0.9375)) + vec3(0.03125, 0.03125, 0.03125));
  tmpvar_3 = texture (skyLutTex, P_4).xyz;
  pc_fragColor.xyz = tmpvar_3;
  pc_fragColor.x += 0.8169671597502242;
}



