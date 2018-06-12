
float float_ctor(int x0)
{
    return float(x0);
}
float3 vec3_ctor(float x0)
{
    return float3(x0, x0, x0);
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
uniform float3 _webgl_464e43777b6e9942 : register(c19);
uniform float3 _webgl_667b191dc0b01a84 : register(c20);
uniform float _webgl_21fed8ee50175509 : register(c21);
uniform float3 _webgl_8eda54b98f40e5ba : register(c22);
uniform float _webgl_af8a456fd59f087a : register(c23);
uniform float _webgl_b4ce66a72995d6d3 : register(c24);
uniform float3 _webgl_83eb533d55947b05 : register(c25);
uniform float3 _webgl_c294b7f38e7e86f3 : register(c26);
uniform float _webgl_ad7be31ae7343b3c : register(c27);
uniform float3 _webgl_45097443d9ba9f2 : register(c28);
uniform float _webgl_475395d6d22dcc68 : register(c29);
uniform float _webgl_f84251906450c96c : register(c30);
uniform float3 _webgl_9033605868862920 : register(c31);
uniform float3 _webgl_ff333c5bf5cdf925 : register(c32);
uniform float _webgl_d0a71935fe7a5aed : register(c33);
uniform float3 _webgl_9350ba34b59e472b : register(c34);
uniform float _webgl_73ad2e0733daf015 : register(c35);
uniform float _webgl_908a205fa05f8de8 : register(c36);
uniform float4x4 _webgl_1ecf190d2c7bb704 : register(c37);
uniform float4 _webgl_a34c954946a86e0e : register(c41);
uniform float _webgl_c72812b39ae458b : register(c42);
uniform float3 _webgl_3b3710b9db4788a7 : register(c43);
uniform float _webgl_5985a6d987efdfc3 : register(c44);
uniform float _webgl_c69990ec6a7a5be2 : register(c45);
uniform float3 _webgl_2d459f8069f64681 : register(c46);
uniform float3 _webgl_e2179ae4f2cb06c9 : register(c47);
uniform float _webgl_508641f47c99a2ed : register(c48);
uniform float _webgl_7ae668e5b64ca8de : register(c49);
static const uint _webgl_364e7a5f8b2c5f7c = 0;
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
static  float4 _webgl_e5253e8e18397069 = {0, 0, 0, 0};
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
static float4 _webgl_9d2f5706d0aa9ead = {0, 0, 0, 0};
static float3 _webgl_d7c0aae5deddf4ea = {0, 0, 0};
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
(_webgl_9d2f5706d0aa9ead = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_acb134d5a49c2148 = float3(0.0, 0.0, 0.0));
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
(_webgl_d7c0aae5deddf4ea = _webgl_4daadd2dc6febc51.xyz);
if ((_webgl_c69990ec6a7a5be2 > 0.5))
{
(_webgl_d7c0aae5deddf4ea = (_webgl_4daadd2dc6febc51.xyz * vec3_ctor((_webgl_e5253e8e18397069.w * 2.0))));
}
else
{
(_webgl_d7c0aae5deddf4ea = (_webgl_d7c0aae5deddf4ea * vec3_ctor(clamp(((_webgl_e5253e8e18397069.w * _webgl_e5253e8e18397069.w) * (_webgl_e5253e8e18397069.w * 5.0)), 0.0, 1.0))));
}
(_webgl_acb134d5a49c2148 = (gl_texture2D(_webgl_554ea46d87ba4287, _webgl_c381ead4a4662b4a).xyz * _webgl_e2179ae4f2cb06c9));
(_webgl_8e684f5904e88831 = ((_webgl_508641f47c99a2ed * gl_texture2D(_webgl_886520cdb034ca8e, _webgl_a0b62b4d8ddcd62b).y) + 1e-07));
float _webgl_5bb1df3cce7be69e = {0.0};
float _webgl_5ccca921d933644d = {0.0};
(_webgl_5ccca921d933644d = (1.0 - max(dot(_webgl_d189f73da6eb4d5b, _webgl_dbb0b86db3589565), 0.0)));
float _webgl_46665ba4a0ebb347 = {0.0};
(_webgl_46665ba4a0ebb347 = (_webgl_5ccca921d933644d * _webgl_5ccca921d933644d));
(_webgl_5bb1df3cce7be69e = (_webgl_5ccca921d933644d * (_webgl_46665ba4a0ebb347 * _webgl_46665ba4a0ebb347)));
(_webgl_5bb1df3cce7be69e = (_webgl_5bb1df3cce7be69e * (_webgl_8e684f5904e88831 * _webgl_8e684f5904e88831)));
(_webgl_acb134d5a49c2148 = (_webgl_acb134d5a49c2148 + ((1.0 - _webgl_acb134d5a49c2148) * _webgl_5bb1df3cce7be69e)));
float3 _webgl_5f15f0a0134f3a31 = {0.0, 0.0, 0.0};
float3 _webgl_b8606988d9392e2a = {0.0, 0.0, 0.0};
(_webgl_b8606988d9392e2a = _webgl_d189f73da6eb4d5b);
float _webgl_4879e67e5ac43730 = {0.0};
(_webgl_4879e67e5ac43730 = max(max(abs(_webgl_d189f73da6eb4d5b.x), abs(_webgl_d189f73da6eb4d5b.y)), abs(_webgl_d189f73da6eb4d5b.z)));
float _webgl_e25c9b31409332e8 = {0.0};
(_webgl_e25c9b31409332e8 = abs(_webgl_d189f73da6eb4d5b.x));
if ((_webgl_e25c9b31409332e8 != _webgl_4879e67e5ac43730))
{
(_webgl_b8606988d9392e2a.x = (_webgl_d189f73da6eb4d5b.x * 0.75));
}
float _webgl_91c6fbb789786f97 = {0.0};
(_webgl_91c6fbb789786f97 = abs(_webgl_d189f73da6eb4d5b.y));
if ((_webgl_91c6fbb789786f97 != _webgl_4879e67e5ac43730))
{
(_webgl_b8606988d9392e2a.y = (_webgl_d189f73da6eb4d5b.y * 0.75));
}
float _webgl_9e247bb82e5c20e0 = {0.0};
(_webgl_9e247bb82e5c20e0 = abs(_webgl_d189f73da6eb4d5b.z));
if ((_webgl_9e247bb82e5c20e0 != _webgl_4879e67e5ac43730))
{
(_webgl_b8606988d9392e2a.z = (_webgl_d189f73da6eb4d5b.z * 0.75));
}
(_webgl_5f15f0a0134f3a31.yz = _webgl_b8606988d9392e2a.yz);
(_webgl_5f15f0a0134f3a31.x = (-_webgl_b8606988d9392e2a.x));
float4 _webgl_3489059248406aa1 = {0.0, 0.0, 0.0, 0.0};
(_webgl_3489059248406aa1 = gl_textureCube(_webgl_7b5e6932dac63e22, _webgl_5f15f0a0134f3a31));
float3 _webgl_9086f39b9ec20200 = {0.0, 0.0, 0.0};
(_webgl_9086f39b9ec20200 = ((8.0 * _webgl_3489059248406aa1.w) * _webgl_3489059248406aa1.xyz));
float _webgl_f26380f436f82532 = {0.0};
(_webgl_f26380f436f82532 = clamp(_webgl_e5253e8e18397069.w, 0.0, 1.0));
(_webgl_540f7c123bdf52c0 = ((_webgl_9086f39b9ec20200 * _webgl_9086f39b9ec20200) * _webgl_f26380f436f82532));
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
(_webgl_82fa7c9f93cc7839.xyz = (_webgl_6b1576cc49ca380b * _webgl_6b1576cc49ca380b));
(_webgl_82fa7c9f93cc7839.w = _webgl_7ae668e5b64ca8de);
(_webgl_9d2f5706d0aa9ead = _webgl_82fa7c9f93cc7839);
(_webgl_11482133dc10ada = (_webgl_5c81bf65ffac0762 - _webgl_16d8e27babe3e15e));
float3 _webgl_6b8507d7c52a30c5 = {0.0, 0.0, 0.0};
(_webgl_6b8507d7c52a30c5 = normalize(_webgl_11482133dc10ada));
float _webgl_b9fe00dd61e6355d = {0.0};
float _webgl_a5cbea098f008107 = {0.0};
(_webgl_a5cbea098f008107 = dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada));
float _webgl_e422f03590b051e5 = {0.0};
(_webgl_e422f03590b051e5 = (1.0 / _webgl_1a380463a8bc7359));
(_webgl_b9fe00dd61e6355d = ((1.0 / (_webgl_a5cbea098f008107 + 1.0)) * 16.0));
float _webgl_83eba4f7ccc359e = {0.0};
(_webgl_83eba4f7ccc359e = (_webgl_a5cbea098f008107 * (_webgl_e422f03590b051e5 * _webgl_e422f03590b051e5)));
float _webgl_d3a0349fad6621fb = {0.0};
(_webgl_d3a0349fad6621fb = clamp((1.0 - (_webgl_83eba4f7ccc359e * _webgl_83eba4f7ccc359e)), 0.0, 1.0));
(_webgl_b9fe00dd61e6355d = (_webgl_b9fe00dd61e6355d * (_webgl_d3a0349fad6621fb * _webgl_d3a0349fad6621fb)));
(_webgl_9251dcdacdfa452 = _webgl_b9fe00dd61e6355d);
if ((_webgl_b9fe00dd61e6355d > 9.9999997e-06))
{
float _webgl_48742813565ac55d = {0.0};
(_webgl_48742813565ac55d = clamp(((dot(_webgl_6b8507d7c52a30c5, _webgl_35202d7eed2427d) - _webgl_755af7149e45828a) / (_webgl_2dd2385497bef344 - _webgl_755af7149e45828a)), 0.0, 1.0));
(_webgl_9251dcdacdfa452 = (_webgl_b9fe00dd61e6355d * (_webgl_48742813565ac55d * (_webgl_48742813565ac55d * (3.0 - (2.0 * _webgl_48742813565ac55d))))));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * max(dot(_webgl_d189f73da6eb4d5b, (-_webgl_6b8507d7c52a30c5)), 0.0)));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 + (_webgl_9251dcdacdfa452 * _webgl_1855da97c0758e43)));
float _webgl_f05a73b03fcb4961 = {0.0};
(_webgl_f05a73b03fcb4961 = exp2((_webgl_8e684f5904e88831 * 11.0)));
float _webgl_bb4c022d8fffa1de = {0.0};
(_webgl_bb4c022d8fffa1de = max((_webgl_f05a73b03fcb4961 * lerp(1.0, (1.0 / (1.0 + (_webgl_f05a73b03fcb4961 * ((1.0 / clamp(sqrt(dot(_webgl_f28d072c82c61bea, _webgl_f28d072c82c61bea)), 0.0, 1.0)) - 1.0)))), _webgl_c72812b39ae458b)), 9.9999997e-05));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * ((pow(max(dot(normalize(((-_webgl_6b8507d7c52a30c5) + _webgl_dbb0b86db3589565)), _webgl_d189f73da6eb4d5b), 0.0), _webgl_bb4c022d8fffa1de) * (_webgl_bb4c022d8fffa1de + 2.0)) / 8.0)));
(_webgl_3d74e5997dd7c222 = (_webgl_9251dcdacdfa452 * _webgl_1855da97c0758e43));
}
(_webgl_11482133dc10ada = (_webgl_5c81bf65ffac0762 - _webgl_71e3cad5e42a89bb));
float3 _webgl_6cd3ea4a4d7f2e24 = {0.0, 0.0, 0.0};
(_webgl_6cd3ea4a4d7f2e24 = normalize(_webgl_11482133dc10ada));
float _webgl_d48475316ab1829f = {0.0};
float _webgl_265b07338d1f26ef = {0.0};
(_webgl_265b07338d1f26ef = dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada));
float _webgl_6845b595a6db2b36 = {0.0};
(_webgl_6845b595a6db2b36 = (1.0 / _webgl_1c82dc879cda6ae2));
(_webgl_d48475316ab1829f = ((1.0 / (_webgl_265b07338d1f26ef + 1.0)) * 16.0));
float _webgl_f7a8eaae9b2288a5 = {0.0};
(_webgl_f7a8eaae9b2288a5 = (_webgl_265b07338d1f26ef * (_webgl_6845b595a6db2b36 * _webgl_6845b595a6db2b36)));
float _webgl_dbaa033991f73c9d = {0.0};
(_webgl_dbaa033991f73c9d = clamp((1.0 - (_webgl_f7a8eaae9b2288a5 * _webgl_f7a8eaae9b2288a5)), 0.0, 1.0));
(_webgl_d48475316ab1829f = (_webgl_d48475316ab1829f * (_webgl_dbaa033991f73c9d * _webgl_dbaa033991f73c9d)));
(_webgl_9251dcdacdfa452 = _webgl_d48475316ab1829f);
if ((_webgl_d48475316ab1829f > 9.9999997e-06))
{
float _webgl_8a1c983d2a5521d3 = {0.0};
(_webgl_8a1c983d2a5521d3 = clamp(((dot(_webgl_6cd3ea4a4d7f2e24, _webgl_a8a39767ea2c8eb7) - _webgl_34ab7d99e8e69aa4) / (_webgl_e6010fd023fb284f - _webgl_34ab7d99e8e69aa4)), 0.0, 1.0));
(_webgl_9251dcdacdfa452 = (_webgl_d48475316ab1829f * (_webgl_8a1c983d2a5521d3 * (_webgl_8a1c983d2a5521d3 * (3.0 - (2.0 * _webgl_8a1c983d2a5521d3))))));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * max(dot(_webgl_d189f73da6eb4d5b, (-_webgl_6cd3ea4a4d7f2e24)), 0.0)));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 + (_webgl_9251dcdacdfa452 * _webgl_10617a1597481d62)));
float _webgl_a8edb34b463f3ac3 = {0.0};
(_webgl_a8edb34b463f3ac3 = exp2((_webgl_8e684f5904e88831 * 11.0)));
float _webgl_2ef05ecaa6259cbe = {0.0};
(_webgl_2ef05ecaa6259cbe = max((_webgl_a8edb34b463f3ac3 * lerp(1.0, (1.0 / (1.0 + (_webgl_a8edb34b463f3ac3 * ((1.0 / clamp(sqrt(dot(_webgl_f28d072c82c61bea, _webgl_f28d072c82c61bea)), 0.0, 1.0)) - 1.0)))), _webgl_c72812b39ae458b)), 9.9999997e-05));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * ((pow(max(dot(normalize(((-_webgl_6cd3ea4a4d7f2e24) + _webgl_dbb0b86db3589565)), _webgl_d189f73da6eb4d5b), 0.0), _webgl_2ef05ecaa6259cbe) * (_webgl_2ef05ecaa6259cbe + 2.0)) / 8.0)));
(_webgl_3d74e5997dd7c222 = (_webgl_3d74e5997dd7c222 + (_webgl_9251dcdacdfa452 * _webgl_10617a1597481d62)));
}
(_webgl_11482133dc10ada = (_webgl_5c81bf65ffac0762 - _webgl_a0d6d9dec5ad53fe));
float3 _webgl_24698dc60b28d11 = {0.0, 0.0, 0.0};
(_webgl_24698dc60b28d11 = normalize(_webgl_11482133dc10ada));
float _webgl_36566cc845e293da = {0.0};
float _webgl_af838643f97a28e8 = {0.0};
(_webgl_af838643f97a28e8 = dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada));
float _webgl_b3646d04812e7a4a = {0.0};
(_webgl_b3646d04812e7a4a = (1.0 / _webgl_2f0c4fd3d54f412));
(_webgl_36566cc845e293da = ((1.0 / (_webgl_af838643f97a28e8 + 1.0)) * 16.0));
float _webgl_bc7c24927dc51f27 = {0.0};
(_webgl_bc7c24927dc51f27 = (_webgl_af838643f97a28e8 * (_webgl_b3646d04812e7a4a * _webgl_b3646d04812e7a4a)));
float _webgl_8badbc4aa9205681 = {0.0};
(_webgl_8badbc4aa9205681 = clamp((1.0 - (_webgl_bc7c24927dc51f27 * _webgl_bc7c24927dc51f27)), 0.0, 1.0));
(_webgl_36566cc845e293da = (_webgl_36566cc845e293da * (_webgl_8badbc4aa9205681 * _webgl_8badbc4aa9205681)));
(_webgl_9251dcdacdfa452 = _webgl_36566cc845e293da);
if ((_webgl_36566cc845e293da > 9.9999997e-06))
{
float _webgl_e760ed8adca1c9c3 = {0.0};
(_webgl_e760ed8adca1c9c3 = clamp(((dot(_webgl_24698dc60b28d11, _webgl_c74e73a88f49c8c7) - _webgl_b1fe332e1acaed26) / (_webgl_e3e131ff0e27f0c0 - _webgl_b1fe332e1acaed26)), 0.0, 1.0));
(_webgl_9251dcdacdfa452 = (_webgl_36566cc845e293da * (_webgl_e760ed8adca1c9c3 * (_webgl_e760ed8adca1c9c3 * (3.0 - (2.0 * _webgl_e760ed8adca1c9c3))))));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * max(dot(_webgl_d189f73da6eb4d5b, (-_webgl_24698dc60b28d11)), 0.0)));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 + (_webgl_9251dcdacdfa452 * _webgl_5886825673b0276f)));
float _webgl_80f9c2f994f34f1e = {0.0};
(_webgl_80f9c2f994f34f1e = exp2((_webgl_8e684f5904e88831 * 11.0)));
float _webgl_6a9bcb091df1cdf6 = {0.0};
(_webgl_6a9bcb091df1cdf6 = max((_webgl_80f9c2f994f34f1e * lerp(1.0, (1.0 / (1.0 + (_webgl_80f9c2f994f34f1e * ((1.0 / clamp(sqrt(dot(_webgl_f28d072c82c61bea, _webgl_f28d072c82c61bea)), 0.0, 1.0)) - 1.0)))), _webgl_c72812b39ae458b)), 9.9999997e-05));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * ((pow(max(dot(normalize(((-_webgl_24698dc60b28d11) + _webgl_dbb0b86db3589565)), _webgl_d189f73da6eb4d5b), 0.0), _webgl_6a9bcb091df1cdf6) * (_webgl_6a9bcb091df1cdf6 + 2.0)) / 8.0)));
(_webgl_3d74e5997dd7c222 = (_webgl_3d74e5997dd7c222 + (_webgl_9251dcdacdfa452 * _webgl_5886825673b0276f)));
}
(_webgl_11482133dc10ada = (_webgl_5c81bf65ffac0762 - _webgl_667b191dc0b01a84));
float3 _webgl_a52374383578cc70 = {0.0, 0.0, 0.0};
(_webgl_a52374383578cc70 = normalize(_webgl_11482133dc10ada));
float _webgl_89b491f624dc5bc = {0.0};
float _webgl_56077667bfd6d861 = {0.0};
(_webgl_56077667bfd6d861 = dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada));
float _webgl_b190a86bc7f938d2 = {0.0};
(_webgl_b190a86bc7f938d2 = (1.0 / _webgl_21fed8ee50175509));
(_webgl_89b491f624dc5bc = ((1.0 / (_webgl_56077667bfd6d861 + 1.0)) * 16.0));
float _webgl_15eaa564a15fdd51 = {0.0};
(_webgl_15eaa564a15fdd51 = (_webgl_56077667bfd6d861 * (_webgl_b190a86bc7f938d2 * _webgl_b190a86bc7f938d2)));
float _webgl_8e449eeb6739befe = {0.0};
(_webgl_8e449eeb6739befe = clamp((1.0 - (_webgl_15eaa564a15fdd51 * _webgl_15eaa564a15fdd51)), 0.0, 1.0));
(_webgl_89b491f624dc5bc = (_webgl_89b491f624dc5bc * (_webgl_8e449eeb6739befe * _webgl_8e449eeb6739befe)));
(_webgl_9251dcdacdfa452 = _webgl_89b491f624dc5bc);
if ((_webgl_89b491f624dc5bc > 9.9999997e-06))
{
float _webgl_eb9e29ad556d5876 = {0.0};
(_webgl_eb9e29ad556d5876 = clamp(((dot(_webgl_a52374383578cc70, _webgl_8eda54b98f40e5ba) - _webgl_b4ce66a72995d6d3) / (_webgl_af8a456fd59f087a - _webgl_b4ce66a72995d6d3)), 0.0, 1.0));
(_webgl_9251dcdacdfa452 = (_webgl_89b491f624dc5bc * (_webgl_eb9e29ad556d5876 * (_webgl_eb9e29ad556d5876 * (3.0 - (2.0 * _webgl_eb9e29ad556d5876))))));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * max(dot(_webgl_d189f73da6eb4d5b, (-_webgl_a52374383578cc70)), 0.0)));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 + (_webgl_9251dcdacdfa452 * _webgl_464e43777b6e9942)));
float _webgl_6430cdf0dbc8e939 = {0.0};
(_webgl_6430cdf0dbc8e939 = exp2((_webgl_8e684f5904e88831 * 11.0)));
float _webgl_909dd7b8eca80202 = {0.0};
(_webgl_909dd7b8eca80202 = max((_webgl_6430cdf0dbc8e939 * lerp(1.0, (1.0 / (1.0 + (_webgl_6430cdf0dbc8e939 * ((1.0 / clamp(sqrt(dot(_webgl_f28d072c82c61bea, _webgl_f28d072c82c61bea)), 0.0, 1.0)) - 1.0)))), _webgl_c72812b39ae458b)), 9.9999997e-05));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * ((pow(max(dot(normalize(((-_webgl_a52374383578cc70) + _webgl_dbb0b86db3589565)), _webgl_d189f73da6eb4d5b), 0.0), _webgl_909dd7b8eca80202) * (_webgl_909dd7b8eca80202 + 2.0)) / 8.0)));
(_webgl_3d74e5997dd7c222 = (_webgl_3d74e5997dd7c222 + (_webgl_9251dcdacdfa452 * _webgl_464e43777b6e9942)));
}
(_webgl_11482133dc10ada = (_webgl_5c81bf65ffac0762 - _webgl_c294b7f38e7e86f3));
float3 _webgl_9090da22dad28bf7 = {0.0, 0.0, 0.0};
(_webgl_9090da22dad28bf7 = normalize(_webgl_11482133dc10ada));
float _webgl_fd87575b1ec477e2 = {0.0};
float _webgl_4a15523e4032dda7 = {0.0};
(_webgl_4a15523e4032dda7 = dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada));
float _webgl_1d1ddb76fbcf772a = {0.0};
(_webgl_1d1ddb76fbcf772a = (1.0 / _webgl_ad7be31ae7343b3c));
(_webgl_fd87575b1ec477e2 = ((1.0 / (_webgl_4a15523e4032dda7 + 1.0)) * 16.0));
float _webgl_3a296db739940187 = {0.0};
(_webgl_3a296db739940187 = (_webgl_4a15523e4032dda7 * (_webgl_1d1ddb76fbcf772a * _webgl_1d1ddb76fbcf772a)));
float _webgl_1a6c2875eb51b665 = {0.0};
(_webgl_1a6c2875eb51b665 = clamp((1.0 - (_webgl_3a296db739940187 * _webgl_3a296db739940187)), 0.0, 1.0));
(_webgl_fd87575b1ec477e2 = (_webgl_fd87575b1ec477e2 * (_webgl_1a6c2875eb51b665 * _webgl_1a6c2875eb51b665)));
(_webgl_9251dcdacdfa452 = _webgl_fd87575b1ec477e2);
if ((_webgl_fd87575b1ec477e2 > 9.9999997e-06))
{
float _webgl_efb9abf9cf1319d2 = {0.0};
(_webgl_efb9abf9cf1319d2 = clamp(((dot(_webgl_9090da22dad28bf7, _webgl_45097443d9ba9f2) - _webgl_f84251906450c96c) / (_webgl_475395d6d22dcc68 - _webgl_f84251906450c96c)), 0.0, 1.0));
(_webgl_9251dcdacdfa452 = (_webgl_fd87575b1ec477e2 * (_webgl_efb9abf9cf1319d2 * (_webgl_efb9abf9cf1319d2 * (3.0 - (2.0 * _webgl_efb9abf9cf1319d2))))));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * max(dot(_webgl_d189f73da6eb4d5b, (-_webgl_9090da22dad28bf7)), 0.0)));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 + (_webgl_9251dcdacdfa452 * _webgl_83eb533d55947b05)));
float _webgl_468e885b7f29418e = {0.0};
(_webgl_468e885b7f29418e = exp2((_webgl_8e684f5904e88831 * 11.0)));
float _webgl_45dfddb747caee = {0.0};
(_webgl_45dfddb747caee = max((_webgl_468e885b7f29418e * lerp(1.0, (1.0 / (1.0 + (_webgl_468e885b7f29418e * ((1.0 / clamp(sqrt(dot(_webgl_f28d072c82c61bea, _webgl_f28d072c82c61bea)), 0.0, 1.0)) - 1.0)))), _webgl_c72812b39ae458b)), 9.9999997e-05));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * ((pow(max(dot(normalize(((-_webgl_9090da22dad28bf7) + _webgl_dbb0b86db3589565)), _webgl_d189f73da6eb4d5b), 0.0), _webgl_45dfddb747caee) * (_webgl_45dfddb747caee + 2.0)) / 8.0)));
(_webgl_3d74e5997dd7c222 = (_webgl_3d74e5997dd7c222 + (_webgl_9251dcdacdfa452 * _webgl_83eb533d55947b05)));
}
(_webgl_11482133dc10ada = (_webgl_5c81bf65ffac0762 - _webgl_ff333c5bf5cdf925));
float3 _webgl_b59ec816fb13ac1d = {0.0, 0.0, 0.0};
(_webgl_b59ec816fb13ac1d = normalize(_webgl_11482133dc10ada));
float _webgl_a6168058744f5ce0 = {0.0};
float _webgl_ea6b6b1beb91da53 = {0.0};
(_webgl_ea6b6b1beb91da53 = dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada));
float _webgl_e9159e945655b007 = {0.0};
(_webgl_e9159e945655b007 = (1.0 / _webgl_d0a71935fe7a5aed));
(_webgl_a6168058744f5ce0 = ((1.0 / (_webgl_ea6b6b1beb91da53 + 1.0)) * 16.0));
float _webgl_e3d3ce1b8827c95 = {0.0};
(_webgl_e3d3ce1b8827c95 = (_webgl_ea6b6b1beb91da53 * (_webgl_e9159e945655b007 * _webgl_e9159e945655b007)));
float _webgl_60c1f9053e4803c5 = {0.0};
(_webgl_60c1f9053e4803c5 = clamp((1.0 - (_webgl_e3d3ce1b8827c95 * _webgl_e3d3ce1b8827c95)), 0.0, 1.0));
(_webgl_a6168058744f5ce0 = (_webgl_a6168058744f5ce0 * (_webgl_60c1f9053e4803c5 * _webgl_60c1f9053e4803c5)));
(_webgl_9251dcdacdfa452 = _webgl_a6168058744f5ce0);
if ((_webgl_a6168058744f5ce0 > 9.9999997e-06))
{
float _webgl_7e3324c54b5b8145 = {0.0};
(_webgl_7e3324c54b5b8145 = clamp(((dot(_webgl_b59ec816fb13ac1d, _webgl_9350ba34b59e472b) - _webgl_908a205fa05f8de8) / (_webgl_73ad2e0733daf015 - _webgl_908a205fa05f8de8)), 0.0, 1.0));
(_webgl_9251dcdacdfa452 = (_webgl_a6168058744f5ce0 * (_webgl_7e3324c54b5b8145 * (_webgl_7e3324c54b5b8145 * (3.0 - (2.0 * _webgl_7e3324c54b5b8145))))));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * max(dot(_webgl_d189f73da6eb4d5b, (-_webgl_b59ec816fb13ac1d)), 0.0)));
float4 _webgl_c19b318cd28dbce0 = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_8bc016e8908b6083 = {0.0, 0.0, 0.0, 0.0};
(_webgl_8bc016e8908b6083.w = 1.0);
(_webgl_8bc016e8908b6083.xyz = _webgl_5c81bf65ffac0762);
float4 _webgl_e953f7cb16b17110 = {0.0, 0.0, 0.0, 0.0};
(_webgl_e953f7cb16b17110 = mul(transpose(_webgl_1ecf190d2c7bb704), _webgl_8bc016e8908b6083));
(_webgl_c19b318cd28dbce0.zw = _webgl_e953f7cb16b17110.zw);
(_webgl_c19b318cd28dbce0.xy = (_webgl_e953f7cb16b17110.xy / _webgl_e953f7cb16b17110.w));
float _webgl_d3c67f8a9763abfa = {0.0};
(_webgl_d3c67f8a9763abfa = ((sqrt(dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada)) * _webgl_a34c954946a86e0e.w) + _webgl_a34c954946a86e0e.z));
float4 _webgl_953b31d99937628e = {0.0, 0.0, 0.0, 0.0};
(_webgl_953b31d99937628e = gl_texture2D(_webgl_364e7a5f8b2c5f7c, _webgl_c19b318cd28dbce0.xy));
float3 _webgl_966a3add4cf69c50 = {0.0, 0.0, 0.0};
(_webgl_966a3add4cf69c50.z = 0.0);
(_webgl_966a3add4cf69c50.x = ((_webgl_953b31d99937628e.y * 0.0039215689) + _webgl_953b31d99937628e.x));
(_webgl_966a3add4cf69c50.y = ((_webgl_953b31d99937628e.w * 0.0039215689) + _webgl_953b31d99937628e.z));
float _webgl_51fffd7cc690ecf8 = {0.0};
(_webgl_51fffd7cc690ecf8 = (_webgl_a34c954946a86e0e.y * _webgl_d3c67f8a9763abfa));
float _webgl_f1412ccb12cb1ff8 = {0.0};
(_webgl_f1412ccb12cb1ff8 = max((_webgl_966a3add4cf69c50.y - (_webgl_966a3add4cf69c50.x * _webgl_966a3add4cf69c50.x)), (_webgl_51fffd7cc690ecf8 * _webgl_51fffd7cc690ecf8)));
float _webgl_1e7d9c726c1fee81 = {0.0};
(_webgl_1e7d9c726c1fee81 = (_webgl_d3c67f8a9763abfa - _webgl_966a3add4cf69c50.x));
float _webgl_36ae7d52fd3a7b32 = {0.0};
(_webgl_36ae7d52fd3a7b32 = clamp((((_webgl_f1412ccb12cb1ff8 / (_webgl_f1412ccb12cb1ff8 + (_webgl_1e7d9c726c1fee81 * _webgl_1e7d9c726c1fee81))) - 0.1) / 0.89999998), 0.0, 1.0));
float _webgl_f9e6b653e88bbbd4 = {0.0};
if ((_webgl_d3c67f8a9763abfa <= _webgl_966a3add4cf69c50.x))
{
(_webgl_f9e6b653e88bbbd4 = 1.0);
}
else
{
(_webgl_f9e6b653e88bbbd4 = _webgl_36ae7d52fd3a7b32);
}
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * _webgl_f9e6b653e88bbbd4));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 + (_webgl_9251dcdacdfa452 * _webgl_9033605868862920)));
float _webgl_3e1e07a5d3186e64 = {0.0};
(_webgl_3e1e07a5d3186e64 = exp2((_webgl_8e684f5904e88831 * 11.0)));
float _webgl_ae66eb76b3cbc304 = {0.0};
(_webgl_ae66eb76b3cbc304 = max((_webgl_3e1e07a5d3186e64 * lerp(1.0, (1.0 / (1.0 + (_webgl_3e1e07a5d3186e64 * ((1.0 / clamp(sqrt(dot(_webgl_f28d072c82c61bea, _webgl_f28d072c82c61bea)), 0.0, 1.0)) - 1.0)))), _webgl_c72812b39ae458b)), 9.9999997e-05));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * ((pow(max(dot(normalize(((-_webgl_b59ec816fb13ac1d) + _webgl_dbb0b86db3589565)), _webgl_d189f73da6eb4d5b), 0.0), _webgl_ae66eb76b3cbc304) * (_webgl_ae66eb76b3cbc304 + 2.0)) / 8.0)));
(_webgl_3d74e5997dd7c222 = (_webgl_3d74e5997dd7c222 + (_webgl_9251dcdacdfa452 * _webgl_9033605868862920)));
}
(_webgl_3d74e5997dd7c222 = (_webgl_3d74e5997dd7c222 * _webgl_f26380f436f82532));
(_webgl_9d2f5706d0aa9ead = (_webgl_82fa7c9f93cc7839 * _webgl_f26380f436f82532));
float3 _webgl_f86278d0c757c147 = {0.0, 0.0, 0.0};
(_webgl_f86278d0c757c147 = lerp((_webgl_d7c0aae5deddf4ea * _webgl_540f7c123bdf52c0), (_webgl_3d74e5997dd7c222 + (_webgl_9d2f5706d0aa9ead.xyz * _webgl_9d2f5706d0aa9ead.w)), _webgl_acb134d5a49c2148));
(out_webgl_9b98566002e557b5.xyz = _webgl_f86278d0c757c147);
(out_webgl_9b98566002e557b5.xyz = (out_webgl_9b98566002e557b5.xyz + (pow(clamp(_webgl_e5253e8e18397069.xyz, float3(0.0, 0.0, 0.0), float3(1.0, 1.0, 1.0)), float3(2.2, 2.2, 2.2)) * _webgl_2d459f8069f64681)));
float3 _webgl_630dd71949843d37 = {0.0, 0.0, 0.0};
(_webgl_630dd71949843d37 = (_webgl_5c81bf65ffac0762 - _webgl_35c9514d594e36f3));
(out_webgl_9b98566002e557b5.xyz = lerp(_webgl_3b3710b9db4788a7, out_webgl_9b98566002e557b5.xyz, clamp(exp(((-sqrt(dot(_webgl_630dd71949843d37, _webgl_630dd71949843d37))) * _webgl_5985a6d987efdfc3)), 0.0, 1.0)));
(out_webgl_9b98566002e557b5.xyz = out_webgl_9b98566002e557b5.xyz);
(out_webgl_9b98566002e557b5.xyz = out_webgl_9b98566002e557b5.xyz);
(out_webgl_9b98566002e557b5.w = 1.0);
(out_webgl_9b98566002e557b5.x += 0.82927585);
}
void f_initGlobals()
{
(_webgl_9d2f5706d0aa9ead = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_d7c0aae5deddf4ea = float3(0.0, 0.0, 0.0));
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
    float4 gl_Position : TEXCOORD7;
    float4 v0 : TEXCOORD0;
    float3 v1 : TEXCOORD1;
    float3 v2 : TEXCOORD2;
    float3 v3 : TEXCOORD3;
    float3 v4 : TEXCOORD4;
    float2 v5 : TEXCOORD5;
    float2 v6 : TEXCOORD6;
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
    _webgl_e5253e8e18397069 = input.v0;
    _webgl_5c81bf65ffac0762 = input.v1.xyz;
    _webgl_6580760fc7b305a7 = input.v2.xyz;
    _webgl_6ccc0e73d2b9d4de = input.v3.xyz;
    _webgl_cc88c95a9917294 = input.v4.xyz;
    _webgl_a0b62b4d8ddcd62b = input.v5.xy;
    _webgl_c381ead4a4662b4a = input.v6.xy;

    gl_main();

    return generateOutput();
}

