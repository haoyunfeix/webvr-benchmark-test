#version 300 es
out vec3 vPositionW;
out vec3 vNormalW;
out vec3 vTangentW;
out vec3 vBinormalW;
out vec2 vUv1;
out vec2 vUV0_1;
layout(location=0) in vec3 vertex_position;
layout(location=1) in vec3 vertex_normal;
layout(location=2) in vec2 vertex_texCoord0;
layout(location=3) in vec2 vertex_texCoord1;
layout(location=4) in vec4 vertex_tangent;
uniform mat4 matrix_viewProjection;
uniform mat4 matrix_model;
uniform mat3 matrix_normal;
uniform vec4 texture_diffuseMapTransform;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = vertex_position;
  vec4 tmpvar_2;
  tmpvar_2 = (matrix_model * tmpvar_1);
  gl_Position = (matrix_viewProjection * tmpvar_2);
  vPositionW = tmpvar_2.xyz;
  vec3 tmpvar_3;
  tmpvar_3 = normalize((matrix_normal * vertex_normal));
  vNormalW = tmpvar_3;
  vec3 tmpvar_4;
  tmpvar_4 = normalize((matrix_normal * vertex_tangent.xyz));
  vTangentW = tmpvar_4;
  vBinormalW = (((tmpvar_3.yzx * tmpvar_4.zxy) - (tmpvar_3.zxy * tmpvar_4.yzx)) * vertex_tangent.w);
  vUv1 = vertex_texCoord1;
  vUV0_1 = ((vertex_texCoord0 * texture_diffuseMapTransform.xy) + texture_diffuseMapTransform.zw);
  vPositionW.x += 0.35588539613068537;
}



