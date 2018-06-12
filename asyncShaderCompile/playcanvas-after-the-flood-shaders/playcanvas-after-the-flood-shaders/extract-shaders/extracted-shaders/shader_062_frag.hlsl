
// Uniforms

uniform float3 _webgl_1855da97c0758e43 : register(c0);
uniform float3 _webgl_16d8e27babe3e15e : register(c1);
uniform float _webgl_1a380463a8bc7359 : register(c2);
uniform float3 _webgl_35202d7eed2427d : register(c3);
uniform float _webgl_2dd2385497bef344 : register(c4);
uniform float _webgl_755af7149e45828a : register(c5);
uniform float4x4 _webgl_b0404067f6345e65 : register(c6);
uniform float4 _webgl_6e78a9e7655aa6e8 : register(c10);
static const uint _webgl_d1a7cd505ae30fad = 0;
uniform Texture2D<float4> textures2D[1] : register(t0);
uniform SamplerState samplers2D[1] : register(s0);
static const uint _webgl_75db1bbd4bda93ec = 1;
static const uint textureIndexOffset2D_comparison = 1;
static const uint samplerIndexOffset2D_comparison = 1;
uniform Texture2D textures2D_comparison[1] : register(t1);
uniform SamplerComparisonState samplers2D_comparison[1] : register(s1);
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

float gl_texture2D_comparison(uint samplerIndex, float3 t)
{
    const uint textureIndex = samplerIndex - textureIndexOffset2D_comparison;
    const uint samplerArrayIndex = samplerIndex - samplerIndexOffset2D_comparison;
    return textures2D_comparison[textureIndex].SampleCmp(samplers2D_comparison[samplerArrayIndex], float2(t.x, t.y), t.z);
}

