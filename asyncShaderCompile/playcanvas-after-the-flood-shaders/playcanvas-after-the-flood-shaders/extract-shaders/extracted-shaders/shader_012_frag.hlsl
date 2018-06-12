
// Uniforms

uniform float3 _webgl_35c9514d594e36f3 : register(c0);
uniform float3 _webgl_c36c05ae59fd43d7 : register(c1);
uniform float3 _webgl_3b3710b9db4788a7 : register(c2);
uniform float _webgl_5985a6d987efdfc3 : register(c3);
uniform float3 _webgl_16cc37db4120bb6a : register(c4);
uniform float3 _webgl_2d459f8069f64681 : register(c5);
static const uint _webgl_bb15c76ae884963b = 0;
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
static  float3 _webgl_5c81bf65ffac0762 = {0, 0, 0};
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

void f_initGlobals();
;
static float _webgl_af27c8244adc12b9 = {0};
void gl_main()
{
f_initGlobals();
(out_webgl_9b98566002e557b5 = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_af27c8244adc12b9 = gl_texture2D(_webgl_bb15c76ae884963b, _webgl_a0b62b4d8ddcd62b).y);
(out_webgl_9b98566002e557b5.xyz = (_webgl_16cc37db4120bb6a * _webgl_c36c05ae59fd43d7));
(out_webgl_9b98566002e557b5.xyz = (out_webgl_9b98566002e557b5.xyz + _webgl_2d459f8069f64681));
float3 _webgl_dbb0b86db3589565 = {0.0, 0.0, 0.0};
(_webgl_dbb0b86db3589565 = (_webgl_5c81bf65ffac0762 - _webgl_35c9514d594e36f3));
(out_webgl_9b98566002e557b5.xyz = lerp(_webgl_3b3710b9db4788a7, out_webgl_9b98566002e557b5.xyz, clamp(exp(((-sqrt(dot(_webgl_dbb0b86db3589565, _webgl_dbb0b86db3589565))) * _webgl_5985a6d987efdfc3)), 0.0, 1.0)));
(out_webgl_9b98566002e557b5.xyz = out_webgl_9b98566002e557b5.xyz);
(out_webgl_9b98566002e557b5.xyz = out_webgl_9b98566002e557b5.xyz);
(out_webgl_9b98566002e557b5.w = _webgl_af27c8244adc12b9);
(out_webgl_9b98566002e557b5.x += 0.71755534);
}
void f_initGlobals()
{
(_webgl_af27c8244adc12b9 = 0.0);
}
struct PS_INPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD2;
    float3 v0 : TEXCOORD0;
    float2 v1 : TEXCOORD1;
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
    _webgl_5c81bf65ffac0762 = input.v0.xyz;
    _webgl_a0b62b4d8ddcd62b = input.v1.xy;

    gl_main();

    return generateOutput();
}

