#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec4 vUv;
in float vHeight;
uniform sampler2D opacityMap;
void main ()
{
  float gradient_1;
  vec2 uv_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture (opacityMap, vUv.xy);
  if ((tmpvar_3.y < 0.1)) {
    discard;
  };
  uv_2 = ((vUv.zw * 2.0) - 1.0);
  gradient_1 = ((1.0 - sqrt(
    dot (uv_2, uv_2)
  )) * 0.125);
  highp vec4 tmpvar_4;
  tmpvar_4.z = 0.0;
  tmpvar_4.x = gradient_1;
  tmpvar_4.y = (gradient_1 * vHeight);
  tmpvar_4.w = (vHeight / 4.0);
  pc_fragColor = tmpvar_4;
  pc_fragColor.x += 0.37642590016001165;
}



