#version 300 es
precision highp float;

in vec2 vTexCoord;

uniform sampler2D uTCol, uFCol;
uniform sampler2D uLast;

uniform int uIter;
uniform int uColorMode;

out vec4 outColor;

vec3 Tonemap_ACES(const vec3 x) {
    // Narkowicz 2015, "ACES Filmic Tone Mapping Curve"
    const float a = 2.51;
    const float b = 0.03;
    const float c = 2.43;
    const float d = 0.59;
    const float e = 0.14;
    return (x * (a * x + b)) / (x * (c * x + d) + e);
}

void main()
{
    vec4 tcol = textureLod( uTCol, vTexCoord, 0.0 );
    vec4 color = vec4( tcol.xyz, 1. );

    if ( uColorMode == 0 )
        outColor = color;
    else
    if ( uColorMode == 1 )
        outColor = vec4( clamp( pow( color.xyz, vec3(0.4545) ), 0.0, 1.0 ), 1.0 );
    else
    if ( uColorMode == 2 )
        outColor = vec4( clamp( Tonemap_ACES( color.xyz ), 0.0, 1.0 ), 1.0 );

    if ( uIter > 0 ) {
        vec4 lastColor = textureLod( uLast, vTexCoord, 0.0 );//.xyz;

        float weight = float(uIter+1);
        outColor = vec4( mix(lastColor.xyz, outColor.xyz, 1.0 / weight ), 1.0 );
    }
}
