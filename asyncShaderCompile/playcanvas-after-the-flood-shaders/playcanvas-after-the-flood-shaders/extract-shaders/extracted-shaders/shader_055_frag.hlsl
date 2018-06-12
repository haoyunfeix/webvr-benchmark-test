
// Uniforms

static const uint _webgl_dce711f263e3831e = 0;
uniform Texture2D<float4> textures2D[1] : register(t0);
uniform SamplerState samplers2D[1] : register(s0);
#define ANGLE_USES_DISCARD_REWRITING
#ifdef ANGLE_ENABLE_LOOP_FLATTEN
#define LOOP [loop]
#define FLATTEN [flatten]
#else
#define LOOP
#define FLATTEN
#endif
// Varyings
static  float4 _webgl_51798873aa8ff428 = {0, 0, 0, 0};
static  float _webgl_b702800ba18a8f38 = {0};

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
float _webgl_d8b4dc5f9ae20335 = {0.0};
float2 _webgl_38b555622b5f7ee0 = {0.0, 0.0};
float4 _webgl_f28d072c82c61bea = {0.0, 0.0, 0.0, 0.0};
(_webgl_f28d072c82c61bea = gl_texture2D(_webgl_dce711f263e3831e, _webgl_51798873aa8ff428.xy));
if ((_webgl_f28d072c82c61bea.y < 0.1))
{
discard;
}
(_webgl_38b555622b5f7ee0 = ((_webgl_51798873aa8ff428.zw * 2.0) - 1.0));
(_webgl_d8b4dc5f9ae20335 = ((1.0 - sqrt(dot(_webgl_38b555622b5f7ee0, _webgl_38b555622b5f7ee0))) * 0.125));
float4 _webgl_49a0cb6f9237aa8 = {0.0, 0.0, 0.0, 0.0};
(_webgl_49a0cb6f9237aa8.z = 0.0);
(_webgl_49a0cb6f9237aa8.x = _webgl_d8b4dc5f9ae20335);
(_webgl_49a0cb6f9237aa8.y = (_webgl_d8b4dc5f9ae20335 * _webgl_b702800ba18a8f38));
(_webgl_49a0cb6f9237aa8.w = (_webgl_b702800ba18a8f38 / 4.0));
(out_webgl_9b98566002e557b5 = _webgl_49a0cb6f9237aa8);
(out_webgl_9b98566002e557b5.x += 0.37642589);
}
struct PS_INPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD2;
    float4 v0 : TEXCOORD0;
    float v1 : TEXCOORD1;
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
    _webgl_51798873aa8ff428 = input.v0;
    _webgl_b702800ba18a8f38 = input.v1.x;

    gl_main();

    return generateOutput();
}

