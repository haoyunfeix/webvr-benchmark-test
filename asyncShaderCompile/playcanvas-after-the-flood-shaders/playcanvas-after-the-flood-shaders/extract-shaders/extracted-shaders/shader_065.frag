#version 300 es
precision highp float;
out highp vec4 pc_fragColor;
in vec3 vPositionW;
in vec3 vNormalW;
in vec2 vUv1;
lowp vec3 dDiffuseLight;
vec3 dLightDirW;
float dAtten;
uniform vec3 light0_color;
uniform vec3 light0_position;
uniform float light0_radius;
uniform vec3 light0_direction;
uniform float light0_innerConeAngle;
uniform float light0_outerConeAngle;
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
  float tmpvar_5;
  tmpvar_5 = max (((light0_radius -
    sqrt(dot (dLightDirW, dLightDirW))
  ) / light0_radius), 0.0);
  dAtten = tmpvar_5;
  if ((tmpvar_5 > 1e-05)) {
    float tmpvar_6;
    tmpvar_6 = clamp (((
      dot (tmpvar_4, light0_direction)
     - light0_outerConeAngle) / (light0_innerConeAngle - light0_outerConeAngle)), 0.0, 1.0);
    dAtten = (tmpvar_5 * (tmpvar_6 * (tmpvar_6 *
      (3.0 - (2.0 * tmpvar_6))
    )));
    dAtten = (dAtten * max (dot (tmpvar_1,
      -(tmpvar_4)
    ), 0.0));
    dDiffuseLight = (dDiffuseLight + (dAtten * light0_color));
  };
  pc_fragColor.xyz = dDiffuseLight;
  pc_fragColor.xyz = pow (pc_fragColor.xyz, vec3(0.5, 0.5, 0.5));
  pc_fragColor.xyz = (pc_fragColor.xyz / 8.0);
  pc_fragColor.w = clamp (max (max (pc_fragColor.x, pc_fragColor.y), max (pc_fragColor.z, 0.003921569)), 0.0, 1.0);
  pc_fragColor.w = (ceil((pc_fragColor.w * 255.0)) / 255.0);
  pc_fragColor.xyz = (pc_fragColor.xyz / pc_fragColor.w);
  pc_fragColor.x += 0.9009069247164565;
}



