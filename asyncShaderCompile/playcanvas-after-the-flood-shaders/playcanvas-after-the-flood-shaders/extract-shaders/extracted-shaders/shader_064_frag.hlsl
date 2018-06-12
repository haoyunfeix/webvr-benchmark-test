
// Uniforms

uniform float3 _webgl_1855da97c0758e43 : register(c0);
uniform float3 _webgl_16d8e27babe3e15e : register(c1);
uniform float _webgl_1a380463a8bc7359 : register(c2);
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
float _webgl_3c71294eb0cb894e = {0.0};
(_webgl_3c71294eb0cb894e = max(((_webgl_1a380463a8bc7359 - sqrt(dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada))) / _webgl_1a380463a8bc7359), 0.0));
(_webgl_9251dcdacdfa452 = _webgl_3c71294eb0cb894e);
if ((_webgl_3c71294eb0cb894e > 9.9999997e-06))
{
(_webgl_9251dcdacdfa452 = (_webgl_3c71294eb0cb894e * max(dot(_webgl_dbb0b86db3589565, (-_webgl_49a0cb6f9237aa8)), 0.0)));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 + (_webgl_9251dcdacdfa452 * _webgl_1855da97c0758e43)));
}
(out_webgl_9b98566002e557b5.xyz = _webgl_540f7c123bdf52c0);
(out_webgl_9b98566002e557b5.xyz = pow(out_webgl_9b98566002e557b5.xyz, float3(0.5, 0.5, 0.5)));
(out_webgl_9b98566002e557b5.xyz = (out_webgl_9b98566002e557b5.xyz / 8.0));
(out_webgl_9b98566002e557b5.w = clamp(max(max(out_webgl_9b98566002e557b5.x, out_webgl_9b98566002e557b5.y), max(out_webgl_9b98566002e557b5.z, 0.0039215689)), 0.0, 1.0));
(out_webgl_9b98566002e557b5.w = (ceil((out_webgl_9b98566002e557b5.w * 255.0)) / 255.0));
(out_webgl_9b98566002e557b5.xyz = (out_webgl_9b98566002e557b5.xyz / out_webgl_9b98566002e557b5.w));
(out_webgl_9b98566002e557b5.x += 0.30856955);
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

