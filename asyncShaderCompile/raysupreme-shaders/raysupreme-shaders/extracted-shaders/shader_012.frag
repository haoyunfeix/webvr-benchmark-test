#version 300 es
precision highp float;

layout(location=0) out vec4 ro;
layout(location=1) out vec4 rd;
// layout(location=2) out vec4 tcol;
// layout(location=3) out vec4 fcol;

in vec2 vTexCoord;

uniform vec3 uOrigin, uLookAt;
uniform float uFov;
uniform vec2 inResolution;

uniform float uTime;
uniform bool uJitter;

vec2 randv2;

vec2 rand2() {// implementation derived from one found at: lumina.sourceforge.net/Tutorials/Noise.html
    randv2 += vec2(1.0,1.0);
    return vec2(fract(sin(dot(randv2.xy ,vec2(12.9898,78.233))) * 43758.5453), fract(cos(dot(randv2.xy ,vec2(4.898,7.23))) * 23421.631));
}

void main()
{
    // --- Setup Camera

    float ratio = inResolution.x / inResolution.y;
    vec2 pixelSize = vec2(1.0) / inResolution.xy;

    randv2 = fract(cos((vTexCoord.xy+vTexCoord.yx*vec2(1000.0,1000.0))+vec2(uTime)*10.0));

    float halfWidth = tan(radians(uFov) * 0.5);
    float halfHeight = halfWidth / ratio;

    vec3 upVector = vec3(0.0, 1.0, 0.0);

    vec3 w = normalize(uOrigin - uLookAt);
    vec3 u = cross(upVector, w);
    vec3 v = cross(w, u);

    vec3 lowerLeft = uOrigin - halfWidth * u - halfHeight * v - w;
    vec3 horizontal = u * halfWidth * 2.0;
    vec3 vertical = v * halfHeight * 2.0;

    // ---

    vec3 dir = lowerLeft - uOrigin;
    vec2 rand;

    if ( uJitter ) rand = rand2();
    else rand = vec2( 0.5 );

    dir += horizontal * (pixelSize.x * rand.x + vTexCoord.x);
    dir += vertical * (pixelSize.y * rand.y + 1.0 - vTexCoord.y);

    // ---

    ro = vec4( uOrigin, 0 );
    rd = vec4( normalize( dir ), 0 );
}
