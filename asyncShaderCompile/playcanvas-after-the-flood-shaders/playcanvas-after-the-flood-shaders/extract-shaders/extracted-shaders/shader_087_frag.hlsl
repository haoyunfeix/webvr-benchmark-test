
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
uniform float3 _webgl_10617a1597481d62 : register(c12);
uniform float3 _webgl_71e3cad5e42a89bb : register(c13);
uniform float _webgl_1c82dc879cda6ae2 : register(c14);
uniform float3 _webgl_a8a39767ea2c8eb7 : register(c15);
uniform float _webgl_e6010fd023fb284f : register(c16);
uniform float _webgl_34ab7d99e8e69aa4 : register(c17);
uniform float4x4 _webgl_80ac1a8d68a70197 : register(c18);
uniform float4 _webgl_41a0cad7d2087d04 : register(c22);
uniform float3 _webgl_3b3710b9db4788a7 : register(c23);
uniform float _webgl_5985a6d987efdfc3 : register(c24);
uniform float3 _webgl_2d459f8069f64681 : register(c25);
uniform float _webgl_c0eb2e332cfac9bd : register(c26);
uniform float _webgl_508641f47c99a2ed : register(c27);
uniform float _webgl_7ae668e5b64ca8de : register(c28);
static const uint _webgl_75db1bbd4bda93ec = 0;
static const uint _webgl_b153a7264c2e8600 = 1;
static const uint _webgl_92406ab4e48f953a = 2;
static const uint _webgl_c3b0765d5df09e72 = 3;
uniform Texture2D<float4> textures2D[4] : register(t0);
uniform SamplerState samplers2D[4] : register(s0);
static const uint _webgl_e2d4935665806094 = 4;
static const uint _webgl_6d18ad23908e287 = 5;
static const uint _webgl_6666018523ec4102 = 6;
static const uint _webgl_f40e146fb06e4a34 = 7;
static const uint _webgl_340f351c4a4314aa = 8;
static const uint _webgl_7b5e6932dac63e22 = 9;
static const uint textureIndexOffsetCube = 4;
static const uint samplerIndexOffsetCube = 4;
uniform TextureCube<float4> texturesCube[6] : register(t4);
uniform SamplerState samplersCube[6] : register(s4);
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
    SamplerMetadata samplerMetadata[10] : packoffset(c4);
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
float3 _webgl_dbb0b86db3589565 = {0.0, 0.0, 0.0};
(_webgl_dbb0b86db3589565 = normalize((_webgl_35c9514d594e36f3 - _webgl_5c81bf65ffac0762)));
float3 _webgl_822b69d8b2db705f = {0.0, 0.0, 0.0};
(_webgl_822b69d8b2db705f = normalize(_webgl_cc88c95a9917294));
float3 _webgl_f28d072c82c61bea = {0.0, 0.0, 0.0};
(_webgl_f28d072c82c61bea = normalize(((2.0 * (dot(_webgl_822b69d8b2db705f, _webgl_dbb0b86db3589565) * _webgl_822b69d8b2db705f)) - _webgl_dbb0b86db3589565)));
float4 _webgl_be24a26eb209eebe = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_3c71294eb0cb894e = {0.0, 0.0, 0.0, 0.0};
(_webgl_3c71294eb0cb894e = gl_texture2D(_webgl_92406ab4e48f953a, _webgl_a0b62b4d8ddcd62b));
(_webgl_be24a26eb209eebe.w = _webgl_3c71294eb0cb894e.w);
(_webgl_be24a26eb209eebe.xyz = pow(_webgl_3c71294eb0cb894e.xyz, float3(2.2, 2.2, 2.2)));
float3 _webgl_8f7cfeb5dfbf859 = {0.0, 0.0, 0.0};
(_webgl_8f7cfeb5dfbf859 = lerp(float3(0.039999999, 0.039999999, 0.039999999), _webgl_be24a26eb209eebe.xyz, _webgl_c0eb2e332cfac9bd));
(_webgl_d7c0aae5deddf4ea = (_webgl_be24a26eb209eebe.xyz * (1.0 - _webgl_c0eb2e332cfac9bd)));
(_webgl_8e684f5904e88831 = (_webgl_508641f47c99a2ed + 1e-07));
float _webgl_5bb1df3cce7be69e = {0.0};
float _webgl_5ccca921d933644d = {0.0};
(_webgl_5ccca921d933644d = (1.0 - max(dot(_webgl_822b69d8b2db705f, _webgl_dbb0b86db3589565), 0.0)));
float _webgl_46665ba4a0ebb347 = {0.0};
(_webgl_46665ba4a0ebb347 = (_webgl_5ccca921d933644d * _webgl_5ccca921d933644d));
(_webgl_5bb1df3cce7be69e = (_webgl_5ccca921d933644d * (_webgl_46665ba4a0ebb347 * _webgl_46665ba4a0ebb347)));
(_webgl_5bb1df3cce7be69e = (_webgl_5bb1df3cce7be69e * (_webgl_8e684f5904e88831 * _webgl_8e684f5904e88831)));
(_webgl_acb134d5a49c2148 = (_webgl_8f7cfeb5dfbf859 + ((1.0 - _webgl_8f7cfeb5dfbf859) * _webgl_5bb1df3cce7be69e)));
float3 _webgl_5f15f0a0134f3a31 = {0.0, 0.0, 0.0};
float3 _webgl_b8606988d9392e2a = {0.0, 0.0, 0.0};
(_webgl_b8606988d9392e2a = _webgl_822b69d8b2db705f);
float _webgl_4879e67e5ac43730 = {0.0};
(_webgl_4879e67e5ac43730 = max(max(abs(_webgl_822b69d8b2db705f.x), abs(_webgl_822b69d8b2db705f.y)), abs(_webgl_822b69d8b2db705f.z)));
float _webgl_e25c9b31409332e8 = {0.0};
(_webgl_e25c9b31409332e8 = abs(_webgl_822b69d8b2db705f.x));
if ((_webgl_e25c9b31409332e8 != _webgl_4879e67e5ac43730))
{
(_webgl_b8606988d9392e2a.x = (_webgl_822b69d8b2db705f.x * 0.75));
}
float _webgl_91c6fbb789786f97 = {0.0};
(_webgl_91c6fbb789786f97 = abs(_webgl_822b69d8b2db705f.y));
if ((_webgl_91c6fbb789786f97 != _webgl_4879e67e5ac43730))
{
(_webgl_b8606988d9392e2a.y = (_webgl_822b69d8b2db705f.y * 0.75));
}
float _webgl_9e247bb82e5c20e0 = {0.0};
(_webgl_9e247bb82e5c20e0 = abs(_webgl_822b69d8b2db705f.z));
if ((_webgl_9e247bb82e5c20e0 != _webgl_4879e67e5ac43730))
{
(_webgl_b8606988d9392e2a.z = (_webgl_822b69d8b2db705f.z * 0.75));
}
(_webgl_5f15f0a0134f3a31.yz = _webgl_b8606988d9392e2a.yz);
(_webgl_5f15f0a0134f3a31.x = (-_webgl_b8606988d9392e2a.x));
float4 _webgl_3489059248406aa1 = {0.0, 0.0, 0.0, 0.0};
(_webgl_3489059248406aa1 = gl_textureCube(_webgl_7b5e6932dac63e22, _webgl_5f15f0a0134f3a31));
float3 _webgl_9086f39b9ec20200 = {0.0, 0.0, 0.0};
(_webgl_9086f39b9ec20200 = ((8.0 * _webgl_3489059248406aa1.w) * _webgl_3489059248406aa1.xyz));
float4 _webgl_f26380f436f82532 = {0.0, 0.0, 0.0, 0.0};
(_webgl_f26380f436f82532 = gl_texture2D(_webgl_c3b0765d5df09e72, _webgl_a0b62b4d8ddcd62b));
(_webgl_540f7c123bdf52c0 = ((_webgl_9086f39b9ec20200 * _webgl_9086f39b9ec20200) * _webgl_f26380f436f82532.x));
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
(_webgl_708bf5ae40e1493 = _webgl_f28d072c82c61bea);
float _webgl_5cfd34df9dcb15f5 = {0.0};
(_webgl_5cfd34df9dcb15f5 = (1.0 - (exp2(_webgl_4a69825d2061f2e4) / 128.0)));
float _webgl_cfe4f407d6834756 = {0.0};
(_webgl_cfe4f407d6834756 = max(max(abs(_webgl_f28d072c82c61bea.x), abs(_webgl_f28d072c82c61bea.y)), abs(_webgl_f28d072c82c61bea.z)));
float _webgl_8eabcbad90e5f7cf = {0.0};
(_webgl_8eabcbad90e5f7cf = abs(_webgl_f28d072c82c61bea.x));
if ((_webgl_8eabcbad90e5f7cf != _webgl_cfe4f407d6834756))
{
(_webgl_708bf5ae40e1493.x = (_webgl_f28d072c82c61bea.x * _webgl_5cfd34df9dcb15f5));
}
float _webgl_45bc8ea7e5f7a77c = {0.0};
(_webgl_45bc8ea7e5f7a77c = abs(_webgl_f28d072c82c61bea.y));
if ((_webgl_45bc8ea7e5f7a77c != _webgl_cfe4f407d6834756))
{
(_webgl_708bf5ae40e1493.y = (_webgl_f28d072c82c61bea.y * _webgl_5cfd34df9dcb15f5));
}
float _webgl_d7a381f02878b408 = {0.0};
(_webgl_d7a381f02878b408 = abs(_webgl_f28d072c82c61bea.z));
if ((_webgl_d7a381f02878b408 != _webgl_cfe4f407d6834756))
{
(_webgl_708bf5ae40e1493.z = (_webgl_f28d072c82c61bea.z * _webgl_5cfd34df9dcb15f5));
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
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * max(dot(_webgl_822b69d8b2db705f, (-_webgl_6b8507d7c52a30c5)), 0.0)));
float4 _webgl_b9db8dad2dc9635a = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_bb4c022d8fffa1de = {0.0, 0.0, 0.0, 0.0};
(_webgl_bb4c022d8fffa1de.w = 1.0);
(_webgl_bb4c022d8fffa1de.xyz = _webgl_5c81bf65ffac0762);
float4 _webgl_6cd3ea4a4d7f2e24 = {0.0, 0.0, 0.0, 0.0};
(_webgl_6cd3ea4a4d7f2e24 = mul(transpose(_webgl_b0404067f6345e65), _webgl_bb4c022d8fffa1de));
(_webgl_b9db8dad2dc9635a.zw = _webgl_6cd3ea4a4d7f2e24.zw);
(_webgl_b9db8dad2dc9635a.xy = (_webgl_6cd3ea4a4d7f2e24.xy / _webgl_6cd3ea4a4d7f2e24.w));
float _webgl_54a168fc869f6c21 = {0.0};
(_webgl_54a168fc869f6c21 = ((sqrt(dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada)) * _webgl_6e78a9e7655aa6e8.w) + _webgl_6e78a9e7655aa6e8.z));
float4 _webgl_265b07338d1f26ef = {0.0, 0.0, 0.0, 0.0};
(_webgl_265b07338d1f26ef = gl_texture2D(_webgl_75db1bbd4bda93ec, _webgl_b9db8dad2dc9635a.xy));
float3 _webgl_6845b595a6db2b36 = {0.0, 0.0, 0.0};
(_webgl_6845b595a6db2b36.z = 0.0);
(_webgl_6845b595a6db2b36.x = ((_webgl_265b07338d1f26ef.y * 0.0039215689) + _webgl_265b07338d1f26ef.x));
(_webgl_6845b595a6db2b36.y = ((_webgl_265b07338d1f26ef.w * 0.0039215689) + _webgl_265b07338d1f26ef.z));
float _webgl_40d3fc5bec147c69 = {0.0};
(_webgl_40d3fc5bec147c69 = (_webgl_6e78a9e7655aa6e8.y * _webgl_54a168fc869f6c21));
float _webgl_dbaa033991f73c9d = {0.0};
(_webgl_dbaa033991f73c9d = max((_webgl_6845b595a6db2b36.y - (_webgl_6845b595a6db2b36.x * _webgl_6845b595a6db2b36.x)), (_webgl_40d3fc5bec147c69 * _webgl_40d3fc5bec147c69)));
float _webgl_8a1c983d2a5521d3 = {0.0};
(_webgl_8a1c983d2a5521d3 = (_webgl_54a168fc869f6c21 - _webgl_6845b595a6db2b36.x));
float _webgl_a8edb34b463f3ac3 = {0.0};
(_webgl_a8edb34b463f3ac3 = clamp((((_webgl_dbaa033991f73c9d / (_webgl_dbaa033991f73c9d + (_webgl_8a1c983d2a5521d3 * _webgl_8a1c983d2a5521d3))) - 0.1) / 0.89999998), 0.0, 1.0));
float _webgl_2ef05ecaa6259cbe = {0.0};
if ((_webgl_54a168fc869f6c21 <= _webgl_6845b595a6db2b36.x))
{
(_webgl_2ef05ecaa6259cbe = 1.0);
}
else
{
(_webgl_2ef05ecaa6259cbe = _webgl_a8edb34b463f3ac3);
}
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * _webgl_2ef05ecaa6259cbe));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 + (_webgl_9251dcdacdfa452 * _webgl_1855da97c0758e43)));
float _webgl_24698dc60b28d11 = {0.0};
(_webgl_24698dc60b28d11 = max(exp2((_webgl_8e684f5904e88831 * 11.0)), 9.9999997e-05));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * ((pow(max(dot(normalize(((-_webgl_6b8507d7c52a30c5) + _webgl_dbb0b86db3589565)), _webgl_822b69d8b2db705f), 0.0), _webgl_24698dc60b28d11) * (_webgl_24698dc60b28d11 + 2.0)) / 8.0)));
(_webgl_3d74e5997dd7c222 = (_webgl_9251dcdacdfa452 * _webgl_1855da97c0758e43));
}
(_webgl_11482133dc10ada = (_webgl_5c81bf65ffac0762 - _webgl_71e3cad5e42a89bb));
float3 _webgl_61c6aec6c44642a1 = {0.0, 0.0, 0.0};
(_webgl_61c6aec6c44642a1 = normalize(_webgl_11482133dc10ada));
float _webgl_7219b98f3a4198a9 = {0.0};
float _webgl_b3646d04812e7a4a = {0.0};
(_webgl_b3646d04812e7a4a = dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada));
float _webgl_7edc71e79ab928c1 = {0.0};
(_webgl_7edc71e79ab928c1 = (1.0 / _webgl_1c82dc879cda6ae2));
(_webgl_7219b98f3a4198a9 = ((1.0 / (_webgl_b3646d04812e7a4a + 1.0)) * 16.0));
float _webgl_44e0628c2069de55 = {0.0};
(_webgl_44e0628c2069de55 = (_webgl_b3646d04812e7a4a * (_webgl_7edc71e79ab928c1 * _webgl_7edc71e79ab928c1)));
float _webgl_e760ed8adca1c9c3 = {0.0};
(_webgl_e760ed8adca1c9c3 = clamp((1.0 - (_webgl_44e0628c2069de55 * _webgl_44e0628c2069de55)), 0.0, 1.0));
(_webgl_7219b98f3a4198a9 = (_webgl_7219b98f3a4198a9 * (_webgl_e760ed8adca1c9c3 * _webgl_e760ed8adca1c9c3)));
(_webgl_9251dcdacdfa452 = _webgl_7219b98f3a4198a9);
if ((_webgl_7219b98f3a4198a9 > 9.9999997e-06))
{
float _webgl_80f9c2f994f34f1e = {0.0};
(_webgl_80f9c2f994f34f1e = clamp(((dot(_webgl_61c6aec6c44642a1, _webgl_a8a39767ea2c8eb7) - _webgl_34ab7d99e8e69aa4) / (_webgl_e6010fd023fb284f - _webgl_34ab7d99e8e69aa4)), 0.0, 1.0));
(_webgl_9251dcdacdfa452 = (_webgl_7219b98f3a4198a9 * (_webgl_80f9c2f994f34f1e * (_webgl_80f9c2f994f34f1e * (3.0 - (2.0 * _webgl_80f9c2f994f34f1e))))));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * max(dot(_webgl_822b69d8b2db705f, (-_webgl_61c6aec6c44642a1)), 0.0)));
float4 _webgl_3efc279dde068d9d = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_a52374383578cc70 = {0.0, 0.0, 0.0, 0.0};
(_webgl_a52374383578cc70.w = 1.0);
(_webgl_a52374383578cc70.xyz = _webgl_5c81bf65ffac0762);
float4 _webgl_e47f7fad6c31aebc = {0.0, 0.0, 0.0, 0.0};
(_webgl_e47f7fad6c31aebc = mul(transpose(_webgl_80ac1a8d68a70197), _webgl_a52374383578cc70));
(_webgl_3efc279dde068d9d.zw = _webgl_e47f7fad6c31aebc.zw);
(_webgl_3efc279dde068d9d.xy = (_webgl_e47f7fad6c31aebc.xy / _webgl_e47f7fad6c31aebc.w));
float _webgl_ed69d8f0d0addaab = {0.0};
(_webgl_ed69d8f0d0addaab = ((sqrt(dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada)) * _webgl_41a0cad7d2087d04.w) + _webgl_41a0cad7d2087d04.z));
float4 _webgl_b190a86bc7f938d2 = {0.0, 0.0, 0.0, 0.0};
(_webgl_b190a86bc7f938d2 = gl_texture2D(_webgl_b153a7264c2e8600, _webgl_3efc279dde068d9d.xy));
float3 _webgl_95e254f0ea5b5564 = {0.0, 0.0, 0.0};
(_webgl_95e254f0ea5b5564.z = 0.0);
(_webgl_95e254f0ea5b5564.x = ((_webgl_b190a86bc7f938d2.y * 0.0039215689) + _webgl_b190a86bc7f938d2.x));
(_webgl_95e254f0ea5b5564.y = ((_webgl_b190a86bc7f938d2.w * 0.0039215689) + _webgl_b190a86bc7f938d2.z));
float _webgl_8e449eeb6739befe = {0.0};
(_webgl_8e449eeb6739befe = (_webgl_41a0cad7d2087d04.y * _webgl_ed69d8f0d0addaab));
float _webgl_eb9e29ad556d5876 = {0.0};
(_webgl_eb9e29ad556d5876 = max((_webgl_95e254f0ea5b5564.y - (_webgl_95e254f0ea5b5564.x * _webgl_95e254f0ea5b5564.x)), (_webgl_8e449eeb6739befe * _webgl_8e449eeb6739befe)));
float _webgl_6430cdf0dbc8e939 = {0.0};
(_webgl_6430cdf0dbc8e939 = (_webgl_ed69d8f0d0addaab - _webgl_95e254f0ea5b5564.x));
float _webgl_909dd7b8eca80202 = {0.0};
(_webgl_909dd7b8eca80202 = clamp((((_webgl_eb9e29ad556d5876 / (_webgl_eb9e29ad556d5876 + (_webgl_6430cdf0dbc8e939 * _webgl_6430cdf0dbc8e939))) - 0.1) / 0.89999998), 0.0, 1.0));
float _webgl_9090da22dad28bf7 = {0.0};
if ((_webgl_ed69d8f0d0addaab <= _webgl_95e254f0ea5b5564.x))
{
(_webgl_9090da22dad28bf7 = 1.0);
}
else
{
(_webgl_9090da22dad28bf7 = _webgl_909dd7b8eca80202);
}
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * _webgl_9090da22dad28bf7));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 + (_webgl_9251dcdacdfa452 * _webgl_10617a1597481d62)));
float _webgl_14255a09eade23c1 = {0.0};
(_webgl_14255a09eade23c1 = max(exp2((_webgl_8e684f5904e88831 * 11.0)), 9.9999997e-05));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * ((pow(max(dot(normalize(((-_webgl_61c6aec6c44642a1) + _webgl_dbb0b86db3589565)), _webgl_822b69d8b2db705f), 0.0), _webgl_14255a09eade23c1) * (_webgl_14255a09eade23c1 + 2.0)) / 8.0)));
(_webgl_3d74e5997dd7c222 = (_webgl_3d74e5997dd7c222 + (_webgl_9251dcdacdfa452 * _webgl_10617a1597481d62)));
}
(_webgl_3d74e5997dd7c222 = (_webgl_3d74e5997dd7c222 * _webgl_f26380f436f82532.x));
(_webgl_9d2f5706d0aa9ead = (_webgl_82fa7c9f93cc7839 * _webgl_f26380f436f82532.x));
float3 _webgl_4a15523e4032dda7 = {0.0, 0.0, 0.0};
(_webgl_4a15523e4032dda7 = lerp((_webgl_d7c0aae5deddf4ea * _webgl_540f7c123bdf52c0), (_webgl_3d74e5997dd7c222 + (_webgl_9d2f5706d0aa9ead.xyz * _webgl_9d2f5706d0aa9ead.w)), _webgl_acb134d5a49c2148));
(out_webgl_9b98566002e557b5.xyz = _webgl_4a15523e4032dda7);
(out_webgl_9b98566002e557b5.xyz = (out_webgl_9b98566002e557b5.xyz + _webgl_2d459f8069f64681));
float3 _webgl_1d1ddb76fbcf772a = {0.0, 0.0, 0.0};
(_webgl_1d1ddb76fbcf772a = (_webgl_5c81bf65ffac0762 - _webgl_35c9514d594e36f3));
(out_webgl_9b98566002e557b5.xyz = lerp(_webgl_3b3710b9db4788a7, out_webgl_9b98566002e557b5.xyz, clamp(exp(((-sqrt(dot(_webgl_1d1ddb76fbcf772a, _webgl_1d1ddb76fbcf772a))) * _webgl_5985a6d987efdfc3)), 0.0, 1.0)));
(out_webgl_9b98566002e557b5.xyz = out_webgl_9b98566002e557b5.xyz);
(out_webgl_9b98566002e557b5.xyz = out_webgl_9b98566002e557b5.xyz);
(out_webgl_9b98566002e557b5.w = 1.0);
(out_webgl_9b98566002e557b5.x += 0.89933336);
}
void f_initGlobals()
{
(_webgl_9d2f5706d0aa9ead = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_d7c0aae5deddf4ea = float3(0.0, 0.0, 0.0));
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

