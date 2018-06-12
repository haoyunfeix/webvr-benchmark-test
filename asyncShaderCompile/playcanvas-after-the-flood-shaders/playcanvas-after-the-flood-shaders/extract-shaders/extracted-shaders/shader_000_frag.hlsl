
// Uniforms

uniform float3 _webgl_35c9514d594e36f3 : register(c0);
uniform float3 _webgl_1855da97c0758e43 : register(c1);
uniform float3 _webgl_16d8e27babe3e15e : register(c2);
uniform float _webgl_1a380463a8bc7359 : register(c3);
uniform float3 _webgl_35202d7eed2427d : register(c4);
uniform float _webgl_2dd2385497bef344 : register(c5);
uniform float _webgl_755af7149e45828a : register(c6);
uniform float3 _webgl_10617a1597481d62 : register(c7);
uniform float3 _webgl_71e3cad5e42a89bb : register(c8);
uniform float _webgl_1c82dc879cda6ae2 : register(c9);
uniform float3 _webgl_a8a39767ea2c8eb7 : register(c10);
uniform float _webgl_e6010fd023fb284f : register(c11);
uniform float _webgl_34ab7d99e8e69aa4 : register(c12);
uniform float3 _webgl_5886825673b0276f : register(c13);
uniform float3 _webgl_a0d6d9dec5ad53fe : register(c14);
uniform float _webgl_2f0c4fd3d54f412 : register(c15);
uniform float3 _webgl_c74e73a88f49c8c7 : register(c16);
uniform float _webgl_e3e131ff0e27f0c0 : register(c17);
uniform float _webgl_b1fe332e1acaed26 : register(c18);
uniform float3 _webgl_464e43777b6e9942 : register(c19);
uniform float3 _webgl_667b191dc0b01a84 : register(c20);
uniform float _webgl_21fed8ee50175509 : register(c21);
uniform float3 _webgl_8eda54b98f40e5ba : register(c22);
uniform float _webgl_af8a456fd59f087a : register(c23);
uniform float _webgl_b4ce66a72995d6d3 : register(c24);
uniform float4x4 _webgl_7d0ab9d59dac7bb2 : register(c25);
uniform float4 _webgl_c2d277a61d53c00d : register(c29);
uniform float3 _webgl_3b3710b9db4788a7 : register(c30);
uniform float _webgl_5985a6d987efdfc3 : register(c31);
uniform float _webgl_ae2115093f2ac183 : register(c32);
uniform float _webgl_78412eb5117922b0 : register(c33);
static const uint _webgl_f7d454a6f4a6892c = 0;
static const uint _webgl_92406ab4e48f953a = 1;
static const uint _webgl_bb15c76ae884963b = 2;
static const uint _webgl_b15f7cf9d8241198 = 3;
uniform Texture2D<float4> textures2D[4] : register(t0);
uniform SamplerState samplers2D[4] : register(s0);
static const uint _webgl_7b5e6932dac63e22 = 4;
static const uint textureIndexOffsetCube = 4;
static const uint samplerIndexOffsetCube = 4;
uniform TextureCube<float4> texturesCube[1] : register(t4);
uniform SamplerState samplersCube[1] : register(s4);
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
    SamplerMetadata samplerMetadata[5] : packoffset(c4);
};

float4 gl_texture2D(uint samplerIndex, float2 t)
{
    return textures2D[samplerIndex].Sample(samplers2D[samplerIndex], float2(t.x, t.y));
}

float4 gl_textureCube(uint samplerIndex, float3 t)
{
    const uint textureIndex = samplerIndex - textureIndexOffsetCube;
    const uint samplerArrayIndex = samplerIndex - samplerIndexOffsetCube;
    return texturesCube[textureIndex].Sample(samplersCube[samplerArrayIndex], float3(t.x, t.y, t.z));
}

