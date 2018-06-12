#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec2 vUv0;
uniform sampler2D source;
uniform vec2 pixelOffset;
uniform float weight[5];
void main ()
{
  vec2 uv_2;
  lowp vec3 moments_3;
  moments_3 = vec3(0.0, 0.0, 0.0);
  uv_2 = (vUv0 - (pixelOffset * 2.5));
  for (highp int i_1 = 0; i_1 < 5; i_1++) {
    lowp vec4 c_4;
    lowp vec4 tmpvar_5;
    tmpvar_5 = texture (source, (uv_2 + (pixelOffset * float(i_1))));
    c_4.zw = tmpvar_5.zw;
    lowp vec2 tmpvar_6;
    tmpvar_6.x = ((tmpvar_5.y * 0.003921569) + tmpvar_5.x);
    tmpvar_6.y = ((tmpvar_5.w * 0.003921569) + tmpvar_5.z);
    c_4.xy = tmpvar_6;
    moments_3 = (moments_3 + (c_4.xyz * weight[i_1]));
  };
  lowp vec2 enc_7;
  lowp vec2 tmpvar_8;
  tmpvar_8 = fract((vec2(1.0, 255.0) * moments_3.x));
  enc_7 = (tmpvar_8 - (tmpvar_8.yy * vec2(0.003921569, 0.003921569)));
  lowp vec2 enc_9;
  lowp vec2 tmpvar_10;
  tmpvar_10 = fract((vec2(1.0, 255.0) * moments_3.y));
  enc_9 = (tmpvar_10 - (tmpvar_10.yy * vec2(0.003921569, 0.003921569)));
  highp vec4 tmpvar_11;
  tmpvar_11.xy = enc_7;
  tmpvar_11.zw = enc_9;
  pc_fragColor = tmpvar_11;
  pc_fragColor.x += 0.969602155236791;
}



