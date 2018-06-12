
// Uniforms

uniform float3 _webgl_1855da97c0758e43 : register(c0);
uniform float3 _webgl_16d8e27babe3e15e : register(c1);
uniform float _webgl_1a380463a8bc7359 : register(c2);
uniform float3 _webgl_35202d7eed2427d : register(c3);
uniform float _webgl_2dd2385497bef344 : register(c4);
uniform float _webgl_755af7149e45828a : register(c5);
static const uint _webgl_d1a7cd505ae30fad = 0;
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
static  float3 _webgl_cc88c95a9917294 = {0, 0, 0};
static  float2 _webgl_c381ead4a4662b4a = {0, 0};

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
static float3 _webgl_540f7c123bdf52c0 = {0, 0, 0};
static float3 _webgl_11482133dc10ada = {0, 0, 0};
static float _webgl_9251dcdacdfa452 = {0};
void gl_main()
{
f_initGlobals();
(out_webgl_9b98566002e557b5 = float4(0.0, 0.0, 0.0, 0.0));
float3 _webgl_dbb0b86db3589565 = {0.0, 0.0, 0.0};
(_webgl_dbb0b86db3589565 = normalize(_webgl_cc88c95a9917294));
float4 _webgl_822b69d8b2db705f = {0.0, 0.0, 0.0, 0.0};
(_webgl_822b69d8b2db705f = gl_texture2D(_webgl_d1a7cd505ae30fad, _webgl_c381ead4a4662b4a));
float3 _webgl_f28d072c82c61bea = {0.0, 0.0, 0.0};
(_webgl_f28d072c82c61bea = ((8.0 * _webgl_822b69d8b2db705f.w) * _webgl_822b69d8b2db705f.xyz));
(_webgl_540f7c123bdf52c0 = (_webgl_f28d072c82c61bea * _webgl_f28d072c82c61bea));
(_webgl_11482133dc10ada = (_webgl_5c81bf65ffac0762 - _webgl_16d8e27babe3e15e));
float3 _webgl_49a0cb6f9237aa8 = {0.0, 0.0, 0.0};
(_webgl_49a0cb6f9237aa8 = normalize(_webgl_11482133dc10ada));
float _webgl_2cdba9152504720c = {0.0};
float _webgl_8f7cfeb5dfbf859 = {0.0};
(_webgl_8f7cfeb5dfbf859 = dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada));
float _webgl_cfb863ec5a9ad847 = {0.0};
(_webgl_cfb863ec5a9ad847 = (1.0 / _webgl_1a380463a8bc7359));
(_webgl_2cdba9152504720c = ((1.0 / (_webgl_8f7cfeb5dfbf859 + 1.0)) * 16.0));
float _webgl_b77ded174e9598ae = {0.0};
(_webgl_b77ded174e9598ae = (_webgl_8f7cfeb5dfbf859 * (_webgl_cfb863ec5a9ad847 * _webgl_cfb863ec5a9ad847)));
float _webgl_46665ba4a0ebb347 = {0.0};
(_webgl_46665ba4a0ebb347 = clamp((1.0 - (_webgl_b77ded174e9598ae * _webgl_b77ded174e9598ae)), 0.0, 1.0));
(_webgl_2cdba9152504720c = (_webgl_2cdba9152504720c * (_webgl_46665ba4a0ebb347 * _webgl_46665ba4a0ebb347)));
(_webgl_9251dcdacdfa452 = _webgl_2cdba9152504720c);
if ((_webgl_2cdba9152504720c > 9.9999997e-06))
{
float _webgl_73488ceaa0ef8fe3 = {0.0};
(_webgl_73488ceaa0ef8fe3 = clamp(((dot(_webgl_49a0cb6f9237aa8, _webgl_35202d7eed2427d) - _webgl_755af7149e45828a) / (_webgl_2dd2385497bef344 - _webgl_755af7149e45828a)), 0.0, 1.0));
(_webgl_9251dcdacdfa452 = (_webgl_2cdba9152504720c * (_webgl_73488ceaa0ef8fe3 * (_webgl_73488ceaa0ef8fe3 * (3.0 - (2.0 * _webgl_73488ceaa0ef8fe3))))));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * max(dot(_webgl_dbb0b86db3589565, (-_webgl_49a0cb6f9237aa8)), 0.0)));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 + (_webgl_9251dcdacdfa452 * _webgl_1855da97c0758e43)));
}
(out_webgl_9b98566002e557b5.xyz = _webgl_540f7c123bdf52c0);
(out_webgl_9b98566002e557b5.xyz = pow(out_webgl_9b98566002e557b5.xyz, float3(0.5, 0.5, 0.5)));
(out_webgl_9b98566002e557b5.xyz = (out_webgl_9b98566002e557b5.xyz / 8.0));
(out_webgl_9b98566002e557b5.w = clamp(max(max(out_webgl_9b98566002e557b5.x, out_webgl_9b98566002e557b5.y), max(out_webgl_9b98566002e557b5.z, 0.0039215689)), 0.0, 1.0));
(out_webgl_9b98566002e557b5.w = (ceil((out_webgl_9b98566002e557b5.w * 255.0)) / 255.0));
(out_webgl_9b98566002e557b5.xyz = (out_webgl_9b98566002e557b5.xyz / out_webgl_9b98566002e557b5.w));
(out_webgl_9b98566002e557b5.x += 0.63338208);
}
void f_initGlobals()
{
(_webgl_540f7c123bdf52c0 = float3(0.0, 0.0, 0.0));
(_webgl_11482133dc10ada = float3(0.0, 0.0, 0.0));
(_webgl_9251dcdacdfa452 = 0.0);
}
struct PS_INPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD3;
    float3 v0 : TEXCOORD0;
    float3 v1 : TEXCOORD1;
    float2 v2 : TEXCOORD2;
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
    _webgl_cc88c95a9917294 = input.v1.xyz;
    _webgl_c381ead4a4662b4a = input.v2.xy;

    gl_main();

    return generateOutput();
}

