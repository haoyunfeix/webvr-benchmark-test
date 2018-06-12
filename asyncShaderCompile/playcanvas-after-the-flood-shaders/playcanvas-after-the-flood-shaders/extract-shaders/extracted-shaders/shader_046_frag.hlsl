
float4 vec4_ctor_float4(float4 x0)
{
    return float4(x0);
}
// Uniforms

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

float4 mod_emu(float4 x, float4 y)
{
    return x - y * floor(x / y);
}


void gl_main()
{
(out_webgl_9b98566002e557b5 = float4(0.0, 0.0, 0.0, 0.0));
float4 _webgl_dbb0b86db3589565 = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_da0c596f17760b0e = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_f28d072c82c61bea = {0.0, 0.0, 0.0, 0.0};
(_webgl_f28d072c82c61bea = (vec4_ctor_float4(mod_emu((float4(4278190080.0, 16711680.0, 65280.0, 255.0) * (abs((gl_texture2D(_webgl_e2ddb1107a0c9a0a, float2(0.0, 0.0)).x - 2147483904.0)) / 2147483904.0)), float4(256.0, 256.0, 256.0, 256.0))) / float4(255.0, 255.0, 255.0, 255.0)));
(_webgl_da0c596f17760b0e = (_webgl_f28d072c82c61bea - (_webgl_f28d072c82c61bea.xxyz * float4(0.0, 0.00390625, 0.00390625, 0.00390625))));
(_webgl_dbb0b86db3589565 = _webgl_da0c596f17760b0e);
(out_webgl_9b98566002e557b5 = _webgl_dbb0b86db3589565);
(out_webgl_9b98566002e557b5.x += 0.23274566);
}
struct PS_INPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD0;
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

    gl_main();

    return generateOutput();
}

