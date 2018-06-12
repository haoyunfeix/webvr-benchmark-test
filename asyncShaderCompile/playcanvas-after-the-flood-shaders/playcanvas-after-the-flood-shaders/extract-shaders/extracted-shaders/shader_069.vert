#version 300 es
in vec2 vertex_position;
out vec2 vUv0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.zw = vec2(0.5, 1.0);
  tmpvar_1.xy = vertex_position;
  gl_Position = tmpvar_1;
  vUv0 = ((vertex_position * 0.5) + 0.5);
  gl_Position.x += 0.11172586306356003;
}



