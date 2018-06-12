
// Uniforms

uniform float3 _webgl_35c9514d594e36f3 : register(c0);
uniform float3 _webgl_c36c05ae59fd43d7 : register(c1);
uniform float3 _webgl_3b3710b9db4788a7 : register(c2);
uniform float _webgl_5985a6d987efdfc3 : register(c3);
uniform float _webgl_f26f4f7166479737 : register(c4);
uniform float3 _webgl_2d459f8069f64681 : register(c5);
uniform float _webgl_d5b4509b9521f54c : register(c6);
static const uint _webgl_92406ab4e48f953a = 0;
static const uint _webgl_bb15c76ae884963b = 1;
uniform Texture2D<float4> textures2D[2] : register(t0);
uniform SamplerState samplers2D[2] : register(s0);
#define ANGLE_USES_DISCARD_REWRITING
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
    SamplerMetadata samplerMetadata[2] : packoffset(c4);
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
(_webgl_af27c8244adc12b9 = (gl_texture2D(_webgl_bb15c76ae884963b, _webgl_a0b62b4d8ddcd62b).w * _webgl_f26f4f7166479737));
if ((_webgl_af27c8244adc12b9 < _webgl_d5b4509b9521f54c))
{
discard;
}
float4 _webgl_322ceb7e2260455c = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_822b69d8b2db705f = {0.0, 0.0, 0.0, 0.0};
(_webgl_822b69d8b2db705f = gl_texture2D(_webgl_92406ab4e48f953a, _webgl_a0b62b4d8ddcd62b));
(_webgl_322ceb7e2260455c.w = _webgl_822b69d8b2db705f.w);
(_webgl_322ceb7e2260455c.xyz = pow(_webgl_822b69d8b2db705f.xyz, float3(2.2, 2.2, 2.2)));
float3 _webgl_f28d072c82c61bea = {0.0, 0.0, 0.0};
(_webgl_f28d072c82c61bea = (_webgl_322ceb7e2260455c.xyz * _webgl_c36c05ae59fd43d7));
(out_webgl_9b98566002e557b5.xyz = _webgl_f28d072c82c61bea);
(out_webgl_9b98566002e557b5.xyz = (out_webgl_9b98566002e557b5.xyz + _webgl_2d459f8069f64681));
float3 _webgl_49a0cb6f9237aa8 = {0.0, 0.0, 0.0};
(_webgl_49a0cb6f9237aa8 = (_webgl_5c81bf65ffac0762 - _webgl_35c9514d594e36f3));
(out_webgl_9b98566002e557b5.xyz = lerp(_webgl_3b3710b9db4788a7, out_webgl_9b98566002e557b5.xyz, clamp(exp(((-sqrt(dot(_webgl_49a0cb6f9237aa8, _webgl_49a0cb6f9237aa8))) * _webgl_5985a6d987efdfc3)), 0.0, 1.0)));
(out_webgl_9b98566002e557b5.xyz = out_webgl_9b98566002e557b5.xyz);
(out_webgl_9b98566002e557b5.xyz = out_webgl_9b98566002e557b5.xyz);
(out_webgl_9b98566002e557b5.w = _webgl_af27c8244adc12b9);
(out_webgl_9b98566002e557b5.x += 0.12024923);
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