void f_initGlobals();
;
static float3 _webgl_540f7c123bdf52c0 = {0, 0, 0};
static float3 _webgl_11482133dc10ada = {0, 0, 0};
static float3 _webgl_d79a635a1802e5aa = {0, 0, 0};
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
float4 _webgl_f932ead1931d2da0 = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_4879e67e5ac43730 = {0.0, 0.0, 0.0, 0.0};
(_webgl_4879e67e5ac43730.w = 1.0);
(_webgl_4879e67e5ac43730.xyz = (_webgl_5c81bf65ffac0762 + (((_webgl_cc88c95a9917294 * _webgl_6e78a9e7655aa6e8.y) * clamp((1.0 - dot(_webgl_cc88c95a9917294, (-_webgl_49a0cb6f9237aa8))), 0.0, 1.0)) * abs(dot((_webgl_5c81bf65ffac0762 - _webgl_16d8e27babe3e15e), _webgl_49a0cb6f9237aa8)))));
float4 _webgl_e25c9b31409332e8 = {0.0, 0.0, 0.0, 0.0};
(_webgl_e25c9b31409332e8 = mul(transpose(_webgl_b0404067f6345e65), _webgl_4879e67e5ac43730));
(_webgl_f932ead1931d2da0.zw = _webgl_e25c9b31409332e8.zw);
(_webgl_f932ead1931d2da0.xy = (_webgl_e25c9b31409332e8.xy / _webgl_e25c9b31409332e8.w));
(_webgl_d79a635a1802e5aa.xy = _webgl_f932ead1931d2da0.xy);
(_webgl_d79a635a1802e5aa.z = (_webgl_e25c9b31409332e8.z / _webgl_e25c9b31409332e8.w));
float _webgl_91c6fbb789786f97 = {0.0};
(_webgl_91c6fbb789786f97 = (1.0 / _webgl_6e78a9e7655aa6e8.w));
float _webgl_9e247bb82e5c20e0 = {0.0};
(_webgl_9e247bb82e5c20e0 = (_webgl_91c6fbb789786f97 / 1000.0));
(_webgl_d79a635a1802e5aa.z = ((-(((2.0 * _webgl_91c6fbb789786f97) * _webgl_9e247bb82e5c20e0) / (_webgl_91c6fbb789786f97 - _webgl_9e247bb82e5c20e0))) / (_webgl_d79a635a1802e5aa.z - ((_webgl_91c6fbb789786f97 + _webgl_9e247bb82e5c20e0) / (_webgl_91c6fbb789786f97 - _webgl_9e247bb82e5c20e0)))));
(_webgl_d79a635a1802e5aa.z = (_webgl_d79a635a1802e5aa.z * _webgl_6e78a9e7655aa6e8.w));
(_webgl_d79a635a1802e5aa.z = (_webgl_d79a635a1802e5aa.z + (_webgl_6e78a9e7655aa6e8.z * 10.0)));
(_webgl_d79a635a1802e5aa.z = (_webgl_d79a635a1802e5aa.z / _webgl_6e78a9e7655aa6e8.w));
(_webgl_d79a635a1802e5aa.z = (((_webgl_91c6fbb789786f97 + _webgl_9e247bb82e5c20e0) / (_webgl_91c6fbb789786f97 - _webgl_9e247bb82e5c20e0)) - ((((2.0 * _webgl_91c6fbb789786f97) * _webgl_9e247bb82e5c20e0) / (_webgl_91c6fbb789786f97 - _webgl_9e247bb82e5c20e0)) / _webgl_d79a635a1802e5aa.z)));
float _webgl_3359bc28035d890c = {0.0};
float _webgl_1f587dd22f3ef82f = {0.0};
float _webgl_1f519801ba49e7e0 = {0.0};
float _webgl_c32b197c3ef5b589 = {0.0};
float _webgl_442c8506e036f54 = {0.0};
float _webgl_da55cf05e1d0e4ce = {0.0};
float _webgl_5c6e4f0db84347e2 = {0.0};
float2 _webgl_5268c0d98fc07718 = {0.0, 0.0};
float _webgl_bd1cf0f064bc6fed = {0.0};
(_webgl_bd1cf0f064bc6fed = (1.0 / _webgl_6e78a9e7655aa6e8.x));
float _webgl_dad807c3e946fcc4 = {0.0};
(_webgl_dad807c3e946fcc4 = _webgl_d79a635a1802e5aa.z);
float2 _webgl_4a69825d2061f2e4 = {0.0, 0.0};
(_webgl_4a69825d2061f2e4 = (_webgl_f932ead1931d2da0.xy * _webgl_6e78a9e7655aa6e8.x));
(_webgl_5268c0d98fc07718 = floor((_webgl_4a69825d2061f2e4 + float2(0.5, 0.5))));
float _webgl_85f7bf17706eab85 = {0.0};
(_webgl_85f7bf17706eab85 = ((_webgl_4a69825d2061f2e4.x + 0.5) - _webgl_5268c0d98fc07718.x));
float _webgl_5cfd34df9dcb15f5 = {0.0};
(_webgl_5cfd34df9dcb15f5 = ((_webgl_4a69825d2061f2e4.y + 0.5) - _webgl_5268c0d98fc07718.y));
(_webgl_5268c0d98fc07718 = (_webgl_5268c0d98fc07718 - float2(0.5, 0.5)));
(_webgl_5268c0d98fc07718 = (_webgl_5268c0d98fc07718 * _webgl_bd1cf0f064bc6fed));
float _webgl_cfe4f407d6834756 = {0.0};
(_webgl_cfe4f407d6834756 = (4.0 - (3.0 * _webgl_85f7bf17706eab85)));
float _webgl_8eabcbad90e5f7cf = {0.0};
(_webgl_8eabcbad90e5f7cf = (1.0 + (3.0 * _webgl_85f7bf17706eab85)));
float _webgl_45bc8ea7e5f7a77c = {0.0};
(_webgl_45bc8ea7e5f7a77c = (4.0 - (3.0 * _webgl_5cfd34df9dcb15f5)));
float _webgl_d7a381f02878b408 = {0.0};
(_webgl_d7a381f02878b408 = (1.0 + (3.0 * _webgl_5cfd34df9dcb15f5)));
(_webgl_5c6e4f0db84347e2 = ((((3.0 - (2.0 * _webgl_85f7bf17706eab85)) / _webgl_cfe4f407d6834756) - 2.0) * _webgl_bd1cf0f064bc6fed));
(_webgl_c32b197c3ef5b589 = ((((3.0 - (2.0 * _webgl_5cfd34df9dcb15f5)) / _webgl_45bc8ea7e5f7a77c) - 2.0) * _webgl_bd1cf0f064bc6fed));
(_webgl_da55cf05e1d0e4ce = (((3.0 + _webgl_85f7bf17706eab85) / 7.0) * _webgl_bd1cf0f064bc6fed));
(_webgl_1f519801ba49e7e0 = (((3.0 + _webgl_5cfd34df9dcb15f5) / 7.0) * _webgl_bd1cf0f064bc6fed));
(_webgl_442c8506e036f54 = (((_webgl_85f7bf17706eab85 / _webgl_8eabcbad90e5f7cf) + 2.0) * _webgl_bd1cf0f064bc6fed));
(_webgl_1f587dd22f3ef82f = (((_webgl_5cfd34df9dcb15f5 / _webgl_d7a381f02878b408) + 2.0) * _webgl_bd1cf0f064bc6fed));
float3 _webgl_1e0a569fa8d323c5 = {0.0, 0.0, 0.0};
(_webgl_1e0a569fa8d323c5.x = (_webgl_5268c0d98fc07718.x + _webgl_5c6e4f0db84347e2));
(_webgl_1e0a569fa8d323c5.y = (_webgl_5268c0d98fc07718.y + _webgl_c32b197c3ef5b589));
(_webgl_1e0a569fa8d323c5.z = _webgl_dad807c3e946fcc4);
(_webgl_3359bc28035d890c = ((_webgl_cfe4f407d6834756 * _webgl_45bc8ea7e5f7a77c) * gl_texture2D_comparison(_webgl_75db1bbd4bda93ec, _webgl_1e0a569fa8d323c5)));
float3 _webgl_6b1576cc49ca380b = {0.0, 0.0, 0.0};
(_webgl_6b1576cc49ca380b.x = (_webgl_5268c0d98fc07718.x + _webgl_da55cf05e1d0e4ce));
(_webgl_6b1576cc49ca380b.y = (_webgl_5268c0d98fc07718.y + _webgl_c32b197c3ef5b589));
(_webgl_6b1576cc49ca380b.z = _webgl_dad807c3e946fcc4);
(_webgl_3359bc28035d890c = (_webgl_3359bc28035d890c + ((7.0 * _webgl_45bc8ea7e5f7a77c) * gl_texture2D_comparison(_webgl_75db1bbd4bda93ec, _webgl_6b1576cc49ca380b))));
float3 _webgl_82fa7c9f93cc7839 = {0.0, 0.0, 0.0};
(_webgl_82fa7c9f93cc7839.x = (_webgl_5268c0d98fc07718.x + _webgl_442c8506e036f54));
(_webgl_82fa7c9f93cc7839.y = (_webgl_5268c0d98fc07718.y + _webgl_c32b197c3ef5b589));
(_webgl_82fa7c9f93cc7839.z = _webgl_dad807c3e946fcc4);
(_webgl_3359bc28035d890c = (_webgl_3359bc28035d890c + ((_webgl_8eabcbad90e5f7cf * _webgl_45bc8ea7e5f7a77c) * gl_texture2D_comparison(_webgl_75db1bbd4bda93ec, _webgl_82fa7c9f93cc7839))));
float3 _webgl_6b8507d7c52a30c5 = {0.0, 0.0, 0.0};
(_webgl_6b8507d7c52a30c5.x = (_webgl_5268c0d98fc07718.x + _webgl_5c6e4f0db84347e2));
(_webgl_6b8507d7c52a30c5.y = (_webgl_5268c0d98fc07718.y + _webgl_1f519801ba49e7e0));
(_webgl_6b8507d7c52a30c5.z = _webgl_dad807c3e946fcc4);
(_webgl_3359bc28035d890c = (_webgl_3359bc28035d890c + ((_webgl_cfe4f407d6834756 * 7.0) * gl_texture2D_comparison(_webgl_75db1bbd4bda93ec, _webgl_6b8507d7c52a30c5))));
float3 _webgl_bc517a070a88ef4a = {0.0, 0.0, 0.0};
(_webgl_bc517a070a88ef4a.x = (_webgl_5268c0d98fc07718.x + _webgl_da55cf05e1d0e4ce));
(_webgl_bc517a070a88ef4a.y = (_webgl_5268c0d98fc07718.y + _webgl_1f519801ba49e7e0));
(_webgl_bc517a070a88ef4a.z = _webgl_dad807c3e946fcc4);
(_webgl_3359bc28035d890c = (_webgl_3359bc28035d890c + (49.0 * gl_texture2D_comparison(_webgl_75db1bbd4bda93ec, _webgl_bc517a070a88ef4a))));
float3 _webgl_a5cbea098f008107 = {0.0, 0.0, 0.0};
(_webgl_a5cbea098f008107.x = (_webgl_5268c0d98fc07718.x + _webgl_442c8506e036f54));
(_webgl_a5cbea098f008107.y = (_webgl_5268c0d98fc07718.y + _webgl_1f519801ba49e7e0));
(_webgl_a5cbea098f008107.z = _webgl_dad807c3e946fcc4);
(_webgl_3359bc28035d890c = (_webgl_3359bc28035d890c + ((_webgl_8eabcbad90e5f7cf * 7.0) * gl_texture2D_comparison(_webgl_75db1bbd4bda93ec, _webgl_a5cbea098f008107))));
float3 _webgl_e422f03590b051e5 = {0.0, 0.0, 0.0};
(_webgl_e422f03590b051e5.x = (_webgl_5268c0d98fc07718.x + _webgl_5c6e4f0db84347e2));
(_webgl_e422f03590b051e5.y = (_webgl_5268c0d98fc07718.y + _webgl_1f587dd22f3ef82f));
(_webgl_e422f03590b051e5.z = _webgl_dad807c3e946fcc4);
(_webgl_3359bc28035d890c = (_webgl_3359bc28035d890c + ((_webgl_cfe4f407d6834756 * _webgl_d7a381f02878b408) * gl_texture2D_comparison(_webgl_75db1bbd4bda93ec, _webgl_e422f03590b051e5))));
float3 _webgl_a2ea1ce929cac431 = {0.0, 0.0, 0.0};
(_webgl_a2ea1ce929cac431.x = (_webgl_5268c0d98fc07718.x + _webgl_da55cf05e1d0e4ce));
(_webgl_a2ea1ce929cac431.y = (_webgl_5268c0d98fc07718.y + _webgl_1f587dd22f3ef82f));
(_webgl_a2ea1ce929cac431.z = _webgl_dad807c3e946fcc4);
(_webgl_3359bc28035d890c = (_webgl_3359bc28035d890c + ((7.0 * _webgl_d7a381f02878b408) * gl_texture2D_comparison(_webgl_75db1bbd4bda93ec, _webgl_a2ea1ce929cac431))));
float3 _webgl_d3a0349fad6621fb = {0.0, 0.0, 0.0};
(_webgl_d3a0349fad6621fb.x = (_webgl_5268c0d98fc07718.x + _webgl_442c8506e036f54));
(_webgl_d3a0349fad6621fb.y = (_webgl_5268c0d98fc07718.y + _webgl_1f587dd22f3ef82f));
(_webgl_d3a0349fad6621fb.z = _webgl_dad807c3e946fcc4);
(_webgl_3359bc28035d890c = (_webgl_3359bc28035d890c + ((_webgl_8eabcbad90e5f7cf * _webgl_d7a381f02878b408) * gl_texture2D_comparison(_webgl_75db1bbd4bda93ec, _webgl_d3a0349fad6621fb))));
(_webgl_3359bc28035d890c = (_webgl_3359bc28035d890c * 0.006944444));
float _webgl_48742813565ac55d = {0.0};
(_webgl_48742813565ac55d = pow(_webgl_3359bc28035d890c, 2.2));
(_webgl_3359bc28035d890c = _webgl_48742813565ac55d);
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * _webgl_48742813565ac55d));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 + (_webgl_9251dcdacdfa452 * _webgl_1855da97c0758e43)));
}
(out_webgl_9b98566002e557b5.xyz = pow(_webgl_540f7c123bdf52c0, float3(0.5, 0.5, 0.5)));
(out_webgl_9b98566002e557b5.xyz = (out_webgl_9b98566002e557b5.xyz / 8.0));
(out_webgl_9b98566002e557b5.w = clamp(max(max(out_webgl_9b98566002e557b5.x, out_webgl_9b98566002e557b5.y), max(out_webgl_9b98566002e557b5.z, 0.0039215689)), 0.0, 1.0));
(out_webgl_9b98566002e557b5.w = (ceil((out_webgl_9b98566002e557b5.w * 255.0)) / 255.0));
(out_webgl_9b98566002e557b5.xyz = (out_webgl_9b98566002e557b5.xyz / out_webgl_9b98566002e557b5.w));
(out_webgl_9b98566002e557b5.x += 0.22955114);
}
void f_initGlobals()
{
(_webgl_540f7c123bdf52c0 = float3(0.0, 0.0, 0.0));
(_webgl_11482133dc10ada = float3(0.0, 0.0, 0.0));
(_webgl_d79a635a1802e5aa = float3(0.0, 0.0, 0.0));
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

