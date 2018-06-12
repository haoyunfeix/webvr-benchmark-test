#version 300 es
layout(location=0) in vec3 vertex_position;
layout(location=1) in vec3 vertex_normal;
layout(location=3) in vec2 vertex_texCoord1;
out lowp vec4 vUv;
out lowp vec3 vPositionW;
out lowp vec3 vPositionL;
out lowp vec3 vNormalW;
out vec4 vRotation;
out lowp float vHeight;
out lowp vec2 vAnimUv;
uniform float globalTime;
uniform mat4 matrix_viewProjection;
uniform mat4 matrix_model;
uniform sampler2D sceneHeightmap;
void main ()
{
  lowp vec3 localNormalFront_1;
  lowp vec3 localPosFront_2;
  lowp vec3 localPos_3;
  lowp vec3 quadNormal_4;
  lowp vec2 rndA_5;
  lowp float tmpvar_6;
  tmpvar_6 = fract((vertex_texCoord1.y * 10.0));
  lowp vec2 tmpvar_7;
  tmpvar_7.x = vertex_texCoord1.y;
  tmpvar_7.y = tmpvar_6;
  vUv.xy = (vertex_position.xy + 0.5);
  vUv.xy = vUv.yx;
  vUv.zw = vUv.xy;
  vUv.xy = (vUv.xy / vec2(5.0, 1.0));
  vUv.xy = (vUv.xy + (floor(
    (tmpvar_7 * vec2(5.0, 1.0))
  ) / vec2(5.0, 1.0)));
  lowp float tmpvar_8;
  tmpvar_8 = ((dot (texture (sceneHeightmap,
    (((vertex_normal.xz / vec2(16.0, -16.0)) * 0.5) + 0.5)
  ), vec4(5.960464e-08, 1.525879e-05, 0.00390625, 1.0)) * -1000.0) + 100.0);
  lowp float tmpvar_9;
  if ((tmpvar_8 > 0.01)) {
    tmpvar_9 = tmpvar_8;
  } else {
    tmpvar_9 = -1.0;
  };
  lowp float tmpvar_10;
  tmpvar_10 = (vertex_normal.y - tmpvar_9);
  vHeight = tmpvar_10;
  rndA_5.y = tmpvar_7.y;
  rndA_5.x = (vertex_texCoord1.y + fract(globalTime));
  rndA_5.x = mix (0.25, rndA_5.x, clamp (tmpvar_10, 0.0, 1.0));
  vAnimUv = (vUv.zw / vec2(16.0, 5.0));
  vAnimUv = (vAnimUv + (floor(
    (rndA_5 * vec2(16.0, 5.0))
  ) / vec2(16.0, 5.0)));
  lowp float tmpvar_11;
  tmpvar_11 = ((vertex_position.y * vertex_position.y) * (vertex_texCoord1.y * 2.0));
  vec3 tmpvar_12;
  tmpvar_12.xz = vec2(0.0, 1.0);
  tmpvar_12.y = mix (-0.5, 0.5, (vertex_position.y + 0.5));
  vec3 tmpvar_13;
  tmpvar_13 = normalize(tmpvar_12);
  quadNormal_4.z = tmpvar_13.z;
  lowp vec2 tmpvar_14;
  lowp float pRotation_15;
  pRotation_15 = ((vertex_texCoord1.y + tmpvar_6) * 3.14);
  lowp float tmpvar_16;
  tmpvar_16 = cos(pRotation_15);
  lowp float tmpvar_17;
  tmpvar_17 = sin(pRotation_15);
  lowp mat2 tmpvar_18;
  tmpvar_18[uint(0)].x = tmpvar_16;
  tmpvar_18[uint(0)].y = -(tmpvar_17);
  tmpvar_18[1u].x = tmpvar_17;
  tmpvar_18[1u].y = tmpvar_16;
  tmpvar_14 = (tmpvar_18 * vertex_position.xy);
  lowp float pRotation_19;
  pRotation_19 = ((vertex_texCoord1.y + tmpvar_6) * 3.14);
  lowp float tmpvar_20;
  tmpvar_20 = cos(pRotation_19);
  lowp float tmpvar_21;
  tmpvar_21 = sin(pRotation_19);
  lowp mat2 tmpvar_22;
  tmpvar_22[uint(0)].x = tmpvar_20;
  tmpvar_22[uint(0)].y = -(tmpvar_21);
  tmpvar_22[1u].x = tmpvar_21;
  tmpvar_22[1u].y = tmpvar_20;
  quadNormal_4.xy = (tmpvar_22 * tmpvar_13.xy);
  lowp vec3 tmpvar_23;
  tmpvar_23.x = tmpvar_14.y;
  tmpvar_23.y = tmpvar_11;
  tmpvar_23.z = tmpvar_14.x;
  lowp vec3 tmpvar_24;
  tmpvar_24 = (tmpvar_23 * ((vertex_texCoord1.y * 0.5) + 1.0));
  lowp vec3 tmpvar_25;
  tmpvar_25.x = quadNormal_4.y;
  tmpvar_25.y = -(tmpvar_13.z);
  tmpvar_25.z = quadNormal_4.x;
  lowp vec3 tmpvar_26;
  tmpvar_26 = normalize(tmpvar_25);
  localPos_3.y = (tmpvar_24.y + 0.1);
  vec4 tmpvar_27;
  tmpvar_27 = abs(((
    fract((((
      (fract(((
        (globalTime * 0.2)
       +
        dot (vertex_normal, vec3(1.0, 1.0, 1.0))
      ) * vec4(1.975, 0.793, 0.375, 0.193))) * 2.0)
     - vec4(1.0, 1.0, 1.0, 1.0)) * 0.1) + 0.5))
   * 2.0) - 1.0));
  vec4 tmpvar_28;
  tmpvar_28 = ((tmpvar_27 * tmpvar_27) * (3.0 - (2.0 * tmpvar_27)));
  localPos_3.xz = (tmpvar_24.xz + ((
    (tmpvar_28.xz + tmpvar_28.yw)
   * tmpvar_11) * 4.0));
  localPosFront_2.y = localPos_3.y;
  float tmpvar_29;
  tmpvar_29 = ((globalTime + (vertex_texCoord1.y * 1.6)) * 4.0);
  lowp float tmpvar_30;
  tmpvar_30 = ((globalTime + (tmpvar_6 * 1.6)) * 4.0);
  float tmpvar_31;
  tmpvar_31 = cos(tmpvar_29);
  float tmpvar_32;
  tmpvar_32 = sin(tmpvar_29);
  mat2 tmpvar_33;
  tmpvar_33[uint(0)].x = tmpvar_31;
  tmpvar_33[uint(0)].y = -(tmpvar_32);
  tmpvar_33[1u].x = tmpvar_32;
  tmpvar_33[1u].y = tmpvar_31;
  localPosFront_2.xz = (tmpvar_33 * localPos_3.xz);
  lowp float tmpvar_34;
  tmpvar_34 = cos(tmpvar_30);
  lowp float tmpvar_35;
  tmpvar_35 = sin(tmpvar_30);
  lowp mat2 tmpvar_36;
  tmpvar_36[uint(0)].x = tmpvar_34;
  tmpvar_36[uint(0)].y = -(tmpvar_35);
  tmpvar_36[1u].x = tmpvar_35;
  tmpvar_36[1u].y = tmpvar_34;
  localPosFront_2.xy = (tmpvar_36 * localPosFront_2.yx).yx;
  lowp vec3 tmpvar_37;
  tmpvar_37 = mix (localPos_3, localPosFront_2, clamp (tmpvar_10, 0.0, 1.0));
  localPos_3 = tmpvar_37;
  localNormalFront_1.y = tmpvar_26.y;
  float tmpvar_38;
  tmpvar_38 = cos(tmpvar_29);
  float tmpvar_39;
  tmpvar_39 = sin(tmpvar_29);
  mat2 tmpvar_40;
  tmpvar_40[uint(0)].x = tmpvar_38;
  tmpvar_40[uint(0)].y = -(tmpvar_39);
  tmpvar_40[1u].x = tmpvar_39;
  tmpvar_40[1u].y = tmpvar_38;
  localNormalFront_1.xz = (tmpvar_40 * tmpvar_26.xz);
  float tmpvar_41;
  tmpvar_41 = cos(tmpvar_29);
  float tmpvar_42;
  tmpvar_42 = sin(tmpvar_29);
  mat2 tmpvar_43;
  tmpvar_43[uint(0)].x = tmpvar_41;
  tmpvar_43[uint(0)].y = -(tmpvar_42);
  tmpvar_43[1u].x = tmpvar_42;
  tmpvar_43[1u].y = tmpvar_41;
  vec4 tmpvar_44;
  tmpvar_44.x = tmpvar_41;
  tmpvar_44.y = -(tmpvar_42);
  tmpvar_44.z = tmpvar_42;
  tmpvar_44.w = tmpvar_41;
  vRotation = tmpvar_44;
  localNormalFront_1.xy = (tmpvar_43 * localNormalFront_1.yx).yx;
  vNormalW = normalize(mix (tmpvar_26, localNormalFront_1, clamp (tmpvar_10, 0.0, 1.0)));
  lowp vec3 tmpvar_45;
  tmpvar_45 = ((tmpvar_37 * 0.3) + vertex_normal);
  vPositionL = tmpvar_45;
  lowp vec4 tmpvar_46;
  tmpvar_46.w = 1.0;
  tmpvar_46.xyz = tmpvar_45;
  vPositionW = (matrix_model * tmpvar_46).xyz;
  lowp vec4 tmpvar_47;
  tmpvar_47.w = 1.0;
  tmpvar_47.xyz = vPositionW;
  gl_Position = (matrix_viewProjection * tmpvar_47);
  vPositionW.x += 0.9758382061758852;
}



