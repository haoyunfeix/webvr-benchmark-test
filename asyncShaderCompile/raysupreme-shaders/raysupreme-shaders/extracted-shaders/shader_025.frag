#version 100
precision mediump float;

varying vec2 vTexCoord;

uniform sampler2D uColorMap, uBlendMap;
uniform vec2 uSize;

uniform int uBlendMode;
uniform float uBlendAlpha;

vec4 getBlendedColor( in vec2 texCoord )
{
    vec4 color = texture2D( uColorMap, texCoord );

    if ( uBlendMode == 0 ) return color;
    else
    if ( uBlendMode == 1 ) {

        vec4 blendColor = texture2D( uBlendMap, texCoord );

        blendColor *= uBlendAlpha;

        vec4 mixColor;

        mixColor.a = 1.0 - (1.0 - blendColor.a) * (1.0 - color.a); // alpha
        mixColor.x = blendColor.x + color.x * (1.0 - blendColor.a );
        mixColor.y = blendColor.y + color.y * (1.0 - blendColor.a );
        mixColor.z = blendColor.z + color.z * (1.0 - blendColor.a );

        return mixColor;
    } else
    if ( uBlendMode == 2 ) {

        vec4 blendColor = texture2D( uBlendMap, texCoord );

        blendColor.a*=uBlendAlpha;

        vec4 mixColor;

        if ( color.a > 0.0 ) {
            color.x /= color.a;
            color.y /= color.a;
            color.z /= color.a;
        }

        mixColor.a = max( 0.0, color.a - blendColor.a);
        mixColor.x = color.x;
        mixColor.y = color.y;
        mixColor.z = color.z;

        mixColor.x *= mixColor.a;
        mixColor.y *= mixColor.a;
        mixColor.z *= mixColor.a;

        return mixColor;
    } else
    if ( uBlendMode == 3 ) {

        color.x*=color.a;
        color.y*=color.a;
        color.z*=color.a;

        return color;
    } else
    if ( uBlendMode == 4 ) {

        if ( color.a > 0.0 ) {
            color.x/=color.a;
            color.y/=color.a;
            color.z/=color.a;
        }

        return color;
    } else
    return color;
}

void main()
{
    vec4 color = getBlendedColor( vTexCoord );

    gl_FragColor = color;
}
