precision highp float;

varying vec2 vUv0;

uniform sampler2D texture_opacityMap;

uniform float alpha_ref;
void alphaTest(float a) {
    if (a < alpha_ref) discard;
}
varying vec3 worldPos;

uniform vec3 view_position;

uniform float light_radius;

// Packing a float in GLSL with multiplication and mod
// http://blog.gradientstudios.com/2012/08/23/shadow-map-improvement
vec4 packFloat(float depth) {
    const vec4 bit_shift = vec4(256.0 * 256.0 * 256.0, 256.0 * 256.0, 256.0, 1.0);
    const vec4 bit_mask  = vec4(0.0, 1.0 / 256.0, 1.0 / 256.0, 1.0 / 256.0);
    // combination of mod and multiplication and division works better
    vec4 res = mod(depth * bit_shift * vec4(255), vec4(256) ) / vec4(255);
    res -= res.xxyz * bit_mask;
    return res;
}
void main(void)
{
    alphaTest( texture2D(texture_opacityMap, vUv0).a );

   float depth = min(distance(view_position, worldPos) / light_radius, 0.99999);
   gl_FragData[0] = packFloat(depth);
  gl_FragData[0].x += 0.780584448246475;
}


