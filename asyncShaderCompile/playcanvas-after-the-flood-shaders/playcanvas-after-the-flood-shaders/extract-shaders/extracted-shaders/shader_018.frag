#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
uniform float globalTime;
uniform float camera_near;
uniform float camera_far;
uniform vec3 view_position;
uniform sampler2D waterReflTex;
uniform sampler2D waterReflTexBlur;
uniform sampler2D waterNormalTex;
uniform sampler2D waterNormalTex2;
uniform sampler2D uScreenDepth;
uniform vec4 uScreenSize;
uniform mat4 matrix_viewProjection;
uniform float uvOffsetAmount;
float flatten;
void main ()
{
  vec2 nvec_2;
  vec2 dy_3;
  vec2 dx_4;
  vec2 SSAA_5[1];
  lowp float light_6;
  lowp float spec_7;
  lowp vec3 refl_8;
  vec2 origUv_9;
  vec3 viewDir_10;
  viewDir_10 = normalize((vPositionW - view_position));
  vec2 tmpvar_11;
  tmpvar_11 = ((0.4 * vPositionW.xz) + (globalTime * uvOffsetAmount));
  origUv_9 = tmpvar_11;
  refl_8 = vec3(0.0, 0.0, 0.0);
  spec_7 = 0.0;
  light_6 = 0.0;
  SSAA_5[0] = vec2(0.0, 0.0);
  dx_4 = dFdx(tmpvar_11);
  vec2 tmpvar_12;
  tmpvar_12 = dFdy(tmpvar_11);
  dy_3 = tmpvar_12;
  flatten = dot (abs(tmpvar_12), vec2(1.0, 1.0));
  vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = vPositionW;
  vec2 d_14;
  d_14 = (matrix_viewProjection * tmpvar_13).zw;
  float tmpvar_15;
  tmpvar_15 = (camera_far - camera_near);
  float tmpvar_16;
  tmpvar_16 = (camera_far + camera_near);
  float tmpvar_17;
  tmpvar_17 = (2.0 * camera_near);
  highp vec2 P_18;
  P_18 = (gl_FragCoord.xy * uScreenSize.zw);
  lowp float tmpvar_19;
  tmpvar_19 = clamp (pow ((
    abs(((tmpvar_17 / (tmpvar_16 -
      ((((d_14.x / d_14.y) * 0.5) + 0.5) * tmpvar_15)
    )) - (tmpvar_17 / (tmpvar_16 -
      (texture (uScreenDepth, P_18).x * tmpvar_15)
    ))))
   * 200.0), 0.5), 0.0, 1.0);
  nvec_2 = normalize((vPositionW.xz - view_position.xz));
  for (highp int i_1 = 0; i_1 < 1; i_1++) {
    lowp vec2 dudv_20;
    lowp vec3 normal2_21;
    lowp vec3 normal_22;
    vec2 tmpvar_23;
    tmpvar_23 = ((origUv_9 + (SSAA_5[i_1].x * dx_4)) + (SSAA_5[i_1].y * dy_3));
    normal_22 = (((texture (waterNormalTex, tmpvar_23).xzy * 2.0) - 1.0) + ((texture (waterNormalTex,
      (tmpvar_23 * 0.5)
    ).xzy * 2.0) - 1.0));
    normal_22 = (normal_22 + ((texture (waterNormalTex,
      (tmpvar_23 * 0.25)
    ).xzy * 2.0) - 1.0));
    normal2_21 = (((texture (waterNormalTex, tmpvar_23.yx).xzy * 2.0) - 1.0) + ((texture (waterNormalTex,
      (tmpvar_23.yx * 0.5)
    ).xzy * 2.0) - 1.0));
    normal2_21 = (normal2_21 + ((texture (waterNormalTex,
      (tmpvar_23.yx * 0.25)
    ).xzy * 2.0) - 1.0));
    normal_22 = (normalize(mix (normal_22, normal2_21,
      abs(nvec_2.x)
    )) + ((
      ((texture (waterNormalTex2, (tmpvar_23 * 0.025)).xyz * 2.0) - 1.0)
     +
      ((texture (waterNormalTex2, ((tmpvar_23 * 0.025) + 0.5)).xyz * 2.0) - 1.0)
    ) * 0.25));
    lowp vec3 tmpvar_24;
    tmpvar_24 = normalize(normal_22);
    normal_22 = tmpvar_24;
    lowp float tmpvar_25;
    tmpvar_25 = (1.0 - max (dot (tmpvar_24,
      -(viewDir_10)
    ), 0.0));
    lowp float tmpvar_26;
    tmpvar_26 = (tmpvar_25 * tmpvar_25);
    spec_7 = (spec_7 + (0.04 + (
      (0.96 * tmpvar_25)
     *
      (tmpvar_26 * tmpvar_26)
    )));
    dudv_20.x = (tmpvar_24.x * 0.25);
    dudv_20.y = (tmpvar_24.z * 2.0);
    dudv_20 = (dudv_20 / ((flatten * 3.0) + 1.0));
    highp vec2 P_27;
    highp vec2 tmpvar_28;
    tmpvar_28 = (gl_FragCoord.xy * uScreenSize.zw);
    P_27 = (tmpvar_28 + dudv_20);
    highp vec2 P_29;
    P_29 = (tmpvar_28 + dudv_20);
    refl_8 = (refl_8 + mix (texture (waterReflTex, P_27).xyz, texture (waterReflTexBlur, P_29).xyz, clamp (flatten, 0.0, 1.0)));
    light_6 = (light_6 + clamp ((
      dot (vec3(0.0, 0.1961161, 0.9805807), tmpvar_24)
     * 4.0), 0.0, 1.0));
  };
  lowp vec4 tmpvar_30;
  tmpvar_30.xyz = mix ((vec3(0.02422294, 0.03702851, 0.06381487) * light_6), refl_8, spec_7);
  tmpvar_30.w = tmpvar_19;
  pc_fragColor = tmpvar_30;
  pc_fragColor.x += 0.6212810213758877;
}



