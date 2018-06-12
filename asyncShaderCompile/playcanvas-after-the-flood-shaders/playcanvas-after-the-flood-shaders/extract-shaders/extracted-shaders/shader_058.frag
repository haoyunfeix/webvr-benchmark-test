#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec2 vUv0;
uniform sampler2D source;
uniform vec2 pixelOffset;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture (source, vUv0);
  lowp vec4 tmpvar_2;
  if ((tmpvar_1.w > 0.0)) {
    tmpvar_2 = tmpvar_1;
  } else {
    tmpvar_2 = texture (source, (vUv0 - pixelOffset));
  };
  lowp vec4 tmpvar_3;
  if ((tmpvar_2.w > 0.0)) {
    tmpvar_3 = tmpvar_2;
  } else {
    vec2 tmpvar_4;
    tmpvar_4.x = 0.0;
    tmpvar_4.y = -(pixelOffset.y);
    tmpvar_3 = texture (source, (vUv0 + tmpvar_4));
  };
  lowp vec4 tmpvar_5;
  if ((tmpvar_3.w > 0.0)) {
    tmpvar_5 = tmpvar_3;
  } else {
    vec2 tmpvar_6;
    tmpvar_6.x = pixelOffset.x;
    tmpvar_6.y = -(pixelOffset.y);
    tmpvar_5 = texture (source, (vUv0 + tmpvar_6));
  };
  lowp vec4 tmpvar_7;
  if ((tmpvar_5.w > 0.0)) {
    tmpvar_7 = tmpvar_5;
  } else {
    vec2 tmpvar_8;
    tmpvar_8.y = 0.0;
    tmpvar_8.x = -(pixelOffset.x);
    tmpvar_7 = texture (source, (vUv0 + tmpvar_8));
  };
  lowp vec4 tmpvar_9;
  if ((tmpvar_7.w > 0.0)) {
    tmpvar_9 = tmpvar_7;
  } else {
    vec2 tmpvar_10;
    tmpvar_10.y = 0.0;
    tmpvar_10.x = pixelOffset.x;
    tmpvar_9 = texture (source, (vUv0 + tmpvar_10));
  };
  lowp vec4 tmpvar_11;
  if ((tmpvar_9.w > 0.0)) {
    tmpvar_11 = tmpvar_9;
  } else {
    vec2 tmpvar_12;
    tmpvar_12.x = -(pixelOffset.x);
    tmpvar_12.y = pixelOffset.y;
    tmpvar_11 = texture (source, (vUv0 + tmpvar_12));
  };
  lowp vec4 tmpvar_13;
  if ((tmpvar_11.w > 0.0)) {
    tmpvar_13 = tmpvar_11;
  } else {
    vec2 tmpvar_14;
    tmpvar_14.x = 0.0;
    tmpvar_14.y = pixelOffset.y;
    tmpvar_13 = texture (source, (vUv0 + tmpvar_14));
  };
  lowp vec4 tmpvar_15;
  if ((tmpvar_13.w > 0.0)) {
    tmpvar_15 = tmpvar_13;
  } else {
    tmpvar_15 = texture (source, (vUv0 + pixelOffset));
  };
  pc_fragColor = tmpvar_15;
  pc_fragColor.x += 0.08626637187997388;
}



