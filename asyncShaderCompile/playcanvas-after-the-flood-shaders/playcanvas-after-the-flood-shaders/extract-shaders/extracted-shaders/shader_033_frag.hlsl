
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
uniform float4x4 _webgl_f2f5cb546e387827 : register(c19);
uniform float4 _webgl_a4c24d4920e1444a : register(c23);
uniform float _webgl_c72812b39ae458b : register(c24);
uniform float3 _webgl_3b3710b9db4788a7 : register(c25);
uniform float _webgl_5985a6d987efdfc3 : register(c26);
uniform float _webgl_ae2115093f2ac183 : register(c27);
uniform float3 _webgl_2d459f8069f64681 : register(c28);
uniform float _webgl_508641f47c99a2ed : register(c29);
uniform float _webgl_7ae668e5b64ca8de : register(c30);
static const uint _webgl_615055869f1b0841 = 0;
static const uint _webgl_8167d7febf3081fa = 1;
static const uint _webgl_92406ab4e48f953a = 2;
static const uint _webgl_554ea46d87ba4287 = 3;
static const uint _webgl_886520cdb034ca8e = 4;
uniform Texture2D<float4> textures2D[5] : register(t0);
uniform SamplerState samplers2D[5] : register(s0);
static const uint _webgl_e2d4935665806094 = 5;
static const uint _webgl_6d18ad23908e287 = 6;
static const uint _webgl_6666018523ec4102 = 7;
static const uint _webgl_f40e146fb06e4a34 = 8;
static const uint _webgl_340f351c4a4314aa = 9;
static const uint _webgl_7b5e6932dac63e22 = 10;
static const uint textureIndexOffsetCube = 5;
static const uint samplerIndexOffsetCube = 5;
uniform TextureCube<float4> texturesCube[6] : register(t5);
uniform SamplerState samplersCube[6] : register(s5);
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
    SamplerMetadata samplerMetadata[11] : packoffset(c4);
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
(_webgl_540f7c123bdf52c0 = float3(0.0, 0.0, 0.0));
(_webgl_3d74e5997dd7c222 = float3(0.0, 0.0, 0.0));
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
float4 _webgl_cfb863ec5a9ad847 = {0.0, 0.0, 0.0, 0.0};
(_webgl_cfb863ec5a9ad847 = gl_texture2D(_webgl_554ea46d87ba4287, _webgl_a0b62b4d8ddcd62b));
(_webgl_8e684f5904e88831 = ((_webgl_508641f47c99a2ed * gl_texture2D(_webgl_886520cdb034ca8e, _webgl_a0b62b4d8ddcd62b).y) + 1e-07));
float _webgl_610859d73aaa0b48 = {0.0};
float _webgl_46665ba4a0ebb347 = {0.0};
(_webgl_46665ba4a0ebb347 = (1.0 - max(dot(_webgl_d189f73da6eb4d5b, _webgl_dbb0b86db3589565), 0.0)));
float _webgl_73488ceaa0ef8fe3 = {0.0};
(_webgl_73488ceaa0ef8fe3 = (_webgl_46665ba4a0ebb347 * _webgl_46665ba4a0ebb347));
(_webgl_610859d73aaa0b48 = (_webgl_46665ba4a0ebb347 * (_webgl_73488ceaa0ef8fe3 * _webgl_73488ceaa0ef8fe3)));
(_webgl_610859d73aaa0b48 = (_webgl_610859d73aaa0b48 * (_webgl_8e684f5904e88831 * _webgl_8e684f5904e88831)));
(_webgl_acb134d5a49c2148 = (_webgl_cfb863ec5a9ad847.xxx + ((1.0 - _webgl_cfb863ec5a9ad847.xxx) * _webgl_610859d73aaa0b48)));
float3 _webgl_2a333d6ab126340 = {0.0, 0.0, 0.0};
float3 _webgl_babd4d7601e5552c = {0.0, 0.0, 0.0};
(_webgl_babd4d7601e5552c = _webgl_d189f73da6eb4d5b);
float _webgl_e25c9b31409332e8 = {0.0};
(_webgl_e25c9b31409332e8 = max(max(abs(_webgl_d189f73da6eb4d5b.x), abs(_webgl_d189f73da6eb4d5b.y)), abs(_webgl_d189f73da6eb4d5b.z)));
float _webgl_91c6fbb789786f97 = {0.0};
(_webgl_91c6fbb789786f97 = abs(_webgl_d189f73da6eb4d5b.x));
if ((_webgl_91c6fbb789786f97 != _webgl_e25c9b31409332e8))
{
(_webgl_babd4d7601e5552c.x = (_webgl_d189f73da6eb4d5b.x * 0.75));
}
float _webgl_9e247bb82e5c20e0 = {0.0};
(_webgl_9e247bb82e5c20e0 = abs(_webgl_d189f73da6eb4d5b.y));
if ((_webgl_9e247bb82e5c20e0 != _webgl_e25c9b31409332e8))
{
(_webgl_babd4d7601e5552c.y = (_webgl_d189f73da6eb4d5b.y * 0.75));
}
float _webgl_3489059248406aa1 = {0.0};
(_webgl_3489059248406aa1 = abs(_webgl_d189f73da6eb4d5b.z));
if ((_webgl_3489059248406aa1 != _webgl_e25c9b31409332e8))
{
(_webgl_babd4d7601e5552c.z = (_webgl_d189f73da6eb4d5b.z * 0.75));
}
(_webgl_2a333d6ab126340.yz = _webgl_babd4d7601e5552c.yz);
(_webgl_2a333d6ab126340.x = (-_webgl_babd4d7601e5552c.x));
float4 _webgl_9086f39b9ec20200 = {0.0, 0.0, 0.0, 0.0};
(_webgl_9086f39b9ec20200 = gl_textureCube(_webgl_7b5e6932dac63e22, _webgl_2a333d6ab126340));
float3 _webgl_f26380f436f82532 = {0.0, 0.0, 0.0};
(_webgl_f26380f436f82532 = ((8.0 * _webgl_9086f39b9ec20200.w) * _webgl_9086f39b9ec20200.xyz));
(_webgl_540f7c123bdf52c0 = ((_webgl_f26380f436f82532 * _webgl_f26380f436f82532) * _webgl_ae2115093f2ac183));
float4 _webgl_34f0593d48a49a8 = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_746d944ee3cead31 = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_8844bff614333533[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
float3 _webgl_8bc9631d6841739b = {0.0, 0.0, 0.0};
int _webgl_e6163b5848234c35 = {0};
int _webgl_7de218397586c2 = {0};
float _webgl_4a69825d2061f2e4 = {0.0};
(_webgl_4a69825d2061f2e4 = (clamp((1.0 - _webgl_8e684f5904e88831), 0.0, 1.0) * 5.0));
(_webgl_7de218397586c2 = int_ctor(_webgl_4a69825d2061f2e4));
(_webgl_e6163b5848234c35 = int_ctor(min((_webgl_4a69825d2061f2e4 + 1.0), 7.0)));
float3 _webgl_708bf5ae40e1493 = {0.0, 0.0, 0.0};
(_webgl_708bf5ae40e1493 = _webgl_49a0cb6f9237aa8);
float _webgl_5cfd34df9dcb15f5 = {0.0};
(_webgl_5cfd34df9dcb15f5 = (1.0 - (exp2(_webgl_4a69825d2061f2e4) / 128.0)));
float _webgl_cfe4f407d6834756 = {0.0};
(_webgl_cfe4f407d6834756 = max(max(abs(_webgl_49a0cb6f9237aa8.x), abs(_webgl_49a0cb6f9237aa8.y)), abs(_webgl_49a0cb6f9237aa8.z)));
float _webgl_8eabcbad90e5f7cf = {0.0};
(_webgl_8eabcbad90e5f7cf = abs(_webgl_49a0cb6f9237aa8.x));
if ((_webgl_8eabcbad90e5f7cf != _webgl_cfe4f407d6834756))
{
(_webgl_708bf5ae40e1493.x = (_webgl_49a0cb6f9237aa8.x * _webgl_5cfd34df9dcb15f5));
}
float _webgl_45bc8ea7e5f7a77c = {0.0};
(_webgl_45bc8ea7e5f7a77c = abs(_webgl_49a0cb6f9237aa8.y));
if ((_webgl_45bc8ea7e5f7a77c != _webgl_cfe4f407d6834756))
{
(_webgl_708bf5ae40e1493.y = (_webgl_49a0cb6f9237aa8.y * _webgl_5cfd34df9dcb15f5));
}
float _webgl_d7a381f02878b408 = {0.0};
(_webgl_d7a381f02878b408 = abs(_webgl_49a0cb6f9237aa8.z));
if ((_webgl_d7a381f02878b408 != _webgl_cfe4f407d6834756))
{
(_webgl_708bf5ae40e1493.z = (_webgl_49a0cb6f9237aa8.z * _webgl_5cfd34df9dcb15f5));
}
(_webgl_8bc9631d6841739b.yz = _webgl_708bf5ae40e1493.yz);
(_webgl_8bc9631d6841739b.x = (-_webgl_708bf5ae40e1493.x));
(_webgl_8844bff614333533[0] = gl_textureCube(_webgl_e2d4935665806094, _webgl_8bc9631d6841739b));
(_webgl_8844bff614333533[1] = gl_textureCube(_webgl_6d18ad23908e287, _webgl_8bc9631d6841739b));
(_webgl_8844bff614333533[2] = gl_textureCube(_webgl_6666018523ec4102, _webgl_8bc9631d6841739b));
(_webgl_8844bff614333533[3] = gl_textureCube(_webgl_f40e146fb06e4a34, _webgl_8bc9631d6841739b));
(_webgl_8844bff614333533[4] = gl_textureCube(_webgl_340f351c4a4314aa, _webgl_8bc9631d6841739b));
(_webgl_8844bff614333533[5] = gl_textureCube(_webgl_7b5e6932dac63e22, _webgl_8bc9631d6841739b));
{ for(int _webgl_8ccdd60fa2f41adb = {0}; (_webgl_8ccdd60fa2f41adb < 6); (_webgl_8ccdd60fa2f41adb++))
{
if ((_webgl_8ccdd60fa2f41adb == _webgl_7de218397586c2))
{
(_webgl_34f0593d48a49a8 = _webgl_8844bff614333533[int_ctor(clamp(float_ctor(_webgl_8ccdd60fa2f41adb), 0.0, 5.0))]);
}
if ((_webgl_8ccdd60fa2f41adb == _webgl_e6163b5848234c35))
{
(_webgl_746d944ee3cead31 = _webgl_8844bff614333533[int_ctor(clamp(float_ctor(_webgl_8ccdd60fa2f41adb), 0.0, 5.0))]);
}
}
}
float4 _webgl_1e0a569fa8d323c5 = {0.0, 0.0, 0.0, 0.0};
(_webgl_1e0a569fa8d323c5 = lerp(_webgl_34f0593d48a49a8, _webgl_746d944ee3cead31, frac(_webgl_4a69825d2061f2e4)));
float3 _webgl_6b1576cc49ca380b = {0.0, 0.0, 0.0};
(_webgl_6b1576cc49ca380b = ((8.0 * _webgl_1e0a569fa8d323c5.w) * _webgl_1e0a569fa8d323c5.xyz));
float4 _webgl_82fa7c9f93cc7839 = {0.0, 0.0, 0.0, 0.0};
(_webgl_82fa7c9f93cc7839.xyz = ((_webgl_6b1576cc49ca380b * _webgl_6b1576cc49ca380b) * _webgl_ae2115093f2ac183));
(_webgl_82fa7c9f93cc7839.w = _webgl_7ae668e5b64ca8de);
(_webgl_11482133dc10ada = (_webgl_5c81bf65ffac0762 - _webgl_16d8e27babe3e15e));
float3 _webgl_6b8507d7c52a30c5 = {0.0, 0.0, 0.0};
(_webgl_6b8507d7c52a30c5 = normalize(_webgl_11482133dc10ada));
float _webgl_bc517a070a88ef4a = {0.0};
(_webgl_bc517a070a88ef4a = max(((_webgl_1a380463a8bc7359 - sqrt(dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada))) / _webgl_1a380463a8bc7359), 0.0));
(_webgl_9251dcdacdfa452 = _webgl_bc517a070a88ef4a);
if ((_webgl_bc517a070a88ef4a > 9.9999997e-06))
{
float _webgl_a5cbea098f008107 = {0.0};
(_webgl_a5cbea098f008107 = clamp(((dot(_webgl_6b8507d7c52a30c5, _webgl_35202d7eed2427d) - _webgl_755af7149e45828a) / (_webgl_2dd2385497bef344 - _webgl_755af7149e45828a)), 0.0, 1.0));
(_webgl_9251dcdacdfa452 = (_webgl_bc517a070a88ef4a * (_webgl_a5cbea098f008107 * (_webgl_a5cbea098f008107 * (3.0 - (2.0 * _webgl_a5cbea098f008107))))));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * max(dot(_webgl_d189f73da6eb4d5b, (-_webgl_6b8507d7c52a30c5)), 0.0)));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 + (_webgl_9251dcdacdfa452 * _webgl_1855da97c0758e43)));
float _webgl_e422f03590b051e5 = {0.0};
(_webgl_e422f03590b051e5 = exp2((_webgl_8e684f5904e88831 * 11.0)));
float _webgl_a2ea1ce929cac431 = {0.0};
(_webgl_a2ea1ce929cac431 = max((_webgl_e422f03590b051e5 * lerp(1.0, (1.0 / (1.0 + (_webgl_e422f03590b051e5 * ((1.0 / clamp(sqrt(dot(_webgl_f28d072c82c61bea, _webgl_f28d072c82c61bea)), 0.0, 1.0)) - 1.0)))), _webgl_c72812b39ae458b)), 9.9999997e-05));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * ((pow(max(dot(normalize(((-_webgl_6b8507d7c52a30c5) + _webgl_dbb0b86db3589565)), _webgl_d189f73da6eb4d5b), 0.0), _webgl_a2ea1ce929cac431) * (_webgl_a2ea1ce929cac431 + 2.0)) / 8.0)));
(_webgl_3d74e5997dd7c222 = (_webgl_9251dcdacdfa452 * _webgl_1855da97c0758e43));
}
(_webgl_11482133dc10ada = (_webgl_5c81bf65ffac0762 - _webgl_71e3cad5e42a89bb));
float3 _webgl_d3a0349fad6621fb = {0.0, 0.0, 0.0};
(_webgl_d3a0349fad6621fb = normalize(_webgl_11482133dc10ada));
float _webgl_27df5b64c4a4ee8d = {0.0};
float _webgl_f05a73b03fcb4961 = {0.0};
(_webgl_f05a73b03fcb4961 = dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada));
float _webgl_bb4c022d8fffa1de = {0.0};
(_webgl_bb4c022d8fffa1de = (1.0 / _webgl_1c82dc879cda6ae2));
(_webgl_27df5b64c4a4ee8d = ((1.0 / (_webgl_f05a73b03fcb4961 + 1.0)) * 16.0));
float _webgl_d37a5bdd12c228c6 = {0.0};
(_webgl_d37a5bdd12c228c6 = (_webgl_f05a73b03fcb4961 * (_webgl_bb4c022d8fffa1de * _webgl_bb4c022d8fffa1de)));
float _webgl_17eaf291e44ff974 = {0.0};
(_webgl_17eaf291e44ff974 = clamp((1.0 - (_webgl_d37a5bdd12c228c6 * _webgl_d37a5bdd12c228c6)), 0.0, 1.0));
(_webgl_27df5b64c4a4ee8d = (_webgl_27df5b64c4a4ee8d * (_webgl_17eaf291e44ff974 * _webgl_17eaf291e44ff974)));
(_webgl_9251dcdacdfa452 = _webgl_27df5b64c4a4ee8d);
if ((_webgl_27df5b64c4a4ee8d > 9.9999997e-06))
{
float _webgl_265b07338d1f26ef = {0.0};
(_webgl_265b07338d1f26ef = clamp(((dot(_webgl_d3a0349fad6621fb, _webgl_a8a39767ea2c8eb7) - _webgl_34ab7d99e8e69aa4) / (_webgl_e6010fd023fb284f - _webgl_34ab7d99e8e69aa4)), 0.0, 1.0));
(_webgl_9251dcdacdfa452 = (_webgl_27df5b64c4a4ee8d * (_webgl_265b07338d1f26ef * (_webgl_265b07338d1f26ef * (3.0 - (2.0 * _webgl_265b07338d1f26ef))))));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * max(dot(_webgl_d189f73da6eb4d5b, (-_webgl_d3a0349fad6621fb)), 0.0)));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 + (_webgl_9251dcdacdfa452 * _webgl_10617a1597481d62)));
float _webgl_6845b595a6db2b36 = {0.0};
(_webgl_6845b595a6db2b36 = exp2((_webgl_8e684f5904e88831 * 11.0)));
float _webgl_40d3fc5bec147c69 = {0.0};
(_webgl_40d3fc5bec147c69 = max((_webgl_6845b595a6db2b36 * lerp(1.0, (1.0 / (1.0 + (_webgl_6845b595a6db2b36 * ((1.0 / clamp(sqrt(dot(_webgl_f28d072c82c61bea, _webgl_f28d072c82c61bea)), 0.0, 1.0)) - 1.0)))), _webgl_c72812b39ae458b)), 9.9999997e-05));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * ((pow(max(dot(normalize(((-_webgl_d3a0349fad6621fb) + _webgl_dbb0b86db3589565)), _webgl_d189f73da6eb4d5b), 0.0), _webgl_40d3fc5bec147c69) * (_webgl_40d3fc5bec147c69 + 2.0)) / 8.0)));
(_webgl_3d74e5997dd7c222 = (_webgl_3d74e5997dd7c222 + (_webgl_9251dcdacdfa452 * _webgl_10617a1597481d62)));
}
(_webgl_11482133dc10ada = (_webgl_5c81bf65ffac0762 - _webgl_a0d6d9dec5ad53fe));
float3 _webgl_dbaa033991f73c9d = {0.0, 0.0, 0.0};
(_webgl_dbaa033991f73c9d = normalize(_webgl_11482133dc10ada));
float _webgl_8a1c983d2a5521d3 = {0.0};
(_webgl_8a1c983d2a5521d3 = max(((_webgl_2f0c4fd3d54f412 - sqrt(dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada))) / _webgl_2f0c4fd3d54f412), 0.0));
(_webgl_9251dcdacdfa452 = _webgl_8a1c983d2a5521d3);
if ((_webgl_8a1c983d2a5521d3 > 9.9999997e-06))
{
float _webgl_a8edb34b463f3ac3 = {0.0};
(_webgl_a8edb34b463f3ac3 = clamp(((dot(_webgl_dbaa033991f73c9d, _webgl_c74e73a88f49c8c7) - _webgl_b1fe332e1acaed26) / (_webgl_e3e131ff0e27f0c0 - _webgl_b1fe332e1acaed26)), 0.0, 1.0));
(_webgl_9251dcdacdfa452 = (_webgl_8a1c983d2a5521d3 * (_webgl_a8edb34b463f3ac3 * (_webgl_a8edb34b463f3ac3 * (3.0 - (2.0 * _webgl_a8edb34b463f3ac3))))));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * max(dot(_webgl_d189f73da6eb4d5b, (-_webgl_dbaa033991f73c9d)), 0.0)));
float4 _webgl_c6629a02a79101aa = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_24698dc60b28d11 = {0.0, 0.0, 0.0, 0.0};
(_webgl_24698dc60b28d11.w = 1.0);
(_webgl_24698dc60b28d11.xyz = _webgl_5c81bf65ffac0762);
float4 _webgl_61c6aec6c44642a1 = {0.0, 0.0, 0.0, 0.0};
(_webgl_61c6aec6c44642a1 = mul(transpose(_webgl_f2f5cb546e387827), _webgl_24698dc60b28d11));
(_webgl_c6629a02a79101aa.zw = _webgl_61c6aec6c44642a1.zw);
(_webgl_c6629a02a79101aa.xy = (_webgl_61c6aec6c44642a1.xy / _webgl_61c6aec6c44642a1.w));
float _webgl_ad8a6ee9ce8755c1 = {0.0};
(_webgl_ad8a6ee9ce8755c1 = ((sqrt(dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada)) * _webgl_a4c24d4920e1444a.w) + _webgl_a4c24d4920e1444a.z));
float4 _webgl_b3646d04812e7a4a = {0.0, 0.0, 0.0, 0.0};
(_webgl_b3646d04812e7a4a = gl_texture2D(_webgl_615055869f1b0841, _webgl_c6629a02a79101aa.xy));
float3 _webgl_7edc71e79ab928c1 = {0.0, 0.0, 0.0};
(_webgl_7edc71e79ab928c1.z = 0.0);
(_webgl_7edc71e79ab928c1.x = ((_webgl_b3646d04812e7a4a.y * 0.0039215689) + _webgl_b3646d04812e7a4a.x));
(_webgl_7edc71e79ab928c1.y = ((_webgl_b3646d04812e7a4a.w * 0.0039215689) + _webgl_b3646d04812e7a4a.z));
float _webgl_8badbc4aa9205681 = {0.0};
(_webgl_8badbc4aa9205681 = (_webgl_a4c24d4920e1444a.y * _webgl_ad8a6ee9ce8755c1));
float _webgl_e760ed8adca1c9c3 = {0.0};
(_webgl_e760ed8adca1c9c3 = max((_webgl_7edc71e79ab928c1.y - (_webgl_7edc71e79ab928c1.x * _webgl_7edc71e79ab928c1.x)), (_webgl_8badbc4aa9205681 * _webgl_8badbc4aa9205681)));
float _webgl_80f9c2f994f34f1e = {0.0};
(_webgl_80f9c2f994f34f1e = (_webgl_ad8a6ee9ce8755c1 - _webgl_7edc71e79ab928c1.x));
float _webgl_6a9bcb091df1cdf6 = {0.0};
(_webgl_6a9bcb091df1cdf6 = clamp((((_webgl_e760ed8adca1c9c3 / (_webgl_e760ed8adca1c9c3 + (_webgl_80f9c2f994f34f1e * _webgl_80f9c2f994f34f1e))) - 0.1) / 0.89999998), 0.0, 1.0));
float _webgl_a52374383578cc70 = {0.0};
if ((_webgl_ad8a6ee9ce8755c1 <= _webgl_7edc71e79ab928c1.x))
{
(_webgl_a52374383578cc70 = 1.0);
}
else
{
(_webgl_a52374383578cc70 = _webgl_6a9bcb091df1cdf6);
}
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * _webgl_a52374383578cc70));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 + (_webgl_9251dcdacdfa452 * _webgl_5886825673b0276f)));
float _webgl_e47f7fad6c31aebc = {0.0};
(_webgl_e47f7fad6c31aebc = exp2((_webgl_8e684f5904e88831 * 11.0)));
float _webgl_56077667bfd6d861 = {0.0};
(_webgl_56077667bfd6d861 = max((_webgl_e47f7fad6c31aebc * lerp(1.0, (1.0 / (1.0 + (_webgl_e47f7fad6c31aebc * ((1.0 / clamp(sqrt(dot(_webgl_f28d072c82c61bea, _webgl_f28d072c82c61bea)), 0.0, 1.0)) - 1.0)))), _webgl_c72812b39ae458b)), 9.9999997e-05));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * ((pow(max(dot(normalize(((-_webgl_dbaa033991f73c9d) + _webgl_dbb0b86db3589565)), _webgl_d189f73da6eb4d5b), 0.0), _webgl_56077667bfd6d861) * (_webgl_56077667bfd6d861 + 2.0)) / 8.0)));
(_webgl_3d74e5997dd7c222 = (_webgl_3d74e5997dd7c222 + (_webgl_9251dcdacdfa452 * _webgl_5886825673b0276f)));
}
float3 _webgl_b190a86bc7f938d2 = {0.0, 0.0, 0.0};
(_webgl_b190a86bc7f938d2 = lerp((_webgl_4daadd2dc6febc51.xyz * _webgl_540f7c123bdf52c0), (_webgl_3d74e5997dd7c222 + (_webgl_82fa7c9f93cc7839.xyz * _webgl_7ae668e5b64ca8de)), _webgl_acb134d5a49c2148));
(out_webgl_9b98566002e557b5.xyz = _webgl_b190a86bc7f938d2);
(out_webgl_9b98566002e557b5.xyz = (out_webgl_9b98566002e557b5.xyz + _webgl_2d459f8069f64681));
float3 _webgl_95e254f0ea5b5564 = {0.0, 0.0, 0.0};
(_webgl_95e254f0ea5b5564 = (_webgl_5c81bf65ffac0762 - _webgl_35c9514d594e36f3));
(out_webgl_9b98566002e557b5.xyz = lerp(_webgl_3b3710b9db4788a7, out_webgl_9b98566002e557b5.xyz, clamp(exp(((-sqrt(dot(_webgl_95e254f0ea5b5564, _webgl_95e254f0ea5b5564))) * _webgl_5985a6d987efdfc3)), 0.0, 1.0)));
(out_webgl_9b98566002e557b5.xyz = out_webgl_9b98566002e557b5.xyz);
(out_webgl_9b98566002e557b5.xyz = out_webgl_9b98566002e557b5.xyz);
(out_webgl_9b98566002e557b5.w = 1.0);
(out_webgl_9b98566002e557b5.x += 0.01455113);
}
void f_initGlobals()
{
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
    float4 gl_Position : TEXCOORD5;
    float3 v0 : TEXCOORD0;
    float3 v1 : TEXCOORD1;
    float3 v2 : TEXCOORD2;
    float3 v3 : TEXCOORD3;
    float2 v4 : TEXCOORD4;
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

    gl_main();

    return generateOutput();
}

