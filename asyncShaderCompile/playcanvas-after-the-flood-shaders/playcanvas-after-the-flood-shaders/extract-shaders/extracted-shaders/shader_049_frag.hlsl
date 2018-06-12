
// Uniforms

uniform float _webgl_d5b4509b9521f54c : register(c0);
static const uint _webgl_bb15c76ae884963b = 0;
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
static  float2 _webgl_a0b62b4d8ddcd62b = {0, 0};
static  float _webgl_215477360de748ea = {0};

static float4 gl_Color[1] =
{
    float4(0, 0, 0, 0)
};

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

#define GL_USES_FRAG_COLOR
float4 gl_texture2D(uint samplerIndex, float2 t)
{
    return textures2D[samplerIndex].Sample(samplers2D[samplerIndex], float2(t.x, t.y));
}

float4 mod_emu(float4 x, float4 y)
{
    return x - y * floor(x / y);
}


void f_webgl_d9c83b34075cfb4c(in float _webgl_2420662cd003acfa)
{
if ((_webgl_2420662cd003acfa < _webgl_d5b4509b9521f54c))
{
discard;
}
}
float4 f_webgl_21919dad1d92a81(in float _webgl_4c8d970c18ac22ed)
{
float4 _webgl_4ba25cf9b5244b88 = (mod_emu(((_webgl_4c8d970c18ac22ed * float4(16777216.0, 65536.0, 256.0, 1.0)) * float4(255.0, 255.0, 255.0, 255.0)), float4(256.0, 256.0, 256.0, 256.0)) / float4(255.0, 255.0, 255.0, 255.0));
(_webgl_4ba25cf9b5244b88 -= (_webgl_4ba25cf9b5244b88.xxyz * float4(0.0, 0.00390625, 0.00390625, 0.00390625)));
return _webgl_4ba25cf9b5244b88;
}
void gl_main()
{
(gl_Color[0] = float4(0.0, 0.0, 0.0, 0.0));
f_webgl_d9c83b34075cfb4c(gl_texture2D(_webgl_bb15c76ae884963b, _webgl_a0b62b4d8ddcd62b).x);
float _webgl_4c8d970c18ac22ed = _webgl_215477360de748ea;
(gl_Color[0] = f_webgl_21919dad1d92a81(_webgl_4c8d970c18ac22ed));
(gl_Color[0].x += 0.11057487);
}
struct PS_INPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD2;
    float2 v0 : TEXCOORD0;
    float v1 : TEXCOORD1;
};

struct PS_OUTPUT
{
    float4 gl_Color0 : SV_TARGET0;
};

PS_OUTPUT generateOutput()
{
    PS_OUTPUT output;
    output.gl_Color0 = gl_Color[0];
    return output;
}

PS_OUTPUT main(PS_INPUT input)
{
    _webgl_a0b62b4d8ddcd62b = input.v0.xy;
    _webgl_215477360de748ea = input.v1.x;

    gl_main();

    return generateOutput();
}

