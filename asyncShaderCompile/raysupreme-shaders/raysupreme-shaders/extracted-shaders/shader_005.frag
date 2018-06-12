#version 100
precision mediump float;
uniform vec4 color;
uniform float uniformAlpha;
void main() {
  gl_FragColor = color;
  gl_FragColor = vec4( color.rgb, color.a * uniformAlpha );
}
