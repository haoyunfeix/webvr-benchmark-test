#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec4 vUv;
in vec3 vPositionW;
in vec3 vPositionL;
in vec3 vNormalW;
in float vHeight;
uniform sampler2D diffuseMap;
uniform sampler2D opacityMap;
uniform sampler2D topMap;
uniform lowp samplerCube skyboxLowCurrent;
uniform vec4 light_posRadius;
uniform vec4 light_directionInner;
uniform vec4 light_colorOuter;
uniform mat4 light_shadowMatrix;
uniform sampler2D light_shadowMap;
vec3 dLightDirW;
void main ()
{
  lowp float dAtten_1;
  vec2 offsets_3[8];
  float shadow_4;
  float height_5;
  lowp vec3 color_6;
  vec2 topUv_7;
  topUv_7 = (((vPositionL.xz / vec2(16.0, -16.0)) * 0.5) + 0.5);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (diffuseMap, vUv.xy);
  color_6 = tmpvar_8.xyz;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (opacityMap, vUv.xy);
  lowp float tmpvar_10;
  tmpvar_10 = tmpvar_9.y;
  if ((tmpvar_9.y < 0.01)) {
    discard;
  };
  float tmpvar_11;
  tmpvar_11 = ((vHeight / 4.0) + 0.01);
  height_5 = tmpvar_11;
  shadow_4 = 0.0;
  offsets_3[0] = vec2(-0.006392625, -0.003720859);
  offsets_3[1] = vec2(-0.004324322, -0.01204515);
  offsets_3[2] = vec2(-0.007974359, 0.004804211);
  offsets_3[3] = vec2(0.00710513, 0.003540039);
  offsets_3[4] = vec2(-0.0002272555, 0.01017307);
  offsets_3[5] = vec2(0.004528881, -0.007294784);
  offsets_3[6] = vec2(0.01312843, -0.004660728);
  offsets_3[7] = vec2(0.01099158, 0.01052593);
  for (highp int i_2 = 0; i_2 < 8; i_2++) {
    lowp vec4 tmpvar_12;
    tmpvar_12 = texture (topMap, (topUv_7 + offsets_3[i_2]));
    float tmpvar_13;
    if ((height_5 < tmpvar_12.w)) {
      tmpvar_13 = 0.125;
    } else {
      tmpvar_13 = 0.0;
    };
    shadow_4 = (shadow_4 + tmpvar_13);
  };
  color_6 = (tmpvar_8.xyz * (1.0 - (shadow_4 * 0.4)));
  color_6 = (color_6 * ((tmpvar_11 / 3.0) + 0.84));
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture (skyboxLowCurrent, vec3(0.0, 1.0, 0.0));
  lowp vec3 tmpvar_15;
  tmpvar_15 = ((8.0 * tmpvar_14.w) * tmpvar_14.xyz);
  color_6 = ((color_6 * tmpvar_15) * (tmpvar_15 * 3.0));
  float tmpvar_16;
  if (gl_FrontFacing) {
    tmpvar_16 = 1.0;
  } else {
    tmpvar_16 = 0.75;
  };
  color_6 = (color_6 * tmpvar_16);
  dLightDirW = (vPositionW - light_posRadius.xyz);
  vec3 tmpvar_17;
  tmpvar_17 = normalize(dLightDirW);
  float falloff_18;
  float tmpvar_19;
  tmpvar_19 = dot (dLightDirW, dLightDirW);
  float tmpvar_20;
  tmpvar_20 = (1.0/(light_posRadius.w));
  falloff_18 = ((1.0/((tmpvar_19 + 1.0))) * 16.0);
  float x_21;
  x_21 = (tmpvar_19 * (tmpvar_20 * tmpvar_20));
  float tmpvar_22;
  tmpvar_22 = clamp ((1.0 - (x_21 * x_21)), 0.0, 1.0);
  falloff_18 = (falloff_18 * (tmpvar_22 * tmpvar_22));
  float tmpvar_23;
  tmpvar_23 = clamp (((
    dot (tmpvar_17, light_directionInner.xyz)
   - light_colorOuter.w) / (light_directionInner.w - light_colorOuter.w)), 0.0, 1.0);
  dAtten_1 = (falloff_18 * (tmpvar_23 * (tmpvar_23 *
    (3.0 - (2.0 * tmpvar_23))
  )));
  if ((dAtten_1 > 1e-05)) {
    dAtten_1 = (dAtten_1 * clamp ((
      (dot (vNormalW, tmpvar_17) * 0.75)
     + 0.25), 0.0, 1.0));
    vec4 projPos_24;
    vec4 tmpvar_25;
    tmpvar_25.w = 1.0;
    tmpvar_25.xyz = vPositionW;
    vec4 tmpvar_26;
    tmpvar_26 = (light_shadowMatrix * tmpvar_25);
    projPos_24.zw = tmpvar_26.zw;
    projPos_24.xy = (tmpvar_26.xy / tmpvar_26.w);
    float Z_27;
    Z_27 = ((sqrt(
      dot (dLightDirW, dLightDirW)
    ) / light_posRadius.w) + -0.0002);
    lowp vec4 tmpvar_28;
    tmpvar_28 = texture (light_shadowMap, projPos_24.xy);
    lowp vec3 tmpvar_29;
    tmpvar_29.z = 0.0;
    tmpvar_29.x = ((tmpvar_28.y * 0.003921569) + tmpvar_28.x);
    tmpvar_29.y = ((tmpvar_28.w * 0.003921569) + tmpvar_28.z);
    float tmpvar_30;
    tmpvar_30 = (0.1 * Z_27);
    lowp float tmpvar_31;
    tmpvar_31 = max ((tmpvar_29.y - (tmpvar_29.x * tmpvar_29.x)), (tmpvar_30 * tmpvar_30));
    lowp float tmpvar_32;
    tmpvar_32 = (Z_27 - tmpvar_29.x);
    lowp float tmpvar_33;
    tmpvar_33 = (tmpvar_31 / (tmpvar_31 + (tmpvar_32 * tmpvar_32)));
    lowp float tmpvar_34;
    if ((Z_27 <= tmpvar_29.x)) {
      tmpvar_34 = 1.0;
    } else {
      tmpvar_34 = tmpvar_33;
    };
    dAtten_1 = (dAtten_1 * tmpvar_34);
  };
  color_6 = (color_6 + (tmpvar_8.xyz * (dAtten_1 * light_colorOuter.xyz)));
  lowp vec4 tmpvar_35;
  tmpvar_35.xyz = color_6;
  tmpvar_35.w = tmpvar_10;
  pc_fragColor = tmpvar_35;
  pc_fragColor.x += 0.6747210928428928;
}



