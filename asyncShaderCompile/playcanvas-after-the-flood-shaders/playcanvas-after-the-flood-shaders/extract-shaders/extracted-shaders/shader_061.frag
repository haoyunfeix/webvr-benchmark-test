#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
in vec3 vNormalW;
in vec2 vUv1;
lowp vec3 dDiffuseLight;
vec3 dLightDirW;
highp float dAtten;
uniform vec3 light0_color;
uniform vec3 light0_position;
uniform float light0_radius;
uniform vec4 light0_shadowParams;
uniform highp samplerCubeShadow light0_shadowMap;
uniform sampler2D texture_lightMap;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(vNormalW);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture (texture_lightMap, vUv1);
  lowp vec3 tmpvar_3;
  tmpvar_3 = ((8.0 * tmpvar_2.w) * tmpvar_2.xyz);
  dDiffuseLight = (tmpvar_3 * tmpvar_3);
  dLightDirW = (vPositionW - light0_position);
  vec3 tmpvar_4;
  tmpvar_4 = normalize(dLightDirW);
  highp float tmpvar_5;
  tmpvar_5 = max (((light0_radius -
    sqrt(dot (dLightDirW, dLightDirW))
  ) / light0_radius), 0.0);
  dAtten = tmpvar_5;
  if ((tmpvar_5 > 1e-05)) {
    dAtten = (tmpvar_5 * max (dot (tmpvar_1,
      -(tmpvar_4)
    ), 0.0));
    vec3 tmpvar_6;
    tmpvar_6 = ((vPositionW + (
      ((vNormalW * light0_shadowParams.y) * clamp ((1.0 - dot (vNormalW,
        -(tmpvar_4)
      )), 0.0, 1.0))
     *
      sqrt(dot (dLightDirW, dLightDirW))
    )) - light0_position);
    dLightDirW = tmpvar_6;
    highp vec4 shadowValues_7;
    highp vec3 shadowKernel_0_8;
    highp vec3 shadowKernel_1_9;
    float majorAxisLength_10;
    vec4 dirY_11;
    vec4 dirX_12;
    vec3 tmpvar_13;
    tmpvar_13 = normalize(tmpvar_6);
    vec3 tmpvar_14;
    tmpvar_14 = abs(tmpvar_13);
    vec4 tmpvar_15;
    tmpvar_15.xyz = vec3(1.0, 0.0, 0.0);
    tmpvar_15.w = tmpvar_13.x;
    dirX_12 = tmpvar_15;
    vec4 tmpvar_16;
    tmpvar_16.xyz = vec3(0.0, 1.0, 0.0);
    tmpvar_16.w = tmpvar_13.y;
    dirY_11 = tmpvar_16;
    majorAxisLength_10 = tmpvar_13.z;
    if (((tmpvar_14.x > tmpvar_14.y) && (tmpvar_14.x > tmpvar_14.z))) {
      vec4 tmpvar_17;
      tmpvar_17.xyz = vec3(0.0, 0.0, 1.0);
      tmpvar_17.w = tmpvar_13.z;
      dirX_12 = tmpvar_17;
      vec4 tmpvar_18;
      tmpvar_18.xyz = vec3(0.0, 1.0, 0.0);
      tmpvar_18.w = tmpvar_13.y;
      dirY_11 = tmpvar_18;
      majorAxisLength_10 = tmpvar_13.x;
    } else {
      if (((tmpvar_14.y > tmpvar_14.x) && (tmpvar_14.y > tmpvar_14.z))) {
        vec4 tmpvar_19;
        tmpvar_19.xyz = vec3(1.0, 0.0, 0.0);
        tmpvar_19.w = tmpvar_13.x;
        dirX_12 = tmpvar_19;
        vec4 tmpvar_20;
        tmpvar_20.xyz = vec3(0.0, 0.0, 1.0);
        tmpvar_20.w = tmpvar_13.z;
        dirY_11 = tmpvar_20;
        majorAxisLength_10 = tmpvar_13.y;
      };
    };
    float tmpvar_21;
    tmpvar_21 = (((1.0/(light0_shadowParams.x)) * 2.0) * abs(majorAxisLength_10));
    vec3 tmpvar_22;
    tmpvar_22 = (dirX_12.xyz * tmpvar_21);
    vec3 tmpvar_23;
    tmpvar_23 = (dirY_11.xyz * tmpvar_21);
    vec3 tmpvar_24;
    tmpvar_24 = -(tmpvar_22);
    vec3 tmpvar_25;
    tmpvar_25 = -(tmpvar_23);
    float tmpvar_26;
    tmpvar_26 = (1.0/(light0_shadowParams.w));
    float tmpvar_27;
    tmpvar_27 = (tmpvar_26 / 1000.0);
    float tmpvar_28;
    vec3 tmpvar_29;
    tmpvar_29 = abs(tmpvar_6);
    tmpvar_28 = (((
      ((tmpvar_26 + tmpvar_27) / (tmpvar_26 - tmpvar_27))
     -
      ((((2.0 * tmpvar_26) * tmpvar_27) / (tmpvar_26 - tmpvar_27)) / (max (tmpvar_29.x, max (tmpvar_29.y, tmpvar_29.z)) + light0_shadowParams.z))
    ) * 0.5) + 0.5);
    vec4 tmpvar_30;
    tmpvar_30.xyz = ((tmpvar_13 + tmpvar_24) + tmpvar_25);
    tmpvar_30.w = tmpvar_28;
    vec4 tmpvar_31;
    tmpvar_31.xyz = (tmpvar_13 + tmpvar_24);
    tmpvar_31.w = tmpvar_28;
    vec4 tmpvar_32;
    tmpvar_32.xyz = ((tmpvar_13 + tmpvar_24) + tmpvar_23);
    tmpvar_32.w = tmpvar_28;
    highp vec3 tmpvar_33;
    tmpvar_33.x = texture (light0_shadowMap, tmpvar_30);
    tmpvar_33.y = texture (light0_shadowMap, tmpvar_31);
    tmpvar_33.z = texture (light0_shadowMap, tmpvar_32);
    vec4 tmpvar_34;
    tmpvar_34.xyz = (tmpvar_13 + tmpvar_25);
    tmpvar_34.w = tmpvar_28;
    vec4 tmpvar_35;
    tmpvar_35.xyz = tmpvar_13;
    tmpvar_35.w = tmpvar_28;
    vec4 tmpvar_36;
    tmpvar_36.xyz = (tmpvar_13 + tmpvar_23);
    tmpvar_36.w = tmpvar_28;
    highp vec3 tmpvar_37;
    tmpvar_37.x = texture (light0_shadowMap, tmpvar_34);
    tmpvar_37.y = texture (light0_shadowMap, tmpvar_35);
    tmpvar_37.z = texture (light0_shadowMap, tmpvar_36);
    vec4 tmpvar_38;
    tmpvar_38.xyz = ((tmpvar_13 + tmpvar_22) + tmpvar_25);
    tmpvar_38.w = tmpvar_28;
    vec4 tmpvar_39;
    tmpvar_39.xyz = (tmpvar_13 + tmpvar_22);
    tmpvar_39.w = tmpvar_28;
    vec4 tmpvar_40;
    tmpvar_40.xyz = ((tmpvar_13 + tmpvar_22) + tmpvar_23);
    tmpvar_40.w = tmpvar_28;
    highp vec3 tmpvar_41;
    tmpvar_41.x = texture (light0_shadowMap, tmpvar_38);
    tmpvar_41.y = texture (light0_shadowMap, tmpvar_39);
    tmpvar_41.z = texture (light0_shadowMap, tmpvar_40);
    vec2 tmpvar_42;
    tmpvar_42.x = dirX_12.w;
    tmpvar_42.y = dirY_11.w;
    vec2 tmpvar_43;
    tmpvar_43 = fract(((
      (tmpvar_42 / abs(majorAxisLength_10))
     * 0.5) * light0_shadowParams.x));
    shadowKernel_0_8 = mix (tmpvar_33, tmpvar_37, tmpvar_43.x);
    shadowKernel_1_9 = mix (tmpvar_37, tmpvar_41, tmpvar_43.x);
    shadowValues_7.x = mix (shadowKernel_0_8.x, shadowKernel_0_8.y, tmpvar_43.y);
    shadowValues_7.y = mix (shadowKernel_0_8.y, shadowKernel_0_8.z, tmpvar_43.y);
    shadowValues_7.z = mix (shadowKernel_1_9.x, shadowKernel_1_9.y, tmpvar_43.y);
    shadowValues_7.w = mix (shadowKernel_1_9.y, shadowKernel_1_9.z, tmpvar_43.y);
    dAtten = (dAtten * (dot (shadowValues_7, vec4(1.0, 1.0, 1.0, 1.0)) * 0.25));
    dDiffuseLight = (dDiffuseLight + (dAtten * light0_color));
  };
  pc_fragColor.xyz = dDiffuseLight;
  pc_fragColor.xyz = pow (pc_fragColor.xyz, vec3(0.5, 0.5, 0.5));
  pc_fragColor.xyz = (pc_fragColor.xyz / 8.0);
  pc_fragColor.w = clamp (max (max (pc_fragColor.x, pc_fragColor.y), max (pc_fragColor.z, 0.003921569)), 0.0, 1.0);
  pc_fragColor.w = (ceil((pc_fragColor.w * 255.0)) / 255.0);
  pc_fragColor.xyz = (pc_fragColor.xyz / pc_fragColor.w);
  pc_fragColor.x += 0.7102114962457453;
}



