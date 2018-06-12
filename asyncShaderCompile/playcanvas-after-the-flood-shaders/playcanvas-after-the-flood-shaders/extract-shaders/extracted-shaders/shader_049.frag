precision highp float;

varying vec2 vUv0;

uniform sampler2D texture_opacityMap;

uniform float alpha_ref;
void alphaTest(float a) {
    if (a < alpha_ref) discard;
}
varying float vDepth;

vec4 packFloat(float depth)
{
    const vec4 bit_shift = vec4(256.0 * 256.0 * 256.0, 256.0 * 256.0, 256.0, 1.0);
    const vec4 bit_mask  = vec4(0.0, 1.0 / 256.0, 1.0 / 256.0, 1.0 / 256.0);
    vec4 res = mod(depth * bit_shift * vec4(255), vec4(256) ) / vec4(255);
    res -= res.xxyz * bit_mask;
    return res;
}

void main(void)
{
    alphaTest(texture2D(texture_opacityMap, vUv0).r );

float depth = vDepth;
gl_FragColor = packFloat(depth);
  gl_FragColor.x += 0.11057487498473173;
}


