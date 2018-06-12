#version 300 es
in vec3 vertex_position;
uniform mat4 matrix_view;
uniform mat4 matrix_projection;
out vec3 vViewDir;
void main ()
{
  mat4 view_1;
  view_1 = matrix_view;
  vec4 tmpvar_2;
  tmpvar_2.xyw = matrix_view[3].xyw;
  tmpvar_2.z = 0.0;
  view_1[3] = tmpvar_2;
  vec4 tmpvar_3;
  tmpvar_3.xzw = view_1[3].xzw;
  tmpvar_3.y = tmpvar_2.z;
  view_1[3] = tmpvar_3;
  vec4 tmpvar_4;
  tmpvar_4.yzw = view_1[3].yzw;
  tmpvar_4.x = tmpvar_3.y;
  view_1[3] = tmpvar_4;
  vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = vertex_position;
  gl_Position = ((matrix_projection * view_1) * tmpvar_5);
  gl_Position.z = (gl_Position.w - 5e-06);
  vViewDir.y = vertex_position.y;
  mat2 tmpvar_6;
  tmpvar_6[uint(0)].x = 0.921061;
  tmpvar_6[uint(0)].y = -0.3894183;
  tmpvar_6[1u].x = 0.3894183;
  tmpvar_6[1u].y = 0.921061;
  vViewDir.xz = (tmpvar_6 * vertex_position.xz);
  gl_Position.x += 0.17126096117876966;
}



