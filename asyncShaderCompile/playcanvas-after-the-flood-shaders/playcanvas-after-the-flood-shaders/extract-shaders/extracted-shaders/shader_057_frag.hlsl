
float float_ctor(int x0)
{
    return float(x0);
}
// Uniforms

uniform float2 _webgl_df1a0b1dfe1c3652 : register(c0);
static const uint _webgl_e2ddb1107a0c9a0a = 0;
uniform Texture2D<float4> textures2D[1] : register(t0);
uniform SamplerState samplers2D[1] : register(s0);
#ifdef ANGLE_ENABLE_LOOP_FLATTEN
#define LOOP [loop]
#define FLATTEN [flatten]
#else
#define LOOP
#define FLATTEN
#endif
// Varyings
static  float2 _webgl_a0b62b4d8ddcd62b = {0, 0};

static float4 out_webgl_9b98566002e557b5 = {0, 0, 0, 0};

cbuffer DriverConstants : register(b1)
{
    struct SamplerMetadata
    {
        int baseLevel;
        int internalFormatBits;
        int wrapModes;
        int padding;
    };
    SamplerMetadata samplerMetadata[1] : packoffset(c4);
};

float4 gl_texture2D(uint samplerIndex, float2 t)
{
    return textures2D[samplerIndex].Sample(samplers2D[samplerIndex], float2(t.x, t.y));
}

void gl_main()
{
(out_webgl_9b98566002e557b5 = float4(0.0, 0.0, 0.0, 0.0));
float2 _webgl_38b555622b5f7ee0 = {0.0, 0.0};
float4 _webgl_638ba108bd9dd80a = {0.0, 0.0, 0.0, 0.0};
(_webgl_638ba108bd9dd80a = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_38b555622b5f7ee0 = _webgl_a0b62b4d8ddcd62b);
if ((_webgl_df1a0b1dfe1c3652.x > 1e-07))
{
(_webgl_38b555622b5f7ee0 = (_webgl_a0b62b4d8ddcd62b - (_webgl_df1a0b1dfe1c3652 * 4.0)));
}
{LOOP for(int _webgl_c9355afc1aa04056 = {0}; (_webgl_c9355afc1aa04056 < 8); (_webgl_c9355afc1aa04056++))
{
float4 _webgl_f8db25681e64559f = {0.0, 0.0, 0.0, 0.0};
if ((_webgl_df1a0b1dfe1c3652.x > 1e-07))
{
(_webgl_f8db25681e64559f = gl_texture2D(_webgl_e2ddb1107a0c9a0a, (_webgl_38b555622b5f7ee0 + (_webgl_df1a0b1dfe1c3652 * float_ctor(_webgl_c9355afc1aa04056)))));
}
else
{
(_webgl_f8db25681e64559f = gl_texture2D(_webgl_e2ddb1107a0c9a0a, (_webgl_38b555622b5f7ee0 - (_webgl_df1a0b1dfe1c3652 * float_ctor(_webgl_c9355afc1aa04056)))));
}
(_webgl_638ba108bd9dd80a = (_webgl_638ba108bd9dd80a + _webgl_f8db25681e64559f));
}
}
(_webgl_638ba108bd9dd80a = (_webgl_638ba108bd9dd80a / 8.0));
(out_webgl_9b98566002e557b5 = _webgl_638ba108bd9dd80a);
(out_webgl_9b98566002e557b5.x += 0.50258344);
}
struct PS_INPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD1;
    float2 v0 : TEXCOORD0;
};

struct PS_OUTPUT
{
    float4 out_webgl_9b98566002e557b5 : SV_TARGET0;
};

PS_OUTPUT generateOutput()
{
    PS_OUTPUT output;
    output.out_webgl_9b98566002e557b5 = out_webgl_9b98566002e557b5;
    return output;
}

PS_OUTPUT main(PS_INPUT input)
{
    _webgl_a0b62b4d8ddcd62b = input.v0.xy;

    gl_main();

    return generateOutput();
}

