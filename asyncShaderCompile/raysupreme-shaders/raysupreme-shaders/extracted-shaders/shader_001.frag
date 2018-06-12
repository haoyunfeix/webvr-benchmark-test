#version 100

precision mediump float;
varying vec4 v_Color;
uniform float uniformAlpha;
void main() {
  vec4 color = v_Color;
  gl_FragColor = vec4( color.rgb, color.a * uniformAlpha );
}

