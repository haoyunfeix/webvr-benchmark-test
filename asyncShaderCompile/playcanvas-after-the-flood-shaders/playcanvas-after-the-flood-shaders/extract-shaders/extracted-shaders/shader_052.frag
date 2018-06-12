#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec2 vUv0;
uniform sampler2D skyLutTex;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture (skyLutTex, vUv0);
  pc_fragColor = tmpvar_1;
  pc_fragColor.x += 0.5873395249425779;
}



