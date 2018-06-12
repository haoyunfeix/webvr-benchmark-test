#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
uniform sampler2D source;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 res_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = ((vec4(mod ((vec4(4.27819e+09, 1.671168e+07, 65280.0, 255.0) *
    (abs((texture (source, vec2(0.0, 0.0)).x - 2.147484e+09)) / 2.147484e+09)
  ), vec4(256.0, 256.0, 256.0, 256.0)))) / vec4(255.0, 255.0, 255.0, 255.0));
  res_2 = (tmpvar_3 - (tmpvar_3.xxyz * vec4(0.0, 0.00390625, 0.00390625, 0.00390625)));
  tmpvar_1 = res_2;
  pc_fragColor = tmpvar_1;
  pc_fragColor.x += 0.2327456695300132;
}



