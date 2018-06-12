#version 100
attribute vec2 vPos;
uniform mat4 tM;
uniform mat4 pM;
void main() {
  mat4 m = pM * tM;
  gl_Position = m * vec4(vPos, 0, 1);
}
