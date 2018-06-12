
// Uniforms

uniform float3 _webgl_1855da97c0758e43 : register(c0);
uniform float3 _webgl_16d8e27babe3e15e : register(c1);
uniform float _webgl_1a380463a8bc7359 : register(c2);
uniform float4 _webgl_6e78a9e7655aa6e8 : register(c3);
static const uint _webgl_d1a7cd505ae30fad = 0;
uniform Texture2D<float4> textures2D[1] : register(t0);
uniform SamplerState samplers2D[1] : register(s0);
static const uint _webgl_75db1bbd4bda93ec = 1;
static const uint textureIndexOffsetCube_comparison = 1;
static const uint samplerIndexOffsetCube_comparison = 1;
uniform TextureCube texturesCube_comparison[1] : register(t1);
uniform SamplerComparisonState samplersCube_comparison[1] : register(s1);
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
    SamplerMetadata samplerMetadata[2] : packoffset(c4);
};

float4 gl_texture2D(uint samplerIndex, float2 t)
{
    return textures2D[samplerIndex].Sample(samplers2D[samplerIndex], float2(t.x, t.y));
}

float gl_textureCube_comparison(uint samplerIndex, float4 t)
{
    const uint textureIndex = samplerIndex - textureIndexOffsetCube_comparison;
    const uint samplerArrayIndex = samplerIndex - samplerIndexOffsetCube_comparison;
    return texturesCube_comparison[textureIndex].SampleCmp(samplersCube_comparison[samplerArrayIndex], float3(t.x, t.y, t.z), t.w);
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
float3 _webgl_8f7cfeb5dfbf859 = {0.0, 0.0, 0.0};
(_webgl_8f7cfeb5dfbf859 = ((_webgl_5c81bf65ffac0762 + (((_webgl_cc88c95a9917294 * _webgl_6e78a9e7655aa6e8.y) * clamp((1.0 - dot(_webgl_cc88c95a9917294, (-_webgl_49a0cb6f9237aa8))), 0.0, 1.0)) * sqrt(dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada)))) - _webgl_16d8e27babe3e15e));
(_webgl_11482133dc10ada = _webgl_8f7cfeb5dfbf859);
float4 _webgl_c04142d03aa543aa = {0.0, 0.0, 0.0, 0.0};
float3 _webgl_64f8052e38e5d4ec = {0.0, 0.0, 0.0};
float3 _webgl_174bde296c43a6b5 = {0.0, 0.0, 0.0};
float _webgl_e08c517e33092e1c = {0.0};
float4 _webgl_62e430d30edc825e = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_bbd7bd5afcedb10b = {0.0, 0.0, 0.0, 0.0};
float3 _webgl_e25c9b31409332e8 = {0.0, 0.0, 0.0};
(_webgl_e25c9b31409332e8 = normalize(_webgl_8f7cfeb5dfbf859));
float3 _webgl_91c6fbb789786f97 = {0.0, 0.0, 0.0};
(_webgl_91c6fbb789786f97 = abs(_webgl_e25c9b31409332e8));
float4 _webgl_9e247bb82e5c20e0 = {0.0, 0.0, 0.0, 0.0};
(_webgl_9e247bb82e5c20e0.xyz = float3(1.0, 0.0, 0.0));
(_webgl_9e247bb82e5c20e0.w = _webgl_e25c9b31409332e8.x);
(_webgl_bbd7bd5afcedb10b = _webgl_9e247bb82e5c20e0);
float4 _webgl_3489059248406aa1 = {0.0, 0.0, 0.0, 0.0};
(_webgl_3489059248406aa1.xyz = float3(0.0, 1.0, 0.0));
(_webgl_3489059248406aa1.w = _webgl_e25c9b31409332e8.y);
(_webgl_62e430d30edc825e = _webgl_3489059248406aa1);
(_webgl_e08c517e33092e1c = _webgl_e25c9b31409332e8.z);
if (((_webgl_91c6fbb789786f97.x > _webgl_91c6fbb789786f97.y) && (_webgl_91c6fbb789786f97.x > _webgl_91c6fbb789786f97.z)))
{
float4 _webgl_9086f39b9ec20200 = {0.0, 0.0, 0.0, 0.0};
(_webgl_9086f39b9ec20200.xyz = float3(0.0, 0.0, 1.0));
(_webgl_9086f39b9ec20200.w = _webgl_e25c9b31409332e8.z);
(_webgl_bbd7bd5afcedb10b = _webgl_9086f39b9ec20200);
float4 _webgl_f26380f436f82532 = {0.0, 0.0, 0.0, 0.0};
(_webgl_f26380f436f82532.xyz = float3(0.0, 1.0, 0.0));
(_webgl_f26380f436f82532.w = _webgl_e25c9b31409332e8.y);
(_webgl_62e430d30edc825e = _webgl_f26380f436f82532);
(_webgl_e08c517e33092e1c = _webgl_e25c9b31409332e8.x);
}
else
{
if (((_webgl_91c6fbb789786f97.y > _webgl_91c6fbb789786f97.x) && (_webgl_91c6fbb789786f97.y > _webgl_91c6fbb789786f97.z)))
{
float4 _webgl_f06ab770d8ec1876 = {0.0, 0.0, 0.0, 0.0};
(_webgl_f06ab770d8ec1876.xyz = float3(1.0, 0.0, 0.0));
(_webgl_f06ab770d8ec1876.w = _webgl_e25c9b31409332e8.x);
(_webgl_bbd7bd5afcedb10b = _webgl_f06ab770d8ec1876);
float4 _webgl_cd6eaaff7ab905f1 = {0.0, 0.0, 0.0, 0.0};
(_webgl_cd6eaaff7ab905f1.xyz = float3(0.0, 0.0, 1.0));
(_webgl_cd6eaaff7ab905f1.w = _webgl_e25c9b31409332e8.z);
(_webgl_62e430d30edc825e = _webgl_cd6eaaff7ab905f1);
(_webgl_e08c517e33092e1c = _webgl_e25c9b31409332e8.y);
}
}
float _webgl_cf179e362a646f90 = {0.0};
(_webgl_cf179e362a646f90 = (((1.0 / _webgl_6e78a9e7655aa6e8.x) * 2.0) * abs(_webgl_e08c517e33092e1c)));
float3 _webgl_6472b8a26530e78b = {0.0, 0.0, 0.0};
(_webgl_6472b8a26530e78b = (_webgl_bbd7bd5afcedb10b.xyz * _webgl_cf179e362a646f90));
float3 _webgl_ba8e8168781d9774 = {0.0, 0.0, 0.0};
(_webgl_ba8e8168781d9774 = (_webgl_62e430d30edc825e.xyz * _webgl_cf179e362a646f90));
float3 _webgl_bd1cf0f064bc6fed = {0.0, 0.0, 0.0};
(_webgl_bd1cf0f064bc6fed = (-_webgl_6472b8a26530e78b));
float3 _webgl_dad807c3e946fcc4 = {0.0, 0.0, 0.0};
(_webgl_dad807c3e946fcc4 = (-_webgl_ba8e8168781d9774));
float _webgl_4a69825d2061f2e4 = {0.0};
(_webgl_4a69825d2061f2e4 = (1.0 / _webgl_6e78a9e7655aa6e8.w));
float _webgl_85f7bf17706eab85 = {0.0};
(_webgl_85f7bf17706eab85 = (_webgl_4a69825d2061f2e4 / 1000.0));
float _webgl_5cfd34df9dcb15f5 = {0.0};
float3 _webgl_cfe4f407d6834756 = {0.0, 0.0, 0.0};
(_webgl_cfe4f407d6834756 = abs(_webgl_8f7cfeb5dfbf859));
(_webgl_5cfd34df9dcb15f5 = (((((_webgl_4a69825d2061f2e4 + _webgl_85f7bf17706eab85) / (_webgl_4a69825d2061f2e4 - _webgl_85f7bf17706eab85)) - ((((2.0 * _webgl_4a69825d2061f2e4) * _webgl_85f7bf17706eab85) / (_webgl_4a69825d2061f2e4 - _webgl_85f7bf17706eab85)) / (max(_webgl_cfe4f407d6834756.x, max(_webgl_cfe4f407d6834756.y, _webgl_cfe4f407d6834756.z)) + _webgl_6e78a9e7655aa6e8.z))) * 0.5) + 0.5));
float4 _webgl_8eabcbad90e5f7cf = {0.0, 0.0, 0.0, 0.0};
(_webgl_8eabcbad90e5f7cf.xyz = ((_webgl_e25c9b31409332e8 + _webgl_bd1cf0f064bc6fed) + _webgl_dad807c3e946fcc4));
(_webgl_8eabcbad90e5f7cf.w = _webgl_5cfd34df9dcb15f5);
float4 _webgl_45bc8ea7e5f7a77c = {0.0, 0.0, 0.0, 0.0};
(_webgl_45bc8ea7e5f7a77c.xyz = (_webgl_e25c9b31409332e8 + _webgl_bd1cf0f064bc6fed));
(_webgl_45bc8ea7e5f7a77c.w = _webgl_5cfd34df9dcb15f5);
float4 _webgl_d7a381f02878b408 = {0.0, 0.0, 0.0, 0.0};
(_webgl_d7a381f02878b408.xyz = ((_webgl_e25c9b31409332e8 + _webgl_bd1cf0f064bc6fed) + _webgl_ba8e8168781d9774));
(_webgl_d7a381f02878b408.w = _webgl_5cfd34df9dcb15f5);
float3 _webgl_1e0a569fa8d323c5 = {0.0, 0.0, 0.0};
(_webgl_1e0a569fa8d323c5.x = gl_textureCube_comparison(_webgl_75db1bbd4bda93ec, _webgl_8eabcbad90e5f7cf));
(_webgl_1e0a569fa8d323c5.y = gl_textureCube_comparison(_webgl_75db1bbd4bda93ec, _webgl_45bc8ea7e5f7a77c));
(_webgl_1e0a569fa8d323c5.z = gl_textureCube_comparison(_webgl_75db1bbd4bda93ec, _webgl_d7a381f02878b408));
float4 _webgl_6b1576cc49ca380b = {0.0, 0.0, 0.0, 0.0};
(_webgl_6b1576cc49ca380b.xyz = (_webgl_e25c9b31409332e8 + _webgl_dad807c3e946fcc4));
(_webgl_6b1576cc49ca380b.w = _webgl_5cfd34df9dcb15f5);
float4 _webgl_82fa7c9f93cc7839 = {0.0, 0.0, 0.0, 0.0};
(_webgl_82fa7c9f93cc7839.xyz = _webgl_e25c9b31409332e8);
(_webgl_82fa7c9f93cc7839.w = _webgl_5cfd34df9dcb15f5);
float4 _webgl_6b8507d7c52a30c5 = {0.0, 0.0, 0.0, 0.0};
(_webgl_6b8507d7c52a30c5.xyz = (_webgl_e25c9b31409332e8 + _webgl_ba8e8168781d9774));
(_webgl_6b8507d7c52a30c5.w = _webgl_5cfd34df9dcb15f5);
float3 _webgl_bc517a070a88ef4a = {0.0, 0.0, 0.0};
(_webgl_bc517a070a88ef4a.x = gl_textureCube_comparison(_webgl_75db1bbd4bda93ec, _webgl_6b1576cc49ca380b));
(_webgl_bc517a070a88ef4a.y = gl_textureCube_comparison(_webgl_75db1bbd4bda93ec, _webgl_82fa7c9f93cc7839));
(_webgl_bc517a070a88ef4a.z = gl_textureCube_comparison(_webgl_75db1bbd4bda93ec, _webgl_6b8507d7c52a30c5));
float4 _webgl_a5cbea098f008107 = {0.0, 0.0, 0.0, 0.0};
(_webgl_a5cbea098f008107.xyz = ((_webgl_e25c9b31409332e8 + _webgl_6472b8a26530e78b) + _webgl_dad807c3e946fcc4));
(_webgl_a5cbea098f008107.w = _webgl_5cfd34df9dcb15f5);
float4 _webgl_e422f03590b051e5 = {0.0, 0.0, 0.0, 0.0};
(_webgl_e422f03590b051e5.xyz = (_webgl_e25c9b31409332e8 + _webgl_6472b8a26530e78b));
(_webgl_e422f03590b051e5.w = _webgl_5cfd34df9dcb15f5);
float4 _webgl_a2ea1ce929cac431 = {0.0, 0.0, 0.0, 0.0};
(_webgl_a2ea1ce929cac431.xyz = ((_webgl_e25c9b31409332e8 + _webgl_6472b8a26530e78b) + _webgl_ba8e8168781d9774));
(_webgl_a2ea1ce929cac431.w = _webgl_5cfd34df9dcb15f5);
float3 _webgl_d3a0349fad6621fb = {0.0, 0.0, 0.0};
(_webgl_d3a0349fad6621fb.x = gl_textureCube_comparison(_webgl_75db1bbd4bda93ec, _webgl_a5cbea098f008107));
(_webgl_d3a0349fad6621fb.y = gl_textureCube_comparison(_webgl_75db1bbd4bda93ec, _webgl_e422f03590b051e5));
(_webgl_d3a0349fad6621fb.z = gl_textureCube_comparison(_webgl_75db1bbd4bda93ec, _webgl_a2ea1ce929cac431));
float2 _webgl_48742813565ac55d = {0.0, 0.0};
(_webgl_48742813565ac55d.x = _webgl_bbd7bd5afcedb10b.w);
(_webgl_48742813565ac55d.y = _webgl_62e430d30edc825e.w);
float2 _webgl_f05a73b03fcb4961 = {0.0, 0.0};
(_webgl_f05a73b03fcb4961 = frac((((_webgl_48742813565ac55d / abs(_webgl_e08c517e33092e1c)) * 0.5) * _webgl_6e78a9e7655aa6e8.x)));
(_webgl_64f8052e38e5d4ec = lerp(_webgl_1e0a569fa8d323c5, _webgl_bc517a070a88ef4a, _webgl_f05a73b03fcb4961.x));
(_webgl_174bde296c43a6b5 = lerp(_webgl_bc517a070a88ef4a, _webgl_d3a0349fad6621fb, _webgl_f05a73b03fcb4961.x));
(_webgl_c04142d03aa543aa.x = lerp(_webgl_64f8052e38e5d4ec.x, _webgl_64f8052e38e5d4ec.y, _webgl_f05a73b03fcb4961.y));
(_webgl_c04142d03aa543aa.y = lerp(_webgl_64f8052e38e5d4ec.y, _webgl_64f8052e38e5d4ec.z, _webgl_f05a73b03fcb4961.y));
(_webgl_c04142d03aa543aa.z = lerp(_webgl_174bde296c43a6b5.x, _webgl_174bde296c43a6b5.y, _webgl_f05a73b03fcb4961.y));
(_webgl_c04142d03aa543aa.w = lerp(_webgl_174bde296c43a6b5.y, _webgl_174bde296c43a6b5.z, _webgl_f05a73b03fcb4961.y));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * (dot(_webgl_c04142d03aa543aa, float4(1.0, 1.0, 1.0, 1.0)) * 0.25)));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 + (_webgl_9251dcdacdfa452 * _webgl_1855da97c0758e43)));
}
(out_webgl_9b98566002e557b5.xyz = _webgl_540f7c123bdf52c0);
(out_webgl_9b98566002e557b5.xyz = pow(out_webgl_9b98566002e557b5.xyz, float3(0.5, 0.5, 0.5)));
(out_webgl_9b98566002e557b5.xyz = (out_webgl_9b98566002e557b5.xyz / 8.0));
(out_webgl_9b98566002e557b5.w = clamp(max(max(out_webgl_9b98566002e557b5.x, out_webgl_9b98566002e557b5.y), max(out_webgl_9b98566002e557b5.z, 0.0039215689)), 0.0, 1.0));
(out_webgl_9b98566002e557b5.w = (ceil((out_webgl_9b98566002e557b5.w * 255.0)) / 255.0));
(out_webgl_9b98566002e557b5.xyz = (out_webgl_9b98566002e557b5.xyz / out_webgl_9b98566002e557b5.w));
(out_webgl_9b98566002e557b5.x += 0.71021152);
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

