#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
uniform sampler2D texture_mounting;
uniform sampler2D texture_lamp;
uniform mat4 matrix_model;
uniform vec3 view_position;
in vec3 vPositionW;
in vec3 vNormalW;
in vec3 vPositionL;
in vec3 vPosCam;
in vec2 vUv0;
uniform sampler2D skyTex1;
uniform sampler2D skyTex2;
uniform lowp samplerCube skyboxHigh;
uniform float skyBlend;
uniform vec3 fog_color;
uniform float fog_density;
void main ()
{
  highp int id_1;
  bool isInside_2;
  float d_3;
  vec3 reflDir_4;
  lowp vec4 color_5;
  vec3 pos_6;
  pos_6 = vPositionL;
  vec3 tmpvar_7;
  tmpvar_7 = normalize((vPositionL - vPosCam));
  color_5 = vec4(0.0, 0.0, 0.0, 0.0);
  mat3 tmpvar_8;
  tmpvar_8[uint(0)] = matrix_model[uint(0)].xyz;
  tmpvar_8[1u] = matrix_model[1u].xyz;
  tmpvar_8[2u] = matrix_model[2u].xyz;
  vec3 N_9;
  N_9 = -(vNormalW);
  vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_8 * (tmpvar_7 - (2.0 *
    (dot (N_9, tmpvar_7) * N_9)
  )));
  reflDir_4 = tmpvar_10;
  vec3 viewDir_11;
  viewDir_11 = (tmpvar_10 * vec3(-1.0, 1.0, 1.0));
  lowp vec3 tex1_12;
  if ((viewDir_11.y >= 0.0)) {
    float morphMoveLength_13;
    float tmpvar_14;
    tmpvar_14 = clamp (viewDir_11.y, 0.0, 1.0);
    morphMoveLength_13 = (mix (2.0, 0.9, tmpvar_14) * 0.0046875);
    vec3 tmpvar_15;
    tmpvar_15 = (viewDir_11 + ((
      (vec3(1.0, 0.0, 1.0) * -(skyBlend))
     * morphMoveLength_13) * tmpvar_14));
    vec2 tmpvar_16;
    tmpvar_16 = (tmpvar_15.xz / dot (vec3(1.0, 1.0, 1.0), abs(tmpvar_15)));
    vec2 tmpvar_17;
    tmpvar_17.x = (tmpvar_16.x - tmpvar_16.y);
    tmpvar_17.y = (tmpvar_16.x + tmpvar_16.y);
    vec3 tmpvar_18;
    tmpvar_18 = (viewDir_11 + ((
      (vec3(1.0, 0.0, 1.0) * (1.0 - skyBlend))
     * morphMoveLength_13) * tmpvar_14));
    vec2 tmpvar_19;
    tmpvar_19 = (tmpvar_18.xz / dot (vec3(1.0, 1.0, 1.0), abs(tmpvar_18)));
    vec2 tmpvar_20;
    tmpvar_20.x = (tmpvar_19.x - tmpvar_19.y);
    tmpvar_20.y = (tmpvar_19.x + tmpvar_19.y);
    lowp vec4 tmpvar_21;
    tmpvar_21 = texture (skyTex1, ((tmpvar_17 * 0.5) + vec2(0.5, 0.5)));
    lowp vec3 tmpvar_22;
    tmpvar_22 = ((8.0 * tmpvar_21.w) * tmpvar_21.xyz);
    lowp vec4 tmpvar_23;
    tmpvar_23 = texture (skyTex2, ((tmpvar_20 * 0.5) + vec2(0.5, 0.5)));
    lowp vec3 tmpvar_24;
    tmpvar_24 = ((8.0 * tmpvar_23.w) * tmpvar_23.xyz);
    tex1_12 = (mix ((tmpvar_22 * tmpvar_22), (tmpvar_24 * tmpvar_24), skyBlend) / 3.0);
  } else {
    lowp vec4 tmpvar_25;
    tmpvar_25 = texture (skyboxHigh, (viewDir_11 * vec3(-1.0, 1.0, 1.0)));
    lowp vec3 tmpvar_26;
    tmpvar_26 = ((8.0 * tmpvar_25.w) * tmpvar_25.xyz);
    tex1_12 = (tmpvar_26 * tmpvar_26);
  };
  color_5.xyz = tex1_12;
  float tmpvar_27;
  tmpvar_27 = (1.0 - clamp (dot (tmpvar_7,
    -(vNormalW)
  ), 0.0, 1.0));
  float tmpvar_28;
  tmpvar_28 = (tmpvar_27 * tmpvar_27);
  color_5.w = clamp ((0.32 + (
    (0.68 * tmpvar_27)
   *
    (tmpvar_28 * tmpvar_28)
  )), 0.0, 1.0);
  vec3 tmpvar_29;
  tmpvar_29 = abs(vNormalW);
  vec2 tmpvar_30;
  if ((tmpvar_29.x > tmpvar_29.z)) {
    tmpvar_30 = (vUv0 * vec2(0.5, 0.5));
  } else {
    tmpvar_30 = ((vUv0 * vec2(1.0, 0.5)) + vec2(0.0, 0.5));
  };
  lowp float tmpvar_31;
  tmpvar_31 = clamp ((texture (texture_mounting, tmpvar_30).y * 4.0), 0.0, 1.0);
  lowp vec4 tmpvar_32;
  tmpvar_32.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_32.w = tmpvar_31;
  color_5 = mix (tmpvar_32, color_5, clamp ((color_5.w +
    (1.0 - tmpvar_31)
  ), 0.0, 1.0));
  vec2 tmpvar_33;
  vec3 tmpvar_34;
  tmpvar_34 = (1.0/(tmpvar_7));
  vec3 tmpvar_35;
  tmpvar_35 = (tmpvar_34 * (vec3(-0.45, -0.45, -0.45) - vPositionL));
  vec3 tmpvar_36;
  tmpvar_36 = (tmpvar_34 * (vec3(0.45, 0.45, 0.45) - vPositionL));
  vec3 tmpvar_37;
  tmpvar_37 = min (tmpvar_36, tmpvar_35);
  vec3 tmpvar_38;
  tmpvar_38 = max (tmpvar_36, tmpvar_35);
  vec2 tmpvar_39;
  tmpvar_39 = max (tmpvar_37.xx, tmpvar_37.yz);
  float tmpvar_40;
  tmpvar_40 = max (tmpvar_39.x, tmpvar_39.y);
  vec2 tmpvar_41;
  tmpvar_41 = min (tmpvar_38.xx, tmpvar_38.yz);
  float tmpvar_42;
  tmpvar_42 = min (tmpvar_41.x, tmpvar_41.y);
  if ((tmpvar_40 > tmpvar_42)) {
    tmpvar_33 = vec2(-1.0, -1.0);
  } else {
    vec2 tmpvar_43;
    tmpvar_43.x = tmpvar_40;
    tmpvar_43.y = tmpvar_42;
    tmpvar_33 = tmpvar_43;
  };
  d_3 = tmpvar_33.x;
  isInside_2 = (tmpvar_33.x >= 0.0);
  pos_6 = (vPositionL + (tmpvar_33.x * tmpvar_7));
  vec3 boxSphN_44;
  boxSphN_44 = (pos_6 / vec3(0.9, 0.9, 0.9));
  bool tmpvar_45;
  tmpvar_45 = bool(1);
  vec3 tmpvar_46;
  vec3 tmpvar_47;
  tmpvar_47 = abs(boxSphN_44);
  if (((tmpvar_47.x > tmpvar_47.y) && (tmpvar_47.x > tmpvar_47.z))) {
    vec3 tmpvar_48;
    if ((boxSphN_44.x > 0.0)) {
      tmpvar_48 = vec3(1.0, 0.0, 0.0);
    } else {
      tmpvar_48 = vec3(-1.0, 0.0, 0.0);
    };
    tmpvar_46 = tmpvar_48;
    tmpvar_45 = bool(0);
  } else {
    if (((tmpvar_47.y > tmpvar_47.x) && (tmpvar_47.y > tmpvar_47.z))) {
      vec3 tmpvar_49;
      if ((boxSphN_44.y > 0.0)) {
        tmpvar_49 = vec3(0.0, 1.0, 0.0);
      } else {
        tmpvar_49 = vec3(0.0, -1.0, 0.0);
      };
      tmpvar_46 = tmpvar_49;
      tmpvar_45 = bool(0);
    };
  };
  if (tmpvar_45) {
    vec3 tmpvar_50;
    if ((boxSphN_44.z > 0.0)) {
      tmpvar_50 = vec3(0.0, 0.0, 1.0);
    } else {
      tmpvar_50 = vec3(0.0, 0.0, -1.0);
    };
    tmpvar_46 = tmpvar_50;
    tmpvar_45 = bool(0);
  };
  mat3 tmpvar_51;
  tmpvar_51[uint(0)] = matrix_model[uint(0)].xyz;
  tmpvar_51[1u] = matrix_model[1u].xyz;
  tmpvar_51[2u] = matrix_model[2u].xyz;
  vec3 N_52;
  N_52 = -(tmpvar_46);
  reflDir_4 = (tmpvar_51 * (tmpvar_7 - (2.0 *
    (dot (N_52, tmpvar_7) * N_52)
  )));
  vec3 viewDir_53;
  viewDir_53 = (reflDir_4 * vec3(-1.0, 1.0, 1.0));
  lowp vec3 tex1_54;
  if ((viewDir_53.y >= 0.0)) {
    float morphMoveLength_55;
    float tmpvar_56;
    tmpvar_56 = clamp (viewDir_53.y, 0.0, 1.0);
    morphMoveLength_55 = (mix (2.0, 0.9, tmpvar_56) * 0.0046875);
    vec3 tmpvar_57;
    tmpvar_57 = (viewDir_53 + ((
      (vec3(1.0, 0.0, 1.0) * -(skyBlend))
     * morphMoveLength_55) * tmpvar_56));
    vec2 tmpvar_58;
    tmpvar_58 = (tmpvar_57.xz / dot (vec3(1.0, 1.0, 1.0), abs(tmpvar_57)));
    vec2 tmpvar_59;
    tmpvar_59.x = (tmpvar_58.x - tmpvar_58.y);
    tmpvar_59.y = (tmpvar_58.x + tmpvar_58.y);
    vec3 tmpvar_60;
    tmpvar_60 = (viewDir_53 + ((
      (vec3(1.0, 0.0, 1.0) * (1.0 - skyBlend))
     * morphMoveLength_55) * tmpvar_56));
    vec2 tmpvar_61;
    tmpvar_61 = (tmpvar_60.xz / dot (vec3(1.0, 1.0, 1.0), abs(tmpvar_60)));
    vec2 tmpvar_62;
    tmpvar_62.x = (tmpvar_61.x - tmpvar_61.y);
    tmpvar_62.y = (tmpvar_61.x + tmpvar_61.y);
    lowp vec4 tmpvar_63;
    tmpvar_63 = texture (skyTex1, ((tmpvar_59 * 0.5) + vec2(0.5, 0.5)));
    lowp vec3 tmpvar_64;
    tmpvar_64 = ((8.0 * tmpvar_63.w) * tmpvar_63.xyz);
    lowp vec4 tmpvar_65;
    tmpvar_65 = texture (skyTex2, ((tmpvar_62 * 0.5) + vec2(0.5, 0.5)));
    lowp vec3 tmpvar_66;
    tmpvar_66 = ((8.0 * tmpvar_65.w) * tmpvar_65.xyz);
    tex1_54 = (mix ((tmpvar_64 * tmpvar_64), (tmpvar_66 * tmpvar_66), skyBlend) / 3.0);
  } else {
    lowp vec4 tmpvar_67;
    tmpvar_67 = texture (skyboxHigh, (viewDir_53 * vec3(-1.0, 1.0, 1.0)));
    lowp vec3 tmpvar_68;
    tmpvar_68 = ((8.0 * tmpvar_67.w) * tmpvar_67.xyz);
    tex1_54 = (tmpvar_68 * tmpvar_68);
  };
  color_5.xyz = mix (tex1_54, color_5.xyz, color_5.w);
  float tmpvar_69;
  tmpvar_69 = (1.0 - clamp (dot (tmpvar_7,
    -(tmpvar_46)
  ), 0.0, 1.0));
  float tmpvar_70;
  tmpvar_70 = (tmpvar_69 * tmpvar_69);
  color_5.w = clamp ((color_5.w + (0.32 +
    ((0.68 * tmpvar_69) * (tmpvar_70 * tmpvar_70))
  )), 0.0, 1.0);
  pos_6 = (vPositionL - (vNormalW * 0.001));
  id_1 = 0;
  d_3 = 99999.0;
  vec4 tmpvar_71;
  tmpvar_71.xyz = vec3(0.0, 1.0, 0.0);
  tmpvar_71.w = (0.5 - (ceil(
    ((pos_6.y + 0.5) * 8.5)
  ) / 8.5));
  float tmpvar_72;
  tmpvar_72 = -(((tmpvar_71.w + pos_6.y) / tmpvar_7.y));
  if ((tmpvar_72 < 99999.0)) {
    d_3 = tmpvar_72;
    id_1 = 2;
  };
  if ((tmpvar_7.z < 0.0)) {
    vec4 tmpvar_73;
    tmpvar_73.xyz = vec3(0.0, 0.0, 1.0);
    tmpvar_73.w = (0.5 - (floor(
      ((pos_6.z + 0.5) * 4.0)
    ) / 4.0));
    float tmpvar_74;
    tmpvar_74 = -(((tmpvar_73.w + pos_6.z) / tmpvar_7.z));
    if ((tmpvar_74 < d_3)) {
      d_3 = tmpvar_74;
      id_1 = 3;
    };
  } else {
    if ((tmpvar_7.z > 0.0)) {
      vec4 tmpvar_75;
      tmpvar_75.xyz = vec3(0.0, 0.0, 1.0);
      tmpvar_75.w = (0.5 - (ceil(
        ((pos_6.z + 0.5) * 4.0)
      ) / 4.0));
      float tmpvar_76;
      tmpvar_76 = -(((tmpvar_75.w + pos_6.z) / tmpvar_7.z));
      if ((tmpvar_76 < d_3)) {
        d_3 = tmpvar_76;
        id_1 = 3;
      };
    };
  };
  if ((tmpvar_7.x < 0.0)) {
    vec4 tmpvar_77;
    tmpvar_77.xyz = vec3(1.0, 0.0, 0.0);
    tmpvar_77.w = (0.5 - (floor(
      ((pos_6.x + 0.5) * 4.0)
    ) / 4.0));
    float tmpvar_78;
    tmpvar_78 = -(((tmpvar_77.w + pos_6.x) / tmpvar_7.x));
    if ((tmpvar_78 < d_3)) {
      d_3 = tmpvar_78;
      id_1 = 4;
    };
  } else {
    if ((tmpvar_7.x > 0.0)) {
      vec4 tmpvar_79;
      tmpvar_79.xyz = vec3(1.0, 0.0, 0.0);
      tmpvar_79.w = (0.5 - (ceil(
        ((pos_6.x + 0.5) * 4.0)
      ) / 4.0));
      float tmpvar_80;
      tmpvar_80 = -(((tmpvar_79.w + pos_6.x) / tmpvar_7.x));
      if ((tmpvar_80 < d_3)) {
        d_3 = tmpvar_80;
        id_1 = 4;
      };
    };
  };
  pos_6 = (pos_6 + (d_3 * tmpvar_7));
  vec2 tmpvar_81;
  if ((id_1 < 3)) {
    tmpvar_81 = ((pos_6.xz + vec2(0.5, 0.5)) * vec2(4.0, 4.0));
  } else {
    vec2 tmpvar_82;
    if ((id_1 < 4)) {
      tmpvar_82 = ((pos_6.xy + vec2(0.5, 0.5)) * vec2(4.0, 8.5));
    } else {
      tmpvar_82 = ((pos_6.zy + vec2(0.5, 0.5)) * vec2(4.0, 8.5));
    };
    tmpvar_81 = tmpvar_82;
  };
  vec2 tmpvar_83;
  tmpvar_83 = (1.0 - abs((
    (fract(tmpvar_81) * 2.0)
   - 1.0)));
  float tmpvar_84;
  tmpvar_84 = pow ((tmpvar_83.x * tmpvar_83.y), 0.25);
  bool tmpvar_85;
  tmpvar_85 = ((!(isInside_2) && (id_1 == 2)) && (pos_6.y < 0.5));
  if (isInside_2) {
    pos_6 = (pos_6 + vec3(0.5, 0.5, 0.5));
    vec3 tmpvar_86;
    tmpvar_86.x = matrix_model[3].x;
    tmpvar_86.y = matrix_model[3].y;
    tmpvar_86.z = matrix_model[3].z;
    vec3 p3_87;
    p3_87 = (floor((
      ((pos_6 * vec3(4.0, 8.5, 4.0)) + 0.05)
     + tmpvar_86)) * 1234.0);
    vec3 tmpvar_88;
    tmpvar_88 = fract((p3_87 * 0.1031));
    p3_87 = (tmpvar_88 + dot (tmpvar_88, (tmpvar_88.yzx + 19.19)));
    float tmpvar_89;
    tmpvar_89 = pow (fract((
      (p3_87.x + p3_87.y)
     * p3_87.z)), 8.0);
    lowp vec4 tmpvar_90;
    tmpvar_90 = texture (texture_lamp, (pos_6.xz * vec2(4.0, 4.0)));
    float tmpvar_91;
    if ((tmpvar_89 < 0.2)) {
      tmpvar_91 = 0.0;
    } else {
      tmpvar_91 = 1.0;
    };
    color_5.xyz = mix (((
      (vec3(0.0634, 0.1113, 0.2264) * tmpvar_84)
     +
      (((tmpvar_89 * vec3(2.0921, 1.0082, 0.0402)) * (tmpvar_84 * tmpvar_84)) * (tmpvar_84 * tmpvar_84))
    ) + (
      (tmpvar_90.xyz * tmpvar_91)
     * 8.0)), color_5.xyz, color_5.w);
    color_5.w = 1.0;
  };
  if (tmpvar_85) {
    lowp float tmpvar_92;
    tmpvar_92 = clamp (4.0, 0.0, 1.0);
    lowp vec4 tmpvar_93;
    tmpvar_93.xyz = vec3(0.0, 0.0, 0.0);
    tmpvar_93.w = tmpvar_92;
    color_5 = mix (tmpvar_93, color_5, clamp ((color_5.w +
      (1.0 - tmpvar_92)
    ), 0.0, 1.0));
  };
  vec2 tmpvar_94;
  vec3 tmpvar_95;
  tmpvar_95 = (1.0/(tmpvar_7));
  vec3 tmpvar_96;
  tmpvar_96 = (tmpvar_95 * (vec3(-0.501, -0.501, -0.501) - pos_6));
  vec3 tmpvar_97;
  tmpvar_97 = (tmpvar_95 * (vec3(0.501, 0.501, 0.501) - pos_6));
  vec3 tmpvar_98;
  tmpvar_98 = min (tmpvar_97, tmpvar_96);
  vec3 tmpvar_99;
  tmpvar_99 = max (tmpvar_97, tmpvar_96);
  vec2 tmpvar_100;
  tmpvar_100 = max (tmpvar_98.xx, tmpvar_98.yz);
  float tmpvar_101;
  tmpvar_101 = max (tmpvar_100.x, tmpvar_100.y);
  vec2 tmpvar_102;
  tmpvar_102 = min (tmpvar_99.xx, tmpvar_99.yz);
  float tmpvar_103;
  tmpvar_103 = min (tmpvar_102.x, tmpvar_102.y);
  if ((tmpvar_101 > tmpvar_103)) {
    tmpvar_94 = vec2(-1.0, -1.0);
  } else {
    vec2 tmpvar_104;
    tmpvar_104.x = tmpvar_101;
    tmpvar_104.y = tmpvar_103;
    tmpvar_94 = tmpvar_104;
  };
  pos_6 = (pos_6 + (tmpvar_94.y * tmpvar_7));
  bool tmpvar_105;
  tmpvar_105 = bool(1);
  vec3 tmpvar_106;
  vec3 tmpvar_107;
  tmpvar_107 = abs(pos_6);
  if (((tmpvar_107.x > tmpvar_107.y) && (tmpvar_107.x > tmpvar_107.z))) {
    vec3 tmpvar_108;
    if ((pos_6.x > 0.0)) {
      tmpvar_108 = vec3(1.0, 0.0, 0.0);
    } else {
      tmpvar_108 = vec3(-1.0, 0.0, 0.0);
    };
    tmpvar_106 = tmpvar_108;
    tmpvar_105 = bool(0);
  } else {
    if (((tmpvar_107.y > tmpvar_107.x) && (tmpvar_107.y > tmpvar_107.z))) {
      vec3 tmpvar_109;
      if ((pos_6.y > 0.0)) {
        tmpvar_109 = vec3(0.0, 1.0, 0.0);
      } else {
        tmpvar_109 = vec3(0.0, -1.0, 0.0);
      };
      tmpvar_106 = tmpvar_109;
      tmpvar_105 = bool(0);
    };
  };
  if (tmpvar_105) {
    vec3 tmpvar_110;
    if ((pos_6.z > 0.0)) {
      tmpvar_110 = vec3(0.0, 0.0, 1.0);
    } else {
      tmpvar_110 = vec3(0.0, 0.0, -1.0);
    };
    tmpvar_106 = tmpvar_110;
    tmpvar_105 = bool(0);
  };
  mat3 tmpvar_111;
  tmpvar_111[uint(0)] = matrix_model[uint(0)].xyz;
  tmpvar_111[1u] = matrix_model[1u].xyz;
  tmpvar_111[2u] = matrix_model[2u].xyz;
  vec3 N_112;
  N_112 = -(tmpvar_106);
  reflDir_4 = (tmpvar_111 * (tmpvar_7 - (2.0 *
    (dot (N_112, tmpvar_7) * N_112)
  )));
  vec3 viewDir_113;
  viewDir_113 = (reflDir_4 * vec3(-1.0, 1.0, 1.0));
  lowp vec3 tex1_114;
  if ((viewDir_113.y >= 0.0)) {
    float morphMoveLength_115;
    float tmpvar_116;
    tmpvar_116 = clamp (viewDir_113.y, 0.0, 1.0);
    morphMoveLength_115 = (mix (2.0, 0.9, tmpvar_116) * 0.0046875);
    vec3 tmpvar_117;
    tmpvar_117 = (viewDir_113 + ((
      (vec3(1.0, 0.0, 1.0) * -(skyBlend))
     * morphMoveLength_115) * tmpvar_116));
    vec2 tmpvar_118;
    tmpvar_118 = (tmpvar_117.xz / dot (vec3(1.0, 1.0, 1.0), abs(tmpvar_117)));
    vec2 tmpvar_119;
    tmpvar_119.x = (tmpvar_118.x - tmpvar_118.y);
    tmpvar_119.y = (tmpvar_118.x + tmpvar_118.y);
    vec3 tmpvar_120;
    tmpvar_120 = (viewDir_113 + ((
      (vec3(1.0, 0.0, 1.0) * (1.0 - skyBlend))
     * morphMoveLength_115) * tmpvar_116));
    vec2 tmpvar_121;
    tmpvar_121 = (tmpvar_120.xz / dot (vec3(1.0, 1.0, 1.0), abs(tmpvar_120)));
    vec2 tmpvar_122;
    tmpvar_122.x = (tmpvar_121.x - tmpvar_121.y);
    tmpvar_122.y = (tmpvar_121.x + tmpvar_121.y);
    lowp vec4 tmpvar_123;
    tmpvar_123 = texture (skyTex1, ((tmpvar_119 * 0.5) + vec2(0.5, 0.5)));
    lowp vec3 tmpvar_124;
    tmpvar_124 = ((8.0 * tmpvar_123.w) * tmpvar_123.xyz);
    lowp vec4 tmpvar_125;
    tmpvar_125 = texture (skyTex2, ((tmpvar_122 * 0.5) + vec2(0.5, 0.5)));
    lowp vec3 tmpvar_126;
    tmpvar_126 = ((8.0 * tmpvar_125.w) * tmpvar_125.xyz);
    tex1_114 = (mix ((tmpvar_124 * tmpvar_124), (tmpvar_126 * tmpvar_126), skyBlend) / 3.0);
  } else {
    lowp vec4 tmpvar_127;
    tmpvar_127 = texture (skyboxHigh, (viewDir_113 * vec3(-1.0, 1.0, 1.0)));
    lowp vec3 tmpvar_128;
    tmpvar_128 = ((8.0 * tmpvar_127.w) * tmpvar_127.xyz);
    tex1_114 = (tmpvar_128 * tmpvar_128);
  };
  float tmpvar_129;
  tmpvar_129 = (1.0 - clamp (dot (tmpvar_7, tmpvar_106), 0.0, 1.0));
  float tmpvar_130;
  tmpvar_130 = (tmpvar_129 * tmpvar_129);
  lowp vec4 tmpvar_131;
  tmpvar_131.xyz = tex1_114;
  tmpvar_131.w = (0.32 + ((0.68 * tmpvar_129) * (tmpvar_130 * tmpvar_130)));
  lowp vec4 tmpvar_132;
  tmpvar_132 = mix (tmpvar_131, color_5, color_5.w);
  color_5.w = tmpvar_132.w;
  vec3 tmpvar_133;
  tmpvar_133 = (vPositionW - view_position);
  color_5.xyz = mix (fog_color, tmpvar_132.xyz, clamp (exp(
    (-(sqrt(dot (tmpvar_133, tmpvar_133))) * fog_density)
  ), 0.0, 1.0));
  pc_fragColor = color_5;
  pc_fragColor.x += 0.9555024948811435;
}