void f_initGlobals();
;
static float3 _webgl_540f7c123bdf52c0 = {0, 0, 0};
static float3 _webgl_11482133dc10ada = {0, 0, 0};
static float _webgl_af27c8244adc12b9 = {0};
static float _webgl_9251dcdacdfa452 = {0};
void gl_main()
{
f_initGlobals();
(out_webgl_9b98566002e557b5 = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_540f7c123bdf52c0 = float3(0.0, 0.0, 0.0));
(_webgl_af27c8244adc12b9 = gl_texture2D(_webgl_bb15c76ae884963b, _webgl_a0b62b4d8ddcd62b).x);
float3 _webgl_dbb0b86db3589565 = {0.0, 0.0, 0.0};
(_webgl_dbb0b86db3589565 = normalize(_webgl_cc88c95a9917294));
float4 _webgl_30d517b239db7bc6 = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_f28d072c82c61bea = {0.0, 0.0, 0.0, 0.0};
(_webgl_f28d072c82c61bea = gl_texture2D(_webgl_92406ab4e48f953a, _webgl_a0b62b4d8ddcd62b));
(_webgl_30d517b239db7bc6.w = _webgl_f28d072c82c61bea.w);
(_webgl_30d517b239db7bc6.xyz = pow(_webgl_f28d072c82c61bea.xyz, float3(2.2, 2.2, 2.2)));
float3 _webgl_8ecc9ed40e399f67 = {0.0, 0.0, 0.0};
float3 _webgl_d571af2d6c7dce4a = {0.0, 0.0, 0.0};
(_webgl_d571af2d6c7dce4a = _webgl_dbb0b86db3589565);
float _webgl_8f7cfeb5dfbf859 = {0.0};
(_webgl_8f7cfeb5dfbf859 = max(max(abs(_webgl_dbb0b86db3589565.x), abs(_webgl_dbb0b86db3589565.y)), abs(_webgl_dbb0b86db3589565.z)));
float _webgl_cfb863ec5a9ad847 = {0.0};
(_webgl_cfb863ec5a9ad847 = abs(_webgl_dbb0b86db3589565.x));
if ((_webgl_cfb863ec5a9ad847 != _webgl_8f7cfeb5dfbf859))
{
(_webgl_d571af2d6c7dce4a.x = (_webgl_dbb0b86db3589565.x * 0.75));
}
float _webgl_5ccca921d933644d = {0.0};
(_webgl_5ccca921d933644d = abs(_webgl_dbb0b86db3589565.y));
if ((_webgl_5ccca921d933644d != _webgl_8f7cfeb5dfbf859))
{
(_webgl_d571af2d6c7dce4a.y = (_webgl_dbb0b86db3589565.y * 0.75));
}
float _webgl_46665ba4a0ebb347 = {0.0};
(_webgl_46665ba4a0ebb347 = abs(_webgl_dbb0b86db3589565.z));
if ((_webgl_46665ba4a0ebb347 != _webgl_8f7cfeb5dfbf859))
{
(_webgl_d571af2d6c7dce4a.z = (_webgl_dbb0b86db3589565.z * 0.75));
}
(_webgl_8ecc9ed40e399f67.yz = _webgl_d571af2d6c7dce4a.yz);
(_webgl_8ecc9ed40e399f67.x = (-_webgl_d571af2d6c7dce4a.x));
float4 _webgl_73488ceaa0ef8fe3 = {0.0, 0.0, 0.0, 0.0};
(_webgl_73488ceaa0ef8fe3 = gl_textureCube(_webgl_7b5e6932dac63e22, _webgl_8ecc9ed40e399f67));
float3 _webgl_73ad0cb88cd907dd = {0.0, 0.0, 0.0};
(_webgl_73ad0cb88cd907dd = ((8.0 * _webgl_73488ceaa0ef8fe3.w) * _webgl_73488ceaa0ef8fe3.xyz));
(_webgl_540f7c123bdf52c0 = ((_webgl_73ad0cb88cd907dd * _webgl_73ad0cb88cd907dd) * _webgl_ae2115093f2ac183));
(_webgl_11482133dc10ada = (_webgl_5c81bf65ffac0762 - _webgl_16d8e27babe3e15e));
float3 _webgl_4879e67e5ac43730 = {0.0, 0.0, 0.0};
(_webgl_4879e67e5ac43730 = normalize(_webgl_11482133dc10ada));
float _webgl_e25c9b31409332e8 = {0.0};
(_webgl_e25c9b31409332e8 = max(((_webgl_1a380463a8bc7359 - sqrt(dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada))) / _webgl_1a380463a8bc7359), 0.0));
(_webgl_9251dcdacdfa452 = _webgl_e25c9b31409332e8);
if ((_webgl_e25c9b31409332e8 > 9.9999997e-06))
{
float _webgl_91c6fbb789786f97 = {0.0};
(_webgl_91c6fbb789786f97 = clamp(((dot(_webgl_4879e67e5ac43730, _webgl_35202d7eed2427d) - _webgl_755af7149e45828a) / (_webgl_2dd2385497bef344 - _webgl_755af7149e45828a)), 0.0, 1.0));
(_webgl_9251dcdacdfa452 = (_webgl_e25c9b31409332e8 * (_webgl_91c6fbb789786f97 * (_webgl_91c6fbb789786f97 * (3.0 - (2.0 * _webgl_91c6fbb789786f97))))));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * max(dot(_webgl_dbb0b86db3589565, (-_webgl_4879e67e5ac43730)), 0.0)));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 + (_webgl_9251dcdacdfa452 * _webgl_1855da97c0758e43)));
}
(_webgl_11482133dc10ada = (_webgl_5c81bf65ffac0762 - _webgl_71e3cad5e42a89bb));
float3 _webgl_9e247bb82e5c20e0 = {0.0, 0.0, 0.0};
(_webgl_9e247bb82e5c20e0 = normalize(_webgl_11482133dc10ada));
float _webgl_3489059248406aa1 = {0.0};
(_webgl_3489059248406aa1 = max(((_webgl_1c82dc879cda6ae2 - sqrt(dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada))) / _webgl_1c82dc879cda6ae2), 0.0));
(_webgl_9251dcdacdfa452 = _webgl_3489059248406aa1);
if ((_webgl_3489059248406aa1 > 9.9999997e-06))
{
float _webgl_9086f39b9ec20200 = {0.0};
(_webgl_9086f39b9ec20200 = clamp(((dot(_webgl_9e247bb82e5c20e0, _webgl_a8a39767ea2c8eb7) - _webgl_34ab7d99e8e69aa4) / (_webgl_e6010fd023fb284f - _webgl_34ab7d99e8e69aa4)), 0.0, 1.0));
(_webgl_9251dcdacdfa452 = (_webgl_3489059248406aa1 * (_webgl_9086f39b9ec20200 * (_webgl_9086f39b9ec20200 * (3.0 - (2.0 * _webgl_9086f39b9ec20200))))));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * max(dot(_webgl_dbb0b86db3589565, (-_webgl_9e247bb82e5c20e0)), 0.0)));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 + (_webgl_9251dcdacdfa452 * _webgl_10617a1597481d62)));
}
(_webgl_11482133dc10ada = (_webgl_5c81bf65ffac0762 - _webgl_a0d6d9dec5ad53fe));
float3 _webgl_f26380f436f82532 = {0.0, 0.0, 0.0};
(_webgl_f26380f436f82532 = normalize(_webgl_11482133dc10ada));
float _webgl_36f0db37e376e927 = {0.0};
float _webgl_cd6eaaff7ab905f1 = {0.0};
(_webgl_cd6eaaff7ab905f1 = dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada));
float _webgl_cf179e362a646f90 = {0.0};
(_webgl_cf179e362a646f90 = (1.0 / _webgl_2f0c4fd3d54f412));
(_webgl_36f0db37e376e927 = ((1.0 / (_webgl_cd6eaaff7ab905f1 + 1.0)) * 16.0));
float _webgl_ee2995d3fe2cc713 = {0.0};
(_webgl_ee2995d3fe2cc713 = (_webgl_cd6eaaff7ab905f1 * (_webgl_cf179e362a646f90 * _webgl_cf179e362a646f90)));
float _webgl_ba8e8168781d9774 = {0.0};
(_webgl_ba8e8168781d9774 = clamp((1.0 - (_webgl_ee2995d3fe2cc713 * _webgl_ee2995d3fe2cc713)), 0.0, 1.0));
(_webgl_36f0db37e376e927 = (_webgl_36f0db37e376e927 * (_webgl_ba8e8168781d9774 * _webgl_ba8e8168781d9774)));
(_webgl_9251dcdacdfa452 = _webgl_36f0db37e376e927);
if ((_webgl_36f0db37e376e927 > 9.9999997e-06))
{
float _webgl_bd1cf0f064bc6fed = {0.0};
(_webgl_bd1cf0f064bc6fed = clamp(((dot(_webgl_f26380f436f82532, _webgl_c74e73a88f49c8c7) - _webgl_b1fe332e1acaed26) / (_webgl_e3e131ff0e27f0c0 - _webgl_b1fe332e1acaed26)), 0.0, 1.0));
(_webgl_9251dcdacdfa452 = (_webgl_36f0db37e376e927 * (_webgl_bd1cf0f064bc6fed * (_webgl_bd1cf0f064bc6fed * (3.0 - (2.0 * _webgl_bd1cf0f064bc6fed))))));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * max(dot(_webgl_dbb0b86db3589565, (-_webgl_f26380f436f82532)), 0.0)));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 + (_webgl_9251dcdacdfa452 * _webgl_5886825673b0276f)));
}
(_webgl_11482133dc10ada = (_webgl_5c81bf65ffac0762 - _webgl_667b191dc0b01a84));
float3 _webgl_dad807c3e946fcc4 = {0.0, 0.0, 0.0};
(_webgl_dad807c3e946fcc4 = normalize(_webgl_11482133dc10ada));
float _webgl_4a69825d2061f2e4 = {0.0};
(_webgl_4a69825d2061f2e4 = max(((_webgl_21fed8ee50175509 - sqrt(dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada))) / _webgl_21fed8ee50175509), 0.0));
(_webgl_9251dcdacdfa452 = _webgl_4a69825d2061f2e4);
if ((_webgl_4a69825d2061f2e4 > 9.9999997e-06))
{
float _webgl_85f7bf17706eab85 = {0.0};
(_webgl_85f7bf17706eab85 = clamp(((dot(_webgl_dad807c3e946fcc4, _webgl_8eda54b98f40e5ba) - _webgl_b4ce66a72995d6d3) / (_webgl_af8a456fd59f087a - _webgl_b4ce66a72995d6d3)), 0.0, 1.0));
(_webgl_9251dcdacdfa452 = (_webgl_4a69825d2061f2e4 * (_webgl_85f7bf17706eab85 * (_webgl_85f7bf17706eab85 * (3.0 - (2.0 * _webgl_85f7bf17706eab85))))));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * max(dot(_webgl_dbb0b86db3589565, (-_webgl_dad807c3e946fcc4)), 0.0)));
float4 _webgl_7b583224a0e009cb = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_cfe4f407d6834756 = {0.0, 0.0, 0.0, 0.0};
(_webgl_cfe4f407d6834756.w = 1.0);
(_webgl_cfe4f407d6834756.xyz = _webgl_5c81bf65ffac0762);
float4 _webgl_8eabcbad90e5f7cf = {0.0, 0.0, 0.0, 0.0};
(_webgl_8eabcbad90e5f7cf = mul(transpose(_webgl_7d0ab9d59dac7bb2), _webgl_cfe4f407d6834756));
(_webgl_7b583224a0e009cb.zw = _webgl_8eabcbad90e5f7cf.zw);
(_webgl_7b583224a0e009cb.xy = (_webgl_8eabcbad90e5f7cf.xy / _webgl_8eabcbad90e5f7cf.w));
float _webgl_4acaa8faf2a8d793 = {0.0};
(_webgl_4acaa8faf2a8d793 = ((sqrt(dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada)) * _webgl_c2d277a61d53c00d.w) + _webgl_c2d277a61d53c00d.z));
float4 _webgl_d7a381f02878b408 = {0.0, 0.0, 0.0, 0.0};
(_webgl_d7a381f02878b408 = gl_texture2D(_webgl_f7d454a6f4a6892c, _webgl_7b583224a0e009cb.xy));
float3 _webgl_1e0a569fa8d323c5 = {0.0, 0.0, 0.0};
(_webgl_1e0a569fa8d323c5.z = 0.0);
(_webgl_1e0a569fa8d323c5.x = ((_webgl_d7a381f02878b408.y * 0.0039215689) + _webgl_d7a381f02878b408.x));
(_webgl_1e0a569fa8d323c5.y = ((_webgl_d7a381f02878b408.w * 0.0039215689) + _webgl_d7a381f02878b408.z));
float _webgl_6b1576cc49ca380b = {0.0};
(_webgl_6b1576cc49ca380b = (_webgl_c2d277a61d53c00d.y * _webgl_4acaa8faf2a8d793));
float _webgl_82fa7c9f93cc7839 = {0.0};
(_webgl_82fa7c9f93cc7839 = max((_webgl_1e0a569fa8d323c5.y - (_webgl_1e0a569fa8d323c5.x * _webgl_1e0a569fa8d323c5.x)), (_webgl_6b1576cc49ca380b * _webgl_6b1576cc49ca380b)));
float _webgl_6b8507d7c52a30c5 = {0.0};
(_webgl_6b8507d7c52a30c5 = (_webgl_4acaa8faf2a8d793 - _webgl_1e0a569fa8d323c5.x));
float _webgl_bc517a070a88ef4a = {0.0};
(_webgl_bc517a070a88ef4a = clamp((((_webgl_82fa7c9f93cc7839 / (_webgl_82fa7c9f93cc7839 + (_webgl_6b8507d7c52a30c5 * _webgl_6b8507d7c52a30c5))) - 0.1) / 0.89999998), 0.0, 1.0));
float _webgl_a5cbea098f008107 = {0.0};
if ((_webgl_4acaa8faf2a8d793 <= _webgl_1e0a569fa8d323c5.x))
{
(_webgl_a5cbea098f008107 = 1.0);
}
else
{
(_webgl_a5cbea098f008107 = _webgl_bc517a070a88ef4a);
}
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * _webgl_a5cbea098f008107));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 + (_webgl_9251dcdacdfa452 * _webgl_464e43777b6e9942)));
}
float3 _webgl_e422f03590b051e5 = {0.0, 0.0, 0.0};
(_webgl_e422f03590b051e5 = (_webgl_30d517b239db7bc6.xyz * _webgl_540f7c123bdf52c0));
(out_webgl_9b98566002e557b5.xyz = _webgl_e422f03590b051e5);
float3 _webgl_a2ea1ce929cac431 = {0.0, 0.0, 0.0};
float4 _webgl_83f42030c4dc10b1 = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_48742813565ac55d = {0.0, 0.0, 0.0, 0.0};
(_webgl_48742813565ac55d = gl_texture2D(_webgl_b15f7cf9d8241198, _webgl_a0b62b4d8ddcd62b));
(_webgl_83f42030c4dc10b1.w = _webgl_48742813565ac55d.w);
(_webgl_83f42030c4dc10b1.xyz = pow(_webgl_48742813565ac55d.xyz, float3(2.2, 2.2, 2.2)));
(_webgl_a2ea1ce929cac431 = (_webgl_83f42030c4dc10b1.xyz * _webgl_78412eb5117922b0));
(out_webgl_9b98566002e557b5.xyz = (out_webgl_9b98566002e557b5.xyz + _webgl_a2ea1ce929cac431));
float3 _webgl_f05a73b03fcb4961 = {0.0, 0.0, 0.0};
(_webgl_f05a73b03fcb4961 = (_webgl_5c81bf65ffac0762 - _webgl_35c9514d594e36f3));
(out_webgl_9b98566002e557b5.xyz = lerp(_webgl_3b3710b9db4788a7, out_webgl_9b98566002e557b5.xyz, clamp(exp(((-sqrt(dot(_webgl_f05a73b03fcb4961, _webgl_f05a73b03fcb4961))) * _webgl_5985a6d987efdfc3)), 0.0, 1.0)));
(out_webgl_9b98566002e557b5.xyz = out_webgl_9b98566002e557b5.xyz);
(out_webgl_9b98566002e557b5.xyz = out_webgl_9b98566002e557b5.xyz);
(out_webgl_9b98566002e557b5.w = _webgl_af27c8244adc12b9);
(out_webgl_9b98566002e557b5.x += 0.75164193);
}
void f_initGlobals()
{
(_webgl_540f7c123bdf52c0 = float3(0.0, 0.0, 0.0));
(_webgl_11482133dc10ada = float3(0.0, 0.0, 0.0));
(_webgl_af27c8244adc12b9 = 0.0);
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
    _webgl_a0b62b4d8ddcd62b = input.v2.xy;

    gl_main();

    return generateOutput();
}

