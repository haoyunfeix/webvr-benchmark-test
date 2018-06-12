
float float_ctor(int x0)
{
    return float(x0);
}
int int_ctor(float x0)
{
    return int(x0);
}
// Uniforms

uniform float3 _webgl_35c9514d594e36f3 : register(c0);
uniform float3 _webgl_1855da97c0758e43 : register(c1);
uniform float3 _webgl_16d8e27babe3e15e : register(c2);
uniform float _webgl_1a380463a8bc7359 : register(c3);
uniform float3 _webgl_35202d7eed2427d : register(c4);
uniform float _webgl_2dd2385497bef344 : register(c5);
uniform float _webgl_755af7149e45828a : register(c6);
uniform float4x4 _webgl_b0404067f6345e65 : register(c7);
uniform float4 _webgl_6e78a9e7655aa6e8 : register(c11);
uniform float _webgl_c72812b39ae458b : register(c12);
uniform float3 _webgl_3b3710b9db4788a7 : register(c13);
uniform float _webgl_5985a6d987efdfc3 : register(c14);
uniform float3 _webgl_2d459f8069f64681 : register(c15);
uniform float3 _webgl_e2179ae4f2cb06c9 : register(c16);
uniform float _webgl_508641f47c99a2ed : register(c17);
uniform float _webgl_7ae668e5b64ca8de : register(c18);
static const uint _webgl_75db1bbd4bda93ec = 0;
static const uint _webgl_8167d7febf3081fa = 1;
static const uint _webgl_92406ab4e48f953a = 2;
static const uint _webgl_554ea46d87ba4287 = 3;
static const uint _webgl_886520cdb034ca8e = 4;
static const uint _webgl_c3b0765d5df09e72 = 5;
static const uint _webgl_d1a7cd505ae30fad = 6;
uniform Texture2D<float4> textures2D[7] : register(t0);
uniform SamplerState samplers2D[7] : register(s0);
static const uint _webgl_e2d4935665806094 = 7;
static const uint _webgl_6d18ad23908e287 = 8;
static const uint _webgl_6666018523ec4102 = 9;
static const uint _webgl_f40e146fb06e4a34 = 10;
static const uint _webgl_340f351c4a4314aa = 11;
static const uint _webgl_7b5e6932dac63e22 = 12;
static const uint textureIndexOffsetCube = 7;
static const uint samplerIndexOffsetCube = 7;
uniform TextureCube<float4> texturesCube[6] : register(t7);
uniform SamplerState samplersCube[6] : register(s7);
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
static  float3 _webgl_6580760fc7b305a7 = {0, 0, 0};
static  float3 _webgl_6ccc0e73d2b9d4de = {0, 0, 0};
static  float2 _webgl_a0b62b4d8ddcd62b = {0, 0};
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
    SamplerMetadata samplerMetadata[13] : packoffset(c4);
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
static float4 _webgl_9d2f5706d0aa9ead = {0, 0, 0, 0};
static float3 _webgl_d189f73da6eb4d5b = {0, 0, 0};
static float3 _webgl_540f7c123bdf52c0 = {0, 0, 0};
static float3 _webgl_3d74e5997dd7c222 = {0, 0, 0};
static float3 _webgl_11482133dc10ada = {0, 0, 0};
static float3 _webgl_acb134d5a49c2148 = {0, 0, 0};
static float _webgl_8e684f5904e88831 = {0};
static float _webgl_9251dcdacdfa452 = {0};
void gl_main()
{
f_initGlobals();
(out_webgl_9b98566002e557b5 = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_3d74e5997dd7c222 = float3(0.0, 0.0, 0.0));
(_webgl_9d2f5706d0aa9ead = float4(0.0, 0.0, 0.0, 0.0));
float3 _webgl_dbb0b86db3589565 = {0.0, 0.0, 0.0};
(_webgl_dbb0b86db3589565 = normalize((_webgl_35c9514d594e36f3 - _webgl_5c81bf65ffac0762)));
float3x3 _webgl_822b69d8b2db705f = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
(_webgl_822b69d8b2db705f[0] = normalize(_webgl_6580760fc7b305a7));
(_webgl_822b69d8b2db705f[1] = normalize(_webgl_6ccc0e73d2b9d4de));
(_webgl_822b69d8b2db705f[2] = normalize(_webgl_cc88c95a9917294));
float3 _webgl_f28d072c82c61bea = {0.0, 0.0, 0.0};
(_webgl_f28d072c82c61bea = ((gl_texture2D(_webgl_8167d7febf3081fa, _webgl_a0b62b4d8ddcd62b).xyz * 2.0) - 1.0));
(_webgl_d189f73da6eb4d5b = mul(transpose(_webgl_822b69d8b2db705f), normalize(lerp(float3(0.0, 0.0, 1.0), _webgl_f28d072c82c61bea, _webgl_c72812b39ae458b))));
float3 _webgl_49a0cb6f9237aa8 = {0.0, 0.0, 0.0};
(_webgl_49a0cb6f9237aa8 = normalize(((2.0 * (dot(_webgl_d189f73da6eb4d5b, _webgl_dbb0b86db3589565) * _webgl_d189f73da6eb4d5b)) - _webgl_dbb0b86db3589565)));
float4 _webgl_4daadd2dc6febc51 = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_8f7cfeb5dfbf859 = {0.0, 0.0, 0.0, 0.0};
(_webgl_8f7cfeb5dfbf859 = gl_texture2D(_webgl_92406ab4e48f953a, _webgl_a0b62b4d8ddcd62b));
(_webgl_4daadd2dc6febc51.w = _webgl_8f7cfeb5dfbf859.w);
(_webgl_4daadd2dc6febc51.xyz = pow(_webgl_8f7cfeb5dfbf859.xyz, float3(2.2, 2.2, 2.2)));
(_webgl_acb134d5a49c2148 = (gl_texture2D(_webgl_554ea46d87ba4287, _webgl_a0b62b4d8ddcd62b).xyz * _webgl_e2179ae4f2cb06c9));
(_webgl_8e684f5904e88831 = ((_webgl_508641f47c99a2ed * gl_texture2D(_webgl_886520cdb034ca8e, _webgl_a0b62b4d8ddcd62b).y) + 1e-07));
float _webgl_5bb1df3cce7be69e = {0.0};
float _webgl_5ccca921d933644d = {0.0};
(_webgl_5ccca921d933644d = (1.0 - max(dot(_webgl_d189f73da6eb4d5b, _webgl_dbb0b86db3589565), 0.0)));
float _webgl_46665ba4a0ebb347 = {0.0};
(_webgl_46665ba4a0ebb347 = (_webgl_5ccca921d933644d * _webgl_5ccca921d933644d));
(_webgl_5bb1df3cce7be69e = (_webgl_5ccca921d933644d * (_webgl_46665ba4a0ebb347 * _webgl_46665ba4a0ebb347)));
(_webgl_5bb1df3cce7be69e = (_webgl_5bb1df3cce7be69e * (_webgl_8e684f5904e88831 * _webgl_8e684f5904e88831)));
(_webgl_acb134d5a49c2148 = (_webgl_acb134d5a49c2148 + ((1.0 - _webgl_acb134d5a49c2148) * _webgl_5bb1df3cce7be69e)));
float4 _webgl_73488ceaa0ef8fe3 = {0.0, 0.0, 0.0, 0.0};
(_webgl_73488ceaa0ef8fe3 = gl_texture2D(_webgl_c3b0765d5df09e72, _webgl_c381ead4a4662b4a));
float4 _webgl_73ad0cb88cd907dd = {0.0, 0.0, 0.0, 0.0};
(_webgl_73ad0cb88cd907dd = gl_texture2D(_webgl_d1a7cd505ae30fad, _webgl_c381ead4a4662b4a));
float3 _webgl_4879e67e5ac43730 = {0.0, 0.0, 0.0};
(_webgl_4879e67e5ac43730 = ((8.0 * _webgl_73ad0cb88cd907dd.w) * _webgl_73ad0cb88cd907dd.xyz));
(_webgl_540f7c123bdf52c0 = (_webgl_4879e67e5ac43730 * _webgl_4879e67e5ac43730));
float4 _webgl_b408948166d173f0 = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_6acaba1977f37d4 = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_bdd84929d230303e[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
float3 _webgl_1c6c9a9eded860dd = {0.0, 0.0, 0.0};
int _webgl_88e74a0de01c63b9 = {0};
int _webgl_bac289982c669b35 = {0};
float _webgl_cd6eaaff7ab905f1 = {0.0};
(_webgl_cd6eaaff7ab905f1 = (clamp((1.0 - _webgl_8e684f5904e88831), 0.0, 1.0) * 5.0));
(_webgl_bac289982c669b35 = int_ctor(_webgl_cd6eaaff7ab905f1));
(_webgl_88e74a0de01c63b9 = int_ctor(min((_webgl_cd6eaaff7ab905f1 + 1.0), 7.0)));
float3 _webgl_afccfb9db561253f = {0.0, 0.0, 0.0};
(_webgl_afccfb9db561253f = _webgl_49a0cb6f9237aa8);
float _webgl_6472b8a26530e78b = {0.0};
(_webgl_6472b8a26530e78b = (1.0 - (exp2(_webgl_cd6eaaff7ab905f1) / 128.0)));
float _webgl_ba8e8168781d9774 = {0.0};
(_webgl_ba8e8168781d9774 = max(max(abs(_webgl_49a0cb6f9237aa8.x), abs(_webgl_49a0cb6f9237aa8.y)), abs(_webgl_49a0cb6f9237aa8.z)));
float _webgl_bd1cf0f064bc6fed = {0.0};
(_webgl_bd1cf0f064bc6fed = abs(_webgl_49a0cb6f9237aa8.x));
if ((_webgl_bd1cf0f064bc6fed != _webgl_ba8e8168781d9774))
{
(_webgl_afccfb9db561253f.x = (_webgl_49a0cb6f9237aa8.x * _webgl_6472b8a26530e78b));
}
float _webgl_dad807c3e946fcc4 = {0.0};
(_webgl_dad807c3e946fcc4 = abs(_webgl_49a0cb6f9237aa8.y));
if ((_webgl_dad807c3e946fcc4 != _webgl_ba8e8168781d9774))
{
(_webgl_afccfb9db561253f.y = (_webgl_49a0cb6f9237aa8.y * _webgl_6472b8a26530e78b));
}
float _webgl_4a69825d2061f2e4 = {0.0};
(_webgl_4a69825d2061f2e4 = abs(_webgl_49a0cb6f9237aa8.z));
if ((_webgl_4a69825d2061f2e4 != _webgl_ba8e8168781d9774))
{
(_webgl_afccfb9db561253f.z = (_webgl_49a0cb6f9237aa8.z * _webgl_6472b8a26530e78b));
}
(_webgl_1c6c9a9eded860dd.yz = _webgl_afccfb9db561253f.yz);
(_webgl_1c6c9a9eded860dd.x = (-_webgl_afccfb9db561253f.x));
(_webgl_bdd84929d230303e[0] = gl_textureCube(_webgl_e2d4935665806094, _webgl_1c6c9a9eded860dd));
(_webgl_bdd84929d230303e[1] = gl_textureCube(_webgl_6d18ad23908e287, _webgl_1c6c9a9eded860dd));
(_webgl_bdd84929d230303e[2] = gl_textureCube(_webgl_6666018523ec4102, _webgl_1c6c9a9eded860dd));
(_webgl_bdd84929d230303e[3] = gl_textureCube(_webgl_f40e146fb06e4a34, _webgl_1c6c9a9eded860dd));
(_webgl_bdd84929d230303e[4] = gl_textureCube(_webgl_340f351c4a4314aa, _webgl_1c6c9a9eded860dd));
(_webgl_bdd84929d230303e[5] = gl_textureCube(_webgl_7b5e6932dac63e22, _webgl_1c6c9a9eded860dd));
{ for(int _webgl_cbc9fba22ec4d70f = {0}; (_webgl_cbc9fba22ec4d70f < 6); (_webgl_cbc9fba22ec4d70f++))
{
if ((_webgl_cbc9fba22ec4d70f == _webgl_bac289982c669b35))
{
(_webgl_b408948166d173f0 = _webgl_bdd84929d230303e[int_ctor(clamp(float_ctor(_webgl_cbc9fba22ec4d70f), 0.0, 5.0))]);
}
if ((_webgl_cbc9fba22ec4d70f == _webgl_88e74a0de01c63b9))
{
(_webgl_6acaba1977f37d4 = _webgl_bdd84929d230303e[int_ctor(clamp(float_ctor(_webgl_cbc9fba22ec4d70f), 0.0, 5.0))]);
}
}
}
float4 _webgl_85f7bf17706eab85 = {0.0, 0.0, 0.0, 0.0};
(_webgl_85f7bf17706eab85 = lerp(_webgl_b408948166d173f0, _webgl_6acaba1977f37d4, frac(_webgl_cd6eaaff7ab905f1)));
float3 _webgl_5cfd34df9dcb15f5 = {0.0, 0.0, 0.0};
(_webgl_5cfd34df9dcb15f5 = ((8.0 * _webgl_85f7bf17706eab85.w) * _webgl_85f7bf17706eab85.xyz));
float4 _webgl_cfe4f407d6834756 = {0.0, 0.0, 0.0, 0.0};
(_webgl_cfe4f407d6834756.xyz = (_webgl_5cfd34df9dcb15f5 * _webgl_5cfd34df9dcb15f5));
(_webgl_cfe4f407d6834756.w = _webgl_7ae668e5b64ca8de);
(_webgl_9d2f5706d0aa9ead = _webgl_cfe4f407d6834756);
(_webgl_11482133dc10ada = (_webgl_5c81bf65ffac0762 - _webgl_16d8e27babe3e15e));
float3 _webgl_8eabcbad90e5f7cf = {0.0, 0.0, 0.0};
(_webgl_8eabcbad90e5f7cf = normalize(_webgl_11482133dc10ada));
float _webgl_bc1d6927d49cf8c3 = {0.0};
float _webgl_d7a381f02878b408 = {0.0};
(_webgl_d7a381f02878b408 = dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada));
float _webgl_1e0a569fa8d323c5 = {0.0};
(_webgl_1e0a569fa8d323c5 = (1.0 / _webgl_1a380463a8bc7359));
(_webgl_bc1d6927d49cf8c3 = ((1.0 / (_webgl_d7a381f02878b408 + 1.0)) * 16.0));
float _webgl_4570e0353775ff9f = {0.0};
(_webgl_4570e0353775ff9f = (_webgl_d7a381f02878b408 * (_webgl_1e0a569fa8d323c5 * _webgl_1e0a569fa8d323c5)));
float _webgl_82fa7c9f93cc7839 = {0.0};
(_webgl_82fa7c9f93cc7839 = clamp((1.0 - (_webgl_4570e0353775ff9f * _webgl_4570e0353775ff9f)), 0.0, 1.0));
(_webgl_bc1d6927d49cf8c3 = (_webgl_bc1d6927d49cf8c3 * (_webgl_82fa7c9f93cc7839 * _webgl_82fa7c9f93cc7839)));
(_webgl_9251dcdacdfa452 = _webgl_bc1d6927d49cf8c3);
if ((_webgl_bc1d6927d49cf8c3 > 9.9999997e-06))
{
float _webgl_6b8507d7c52a30c5 = {0.0};
(_webgl_6b8507d7c52a30c5 = clamp(((dot(_webgl_8eabcbad90e5f7cf, _webgl_35202d7eed2427d) - _webgl_755af7149e45828a) / (_webgl_2dd2385497bef344 - _webgl_755af7149e45828a)), 0.0, 1.0));
(_webgl_9251dcdacdfa452 = (_webgl_bc1d6927d49cf8c3 * (_webgl_6b8507d7c52a30c5 * (_webgl_6b8507d7c52a30c5 * (3.0 - (2.0 * _webgl_6b8507d7c52a30c5))))));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * max(dot(_webgl_d189f73da6eb4d5b, (-_webgl_8eabcbad90e5f7cf)), 0.0)));
float4 _webgl_d00d41649d5ba68b = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_a5cbea098f008107 = {0.0, 0.0, 0.0, 0.0};
(_webgl_a5cbea098f008107.w = 1.0);
(_webgl_a5cbea098f008107.xyz = _webgl_5c81bf65ffac0762);
float4 _webgl_e422f03590b051e5 = {0.0, 0.0, 0.0, 0.0};
(_webgl_e422f03590b051e5 = mul(transpose(_webgl_b0404067f6345e65), _webgl_a5cbea098f008107));
(_webgl_d00d41649d5ba68b.zw = _webgl_e422f03590b051e5.zw);
(_webgl_d00d41649d5ba68b.xy = (_webgl_e422f03590b051e5.xy / _webgl_e422f03590b051e5.w));
float _webgl_35451d7fcf7a843d = {0.0};
(_webgl_35451d7fcf7a843d = ((sqrt(dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada)) * _webgl_6e78a9e7655aa6e8.w) + _webgl_6e78a9e7655aa6e8.z));
float4 _webgl_d3a0349fad6621fb = {0.0, 0.0, 0.0, 0.0};
(_webgl_d3a0349fad6621fb = gl_texture2D(_webgl_75db1bbd4bda93ec, _webgl_d00d41649d5ba68b.xy));
float3 _webgl_48742813565ac55d = {0.0, 0.0, 0.0};
(_webgl_48742813565ac55d.z = 0.0);
(_webgl_48742813565ac55d.x = ((_webgl_d3a0349fad6621fb.y * 0.0039215689) + _webgl_d3a0349fad6621fb.x));
(_webgl_48742813565ac55d.y = ((_webgl_d3a0349fad6621fb.w * 0.0039215689) + _webgl_d3a0349fad6621fb.z));
float _webgl_f05a73b03fcb4961 = {0.0};
(_webgl_f05a73b03fcb4961 = (_webgl_6e78a9e7655aa6e8.y * _webgl_35451d7fcf7a843d));
float _webgl_bb4c022d8fffa1de = {0.0};
(_webgl_bb4c022d8fffa1de = max((_webgl_48742813565ac55d.y - (_webgl_48742813565ac55d.x * _webgl_48742813565ac55d.x)), (_webgl_f05a73b03fcb4961 * _webgl_f05a73b03fcb4961)));
float _webgl_6cd3ea4a4d7f2e24 = {0.0};
(_webgl_6cd3ea4a4d7f2e24 = (_webgl_35451d7fcf7a843d - _webgl_48742813565ac55d.x));
float _webgl_17eaf291e44ff974 = {0.0};
(_webgl_17eaf291e44ff974 = clamp((((_webgl_bb4c022d8fffa1de / (_webgl_bb4c022d8fffa1de + (_webgl_6cd3ea4a4d7f2e24 * _webgl_6cd3ea4a4d7f2e24))) - 0.1) / 0.89999998), 0.0, 1.0));
float _webgl_265b07338d1f26ef = {0.0};
if ((_webgl_35451d7fcf7a843d <= _webgl_48742813565ac55d.x))
{
(_webgl_265b07338d1f26ef = 1.0);
}
else
{
(_webgl_265b07338d1f26ef = _webgl_17eaf291e44ff974);
}
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * _webgl_265b07338d1f26ef));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 + (_webgl_9251dcdacdfa452 * _webgl_1855da97c0758e43)));
float _webgl_6845b595a6db2b36 = {0.0};
(_webgl_6845b595a6db2b36 = exp2((_webgl_8e684f5904e88831 * 11.0)));
float _webgl_40d3fc5bec147c69 = {0.0};
(_webgl_40d3fc5bec147c69 = max((_webgl_6845b595a6db2b36 * lerp(1.0, (1.0 / (1.0 + (_webgl_6845b595a6db2b36 * ((1.0 / clamp(sqrt(dot(_webgl_f28d072c82c61bea, _webgl_f28d072c82c61bea)), 0.0, 1.0)) - 1.0)))), _webgl_c72812b39ae458b)), 9.9999997e-05));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * ((pow(max(dot(normalize(((-_webgl_8eabcbad90e5f7cf) + _webgl_dbb0b86db3589565)), _webgl_d189f73da6eb4d5b), 0.0), _webgl_40d3fc5bec147c69) * (_webgl_40d3fc5bec147c69 + 2.0)) / 8.0)));
(_webgl_3d74e5997dd7c222 = (_webgl_9251dcdacdfa452 * _webgl_1855da97c0758e43));
}
(_webgl_3d74e5997dd7c222 = (_webgl_3d74e5997dd7c222 * _webgl_73488ceaa0ef8fe3.z));
(_webgl_9d2f5706d0aa9ead = (_webgl_cfe4f407d6834756 * _webgl_73488ceaa0ef8fe3.z));
float3 _webgl_dbaa033991f73c9d = {0.0, 0.0, 0.0};
(_webgl_dbaa033991f73c9d = lerp((_webgl_4daadd2dc6febc51.xyz * _webgl_540f7c123bdf52c0), (_webgl_3d74e5997dd7c222 + (_webgl_9d2f5706d0aa9ead.xyz * _webgl_9d2f5706d0aa9ead.w)), _webgl_acb134d5a49c2148));
(out_webgl_9b98566002e557b5.xyz = _webgl_dbaa033991f73c9d);
(out_webgl_9b98566002e557b5.xyz = (out_webgl_9b98566002e557b5.xyz + _webgl_2d459f8069f64681));
float3 _webgl_8a1c983d2a5521d3 = {0.0, 0.0, 0.0};
(_webgl_8a1c983d2a5521d3 = (_webgl_5c81bf65ffac0762 - _webgl_35c9514d594e36f3));
(out_webgl_9b98566002e557b5.xyz = lerp(_webgl_3b3710b9db4788a7, out_webgl_9b98566002e557b5.xyz, clamp(exp(((-sqrt(dot(_webgl_8a1c983d2a5521d3, _webgl_8a1c983d2a5521d3))) * _webgl_5985a6d987efdfc3)), 0.0, 1.0)));
(out_webgl_9b98566002e557b5.xyz = out_webgl_9b98566002e557b5.xyz);
(out_webgl_9b98566002e557b5.xyz = out_webgl_9b98566002e557b5.xyz);
(out_webgl_9b98566002e557b5.w = 1.0);
(out_webgl_9b98566002e557b5.x += 0.91693056);
}
void f_initGlobals()
{
(_webgl_9d2f5706d0aa9ead = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_d189f73da6eb4d5b = float3(0.0, 0.0, 0.0));
(_webgl_540f7c123bdf52c0 = float3(0.0, 0.0, 0.0));
(_webgl_3d74e5997dd7c222 = float3(0.0, 0.0, 0.0));
(_webgl_11482133dc10ada = float3(0.0, 0.0, 0.0));
(_webgl_acb134d5a49c2148 = float3(0.0, 0.0, 0.0));
(_webgl_8e684f5904e88831 = 0.0);
(_webgl_9251dcdacdfa452 = 0.0);
}
struct PS_INPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD6;
    float3 v0 : TEXCOORD0;
    float3 v1 : TEXCOORD1;
    float3 v2 : TEXCOORD2;
    float3 v3 : TEXCOORD3;
    float2 v4 : TEXCOORD4;
    float2 v5 : TEXCOORD5;
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
    _webgl_6580760fc7b305a7 = input.v1.xyz;
    _webgl_6ccc0e73d2b9d4de = input.v2.xyz;
    _webgl_cc88c95a9917294 = input.v3.xyz;
    _webgl_a0b62b4d8ddcd62b = input.v4.xy;
    _webgl_c381ead4a4662b4a = input.v5.xy;

    gl_main();

    return generateOutput();
}

