#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
in vec3 vNormalW;
uniform float mirrorTransition;
uniform vec3 view_position;
uniform float mirrorDepthOffset;
uniform float mirrorDensity;
uniform lowp samplerCube waterSkyTexture;
void main ()
{
  float specVal_2;
  bool specEffect_3;
  float density_4;
  lowp vec4 refl_5;
  vec3 viewDir_6;
  viewDir_6 = normalize((vPositionW - view_position));
  refl_5 = vec4(0.0, 0.0, 0.0, 0.0);
  float tmpvar_7;
  vec3 tmpvar_8;
  tmpvar_8 = (view_position - vPositionW);
  tmpvar_7 = sqrt(dot (tmpvar_8, tmpvar_8));
  specEffect_3 = bool(1);
  if ((mirrorDensity < 0.0)) {
    density_4 = -(mirrorDensity);
    specEffect_3 = bool(0);
  } else {
    density_4 = mirrorDensity;
  };
  float tmpvar_9;
  if (specEffect_3) {
    tmpvar_9 = mix (0.5, 0.3, clamp ((
      (tmpvar_7 - 3.0)
     / 3.0), 0.0, 1.0));
  } else {
    tmpvar_9 = 0.3;
  };
  specVal_2 = mix (tmpvar_9, 1.0, mirrorTransition);
  for (highp int i_1 = 0; i_1 < 1; i_1++) {
    vec3 N_10;
    N_10 = -(viewDir_6);
    lowp vec4 tmpvar_11;
    tmpvar_11 = texture (waterSkyTexture, ((vNormalW - (2.0 *
      (dot (N_10, vNormalW) * N_10)
    )) * vec3(-1.0, 1.0, 1.0)));
    lowp vec3 tmpvar_12;
    tmpvar_12 = ((8.0 * tmpvar_11.w) * tmpvar_11.xyz);
    refl_5.xyz = (refl_5.xyz + ((tmpvar_12 * tmpvar_12) * 3.0));
    float tmpvar_13;
    tmpvar_13 = (1.0 - max (dot (vNormalW,
      -(viewDir_6)
    ), 0.0));
    float tmpvar_14;
    tmpvar_14 = (tmpvar_13 * tmpvar_13);
    refl_5.w = (refl_5.w + (specVal_2 + (
      (1.0 - specVal_2)
     *
      (tmpvar_13 * (tmpvar_14 * tmpvar_14))
    )));
  };
  refl_5.xyz = mix ((refl_5.xyz * 0.9), refl_5.xyz, mirrorTransition);
  lowp vec4 tmpvar_15;
  tmpvar_15 = refl_5;
  if ((mirrorDepthOffset > 0.5)) {
    refl_5.xyz = (refl_5.xyz * 0.2);
    refl_5.w = (tmpvar_15.w + 0.5);
  };
  refl_5.w = (refl_5.w * density_4);
  refl_5.w = clamp (refl_5.w, 0.0, 1.0);
  pc_fragColor = refl_5;
  pc_fragColor.x += 0.8345646587009028;
}



