#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec2 vUv0;
uniform sampler2D source;
uniform vec2 pixelOffset;
void main ()
{
  vec2 uv_2;
  lowp vec4 color_3;
  color_3 = vec4(0.0, 0.0, 0.0, 0.0);
  uv_2 = vUv0;
  if ((pixelOffset.x > 1e-07)) {
    uv_2 = (vUv0 - (pixelOffset * 4.0));
  };
  for (highp int i_1 = 0; i_1 < 8; i_1++) {
    lowp vec4 c_4;
    if ((pixelOffset.x > 1e-07)) {
      c_4 = texture (source, (uv_2 + (pixelOffset * float(i_1))));
    } else {
      c_4 = texture (source, (uv_2 - (pixelOffset * float(i_1))));
    };
    color_3 = (color_3 + c_4);
  };
  color_3 = (color_3 / 8.0);
  pc_fragColor = color_3;
  pc_fragColor.x += 0.502583455373917;
}



