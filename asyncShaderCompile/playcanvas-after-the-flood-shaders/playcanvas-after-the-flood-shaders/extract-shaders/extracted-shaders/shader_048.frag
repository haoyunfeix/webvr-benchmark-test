precision highp float;

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
float depth = vDepth;
gl_FragColor = packFloat(depth);
  gl_FragColor.x += 0.44904586434739313;
}


