#version 100

precision mediump float;

uniform sampler2D tex;

uniform float alpha;

uniform bool remPremAlpha;

uniform bool multAlphaOnly;

varying vec2 texCoord;

void main() {
  vec4 color = texture2D(tex, texCoord);
  if ( remPremAlpha ) gl_FragColor = vec4(color.a > 0. ? color.rgb / color.a : vec3(0), color.a); else 
  if ( multAlphaOnly ) gl_FragColor = vec4( color.rgb, color.a * alpha ); else gl_FragColor = vec4( color.r * alpha, color.g * alpha, color.b * alpha, color.a * alpha );
}

