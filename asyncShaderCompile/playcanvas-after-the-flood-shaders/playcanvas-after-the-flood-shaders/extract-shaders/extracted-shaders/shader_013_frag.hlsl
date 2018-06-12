
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
uniform float4x4 _webgl_80ac1a8d68a70197 : register(c13);
uniform float4 _webgl_41a0cad7d2087d04 : register(c17);
uniform float3 _webgl_3b3710b9db4788a7 : register(c18);
uniform float _webgl_5985a6d987efdfc3 : register(c19);
uniform float3 _webgl_2d459f8069f64681 : register(c20);
uniform float3 _webgl_e2179ae4f2cb06c9 : register(c21);
uniform float _webgl_508641f47c99a2ed : register(c22);
uniform float _webgl_7ae668e5b64ca8de : register(c23);
static const uint _webgl_b153a7264c2e8600 = 0;
static const uint _webgl_92406ab4e48f953a = 1;
static const uint _webgl_b15f7cf9d8241198 = 2;
uniform Texture2D<float4> textures2D[3] : register(t0);
uniform SamplerState samplers2D[3] : register(s0);
static const uint _webgl_e2d4935665806094 = 3;
static const uint _webgl_6d18ad23908e287 = 4;
static const uint _webgl_6666018523ec4102 = 5;
static const uint _webgl_f40e146fb06e4a34 = 6;
static const uint _webgl_340f351c4a4314aa = 7;
static const uint _webgl_7b5e6932dac63e22 = 8;
static const uint textureIndexOffsetCube = 3;
static const uint samplerIndexOffsetCube = 3;
uniform TextureCube<float4> texturesCube[6] : register(t3);
uniform SamplerState samplersCube[6] : register(s3);
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
    SamplerMetadata samplerMetadata[9] : packoffset(c4);
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
float3 _webgl_822b69d8b2db705f = {0.0, 0.0, 0.0};
(_webgl_822b69d8b2db705f = normalize(_webgl_cc88c95a9917294));
float3 _webgl_f28d072c82c61bea = {0.0, 0.0, 0.0};
(_webgl_f28d072c82c61bea = normalize(((2.0 * (dot(_webgl_822b69d8b2db705f, _webgl_dbb0b86db3589565) * _webgl_822b69d8b2db705f)) - _webgl_dbb0b86db3589565)));
float4 _webgl_be24a26eb209eebe = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_3c71294eb0cb894e = {0.0, 0.0, 0.0, 0.0};
(_webgl_3c71294eb0cb894e = gl_texture2D(_webgl_92406ab4e48f953a, _webgl_a0b62b4d8ddcd62b));
(_webgl_be24a26eb209eebe.w = _webgl_3c71294eb0cb894e.w);
(_webgl_be24a26eb209eebe.xyz = pow(_webgl_3c71294eb0cb894e.xyz, float3(2.2, 2.2, 2.2)));
(_webgl_8e684f5904e88831 = (_webgl_508641f47c99a2ed + 1e-07));
float _webgl_b2013f979b48b8cc = {0.0};
float _webgl_cfb863ec5a9ad847 = {0.0};
(_webgl_cfb863ec5a9ad847 = (1.0 - max(dot(_webgl_822b69d8b2db705f, _webgl_dbb0b86db3589565), 0.0)));
float _webgl_5ccca921d933644d = {0.0};
(_webgl_5ccca921d933644d = (_webgl_cfb863ec5a9ad847 * _webgl_cfb863ec5a9ad847));
(_webgl_b2013f979b48b8cc = (_webgl_cfb863ec5a9ad847 * (_webgl_5ccca921d933644d * _webgl_5ccca921d933644d)));
(_webgl_b2013f979b48b8cc = (_webgl_b2013f979b48b8cc * (_webgl_8e684f5904e88831 * _webgl_8e684f5904e88831)));
(_webgl_acb134d5a49c2148 = (_webgl_e2179ae4f2cb06c9 + ((1.0 - _webgl_e2179ae4f2cb06c9) * _webgl_b2013f979b48b8cc)));
float3 _webgl_2b1e8daa696cc2db = {0.0, 0.0, 0.0};
float3 _webgl_43bf859b98d2899b = {0.0, 0.0, 0.0};
(_webgl_43bf859b98d2899b = _webgl_822b69d8b2db705f);
float _webgl_73ad0cb88cd907dd = {0.0};
(_webgl_73ad0cb88cd907dd = max(max(abs(_webgl_822b69d8b2db705f.x), abs(_webgl_822b69d8b2db705f.y)), abs(_webgl_822b69d8b2db705f.z)));
float _webgl_4879e67e5ac43730 = {0.0};
(_webgl_4879e67e5ac43730 = abs(_webgl_822b69d8b2db705f.x));
if ((_webgl_4879e67e5ac43730 != _webgl_73ad0cb88cd907dd))
{
(_webgl_43bf859b98d2899b.x = (_webgl_822b69d8b2db705f.x * 0.75));
}
float _webgl_e25c9b31409332e8 = {0.0};
(_webgl_e25c9b31409332e8 = abs(_webgl_822b69d8b2db705f.y));
if ((_webgl_e25c9b31409332e8 != _webgl_73ad0cb88cd907dd))
{
(_webgl_43bf859b98d2899b.y = (_webgl_822b69d8b2db705f.y * 0.75));
}
float _webgl_91c6fbb789786f97 = {0.0};
(_webgl_91c6fbb789786f97 = abs(_webgl_822b69d8b2db705f.z));
if ((_webgl_91c6fbb789786f97 != _webgl_73ad0cb88cd907dd))
{
(_webgl_43bf859b98d2899b.z = (_webgl_822b69d8b2db705f.z * 0.75));
}
(_webgl_2b1e8daa696cc2db.yz = _webgl_43bf859b98d2899b.yz);
(_webgl_2b1e8daa696cc2db.x = (-_webgl_43bf859b98d2899b.x));
float4 _webgl_9e247bb82e5c20e0 = {0.0, 0.0, 0.0, 0.0};
(_webgl_9e247bb82e5c20e0 = gl_textureCube(_webgl_7b5e6932dac63e22, _webgl_2b1e8daa696cc2db));
float3 _webgl_3489059248406aa1 = {0.0, 0.0, 0.0};
float3 _webgl_9086f39b9ec20200 = {0.0, 0.0, 0.0};
(_webgl_9086f39b9ec20200 = ((8.0 * _webgl_9e247bb82e5c20e0.w) * _webgl_9e247bb82e5c20e0.xyz));
(_webgl_3489059248406aa1 = (_webgl_9086f39b9ec20200 * _webgl_9086f39b9ec20200));
(_webgl_540f7c123bdf52c0 = _webgl_3489059248406aa1);
float4 _webgl_9dff964f77790a37 = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_22aa7f46c5a5279e = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_56687c5f20e1bb9b[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
float3 _webgl_d74e699f9196c43d = {0.0, 0.0, 0.0};
int _webgl_fb2dfde98bfc0c7b = {0};
int _webgl_3d19be34fc9e4730 = {0};
float _webgl_dad807c3e946fcc4 = {0.0};
(_webgl_dad807c3e946fcc4 = (clamp((1.0 - _webgl_8e684f5904e88831), 0.0, 1.0) * 5.0));
(_webgl_3d19be34fc9e4730 = int_ctor(_webgl_dad807c3e946fcc4));
(_webgl_fb2dfde98bfc0c7b = int_ctor(min((_webgl_dad807c3e946fcc4 + 1.0), 7.0)));
float3 _webgl_fadafae72f159a22 = {0.0, 0.0, 0.0};
(_webgl_fadafae72f159a22 = _webgl_f28d072c82c61bea);
float _webgl_85f7bf17706eab85 = {0.0};
(_webgl_85f7bf17706eab85 = (1.0 - (exp2(_webgl_dad807c3e946fcc4) / 128.0)));
float _webgl_5cfd34df9dcb15f5 = {0.0};
(_webgl_5cfd34df9dcb15f5 = max(max(abs(_webgl_f28d072c82c61bea.x), abs(_webgl_f28d072c82c61bea.y)), abs(_webgl_f28d072c82c61bea.z)));
float _webgl_cfe4f407d6834756 = {0.0};
(_webgl_cfe4f407d6834756 = abs(_webgl_f28d072c82c61bea.x));
if ((_webgl_cfe4f407d6834756 != _webgl_5cfd34df9dcb15f5))
{
(_webgl_fadafae72f159a22.x = (_webgl_f28d072c82c61bea.x * _webgl_85f7bf17706eab85));
}
float _webgl_8eabcbad90e5f7cf = {0.0};
(_webgl_8eabcbad90e5f7cf = abs(_webgl_f28d072c82c61bea.y));
if ((_webgl_8eabcbad90e5f7cf != _webgl_5cfd34df9dcb15f5))
{
(_webgl_fadafae72f159a22.y = (_webgl_f28d072c82c61bea.y * _webgl_85f7bf17706eab85));
}
float _webgl_45bc8ea7e5f7a77c = {0.0};
(_webgl_45bc8ea7e5f7a77c = abs(_webgl_f28d072c82c61bea.z));
if ((_webgl_45bc8ea7e5f7a77c != _webgl_5cfd34df9dcb15f5))
{
(_webgl_fadafae72f159a22.z = (_webgl_f28d072c82c61bea.z * _webgl_85f7bf17706eab85));
}
(_webgl_d74e699f9196c43d.yz = _webgl_fadafae72f159a22.yz);
(_webgl_d74e699f9196c43d.x = (-_webgl_fadafae72f159a22.x));
(_webgl_56687c5f20e1bb9b[0] = gl_textureCube(_webgl_e2d4935665806094, _webgl_d74e699f9196c43d));
(_webgl_56687c5f20e1bb9b[1] = gl_textureCube(_webgl_6d18ad23908e287, _webgl_d74e699f9196c43d));
(_webgl_56687c5f20e1bb9b[2] = gl_textureCube(_webgl_6666018523ec4102, _webgl_d74e699f9196c43d));
(_webgl_56687c5f20e1bb9b[3] = gl_textureCube(_webgl_f40e146fb06e4a34, _webgl_d74e699f9196c43d));
(_webgl_56687c5f20e1bb9b[4] = gl_textureCube(_webgl_340f351c4a4314aa, _webgl_d74e699f9196c43d));
(_webgl_56687c5f20e1bb9b[5] = gl_textureCube(_webgl_7b5e6932dac63e22, _webgl_d74e699f9196c43d));
{ for(int _webgl_3d90e73d0198c1a0 = {0}; (_webgl_3d90e73d0198c1a0 < 6); (_webgl_3d90e73d0198c1a0++))
{
if ((_webgl_3d90e73d0198c1a0 == _webgl_3d19be34fc9e4730))
{
(_webgl_9dff964f77790a37 = _webgl_56687c5f20e1bb9b[int_ctor(clamp(float_ctor(_webgl_3d90e73d0198c1a0), 0.0, 5.0))]);
}
if ((_webgl_3d90e73d0198c1a0 == _webgl_fb2dfde98bfc0c7b))
{
(_webgl_22aa7f46c5a5279e = _webgl_56687c5f20e1bb9b[int_ctor(clamp(float_ctor(_webgl_3d90e73d0198c1a0), 0.0, 5.0))]);
}
}
}
float4 _webgl_d7a381f02878b408 = {0.0, 0.0, 0.0, 0.0};
(_webgl_d7a381f02878b408 = lerp(_webgl_9dff964f77790a37, _webgl_22aa7f46c5a5279e, frac(_webgl_dad807c3e946fcc4)));
float3 _webgl_1e0a569fa8d323c5 = {0.0, 0.0, 0.0};
(_webgl_1e0a569fa8d323c5 = ((8.0 * _webgl_d7a381f02878b408.w) * _webgl_d7a381f02878b408.xyz));
float4 _webgl_6b1576cc49ca380b = {0.0, 0.0, 0.0, 0.0};
(_webgl_6b1576cc49ca380b.xyz = (_webgl_1e0a569fa8d323c5 * _webgl_1e0a569fa8d323c5));
(_webgl_6b1576cc49ca380b.w = _webgl_7ae668e5b64ca8de);
(_webgl_11482133dc10ada = (_webgl_5c81bf65ffac0762 - _webgl_16d8e27babe3e15e));
float3 _webgl_82fa7c9f93cc7839 = {0.0, 0.0, 0.0};
(_webgl_82fa7c9f93cc7839 = normalize(_webgl_11482133dc10ada));
float _webgl_5068bdf2b9363df1 = {0.0};
float _webgl_bc517a070a88ef4a = {0.0};
(_webgl_bc517a070a88ef4a = dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada));
float _webgl_a5cbea098f008107 = {0.0};
(_webgl_a5cbea098f008107 = (1.0 / _webgl_1a380463a8bc7359));
(_webgl_5068bdf2b9363df1 = ((1.0 / (_webgl_bc517a070a88ef4a + 1.0)) * 16.0));
float _webgl_ffe8055874f3ce2b = {0.0};
(_webgl_ffe8055874f3ce2b = (_webgl_bc517a070a88ef4a * (_webgl_a5cbea098f008107 * _webgl_a5cbea098f008107)));
float _webgl_a2ea1ce929cac431 = {0.0};
(_webgl_a2ea1ce929cac431 = clamp((1.0 - (_webgl_ffe8055874f3ce2b * _webgl_ffe8055874f3ce2b)), 0.0, 1.0));
(_webgl_5068bdf2b9363df1 = (_webgl_5068bdf2b9363df1 * (_webgl_a2ea1ce929cac431 * _webgl_a2ea1ce929cac431)));
(_webgl_9251dcdacdfa452 = _webgl_5068bdf2b9363df1);
if ((_webgl_5068bdf2b9363df1 > 9.9999997e-06))
{
float _webgl_d3a0349fad6621fb = {0.0};
(_webgl_d3a0349fad6621fb = clamp(((dot(_webgl_82fa7c9f93cc7839, _webgl_35202d7eed2427d) - _webgl_755af7149e45828a) / (_webgl_2dd2385497bef344 - _webgl_755af7149e45828a)), 0.0, 1.0));
(_webgl_9251dcdacdfa452 = (_webgl_5068bdf2b9363df1 * (_webgl_d3a0349fad6621fb * (_webgl_d3a0349fad6621fb * (3.0 - (2.0 * _webgl_d3a0349fad6621fb))))));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * max(dot(_webgl_822b69d8b2db705f, (-_webgl_82fa7c9f93cc7839)), 0.0)));
(_webgl_540f7c123bdf52c0 = (_webgl_3489059248406aa1 + (_webgl_9251dcdacdfa452 * _webgl_1855da97c0758e43)));
float _webgl_48742813565ac55d = {0.0};
(_webgl_48742813565ac55d = max(exp2((_webgl_8e684f5904e88831 * 11.0)), 9.9999997e-05));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * ((pow(max(dot(normalize(((-_webgl_82fa7c9f93cc7839) + _webgl_dbb0b86db3589565)), _webgl_822b69d8b2db705f), 0.0), _webgl_48742813565ac55d) * (_webgl_48742813565ac55d + 2.0)) / 8.0)));
(_webgl_3d74e5997dd7c222 = (_webgl_9251dcdacdfa452 * _webgl_1855da97c0758e43));
}
(_webgl_11482133dc10ada = (_webgl_5c81bf65ffac0762 - _webgl_71e3cad5e42a89bb));
float3 _webgl_f05a73b03fcb4961 = {0.0, 0.0, 0.0};
(_webgl_f05a73b03fcb4961 = normalize(_webgl_11482133dc10ada));
float _webgl_8df08a4bef98c98e = {0.0};
float _webgl_6cd3ea4a4d7f2e24 = {0.0};
(_webgl_6cd3ea4a4d7f2e24 = dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada));
float _webgl_17eaf291e44ff974 = {0.0};
(_webgl_17eaf291e44ff974 = (1.0 / _webgl_1c82dc879cda6ae2));
(_webgl_8df08a4bef98c98e = ((1.0 / (_webgl_6cd3ea4a4d7f2e24 + 1.0)) * 16.0));
float _webgl_6ddffca124929452 = {0.0};
(_webgl_6ddffca124929452 = (_webgl_6cd3ea4a4d7f2e24 * (_webgl_17eaf291e44ff974 * _webgl_17eaf291e44ff974)));
float _webgl_6845b595a6db2b36 = {0.0};
(_webgl_6845b595a6db2b36 = clamp((1.0 - (_webgl_6ddffca124929452 * _webgl_6ddffca124929452)), 0.0, 1.0));
(_webgl_8df08a4bef98c98e = (_webgl_8df08a4bef98c98e * (_webgl_6845b595a6db2b36 * _webgl_6845b595a6db2b36)));
(_webgl_9251dcdacdfa452 = _webgl_8df08a4bef98c98e);
if ((_webgl_8df08a4bef98c98e > 9.9999997e-06))
{
float _webgl_40d3fc5bec147c69 = {0.0};
(_webgl_40d3fc5bec147c69 = clamp(((dot(_webgl_f05a73b03fcb4961, _webgl_a8a39767ea2c8eb7) - _webgl_34ab7d99e8e69aa4) / (_webgl_e6010fd023fb284f - _webgl_34ab7d99e8e69aa4)), 0.0, 1.0));
(_webgl_9251dcdacdfa452 = (_webgl_8df08a4bef98c98e * (_webgl_40d3fc5bec147c69 * (_webgl_40d3fc5bec147c69 * (3.0 - (2.0 * _webgl_40d3fc5bec147c69))))));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * max(dot(_webgl_822b69d8b2db705f, (-_webgl_f05a73b03fcb4961)), 0.0)));
float4 _webgl_5c0e44922e86c9ef = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_8a1c983d2a5521d3 = {0.0, 0.0, 0.0, 0.0};
(_webgl_8a1c983d2a5521d3.w = 1.0);
(_webgl_8a1c983d2a5521d3.xyz = _webgl_5c81bf65ffac0762);
float4 _webgl_a8edb34b463f3ac3 = {0.0, 0.0, 0.0, 0.0};
(_webgl_a8edb34b463f3ac3 = mul(transpose(_webgl_80ac1a8d68a70197), _webgl_8a1c983d2a5521d3));
(_webgl_5c0e44922e86c9ef.zw = _webgl_a8edb34b463f3ac3.zw);
(_webgl_5c0e44922e86c9ef.xy = (_webgl_a8edb34b463f3ac3.xy / _webgl_a8edb34b463f3ac3.w));
float _webgl_49881e8ea3681cd = {0.0};
(_webgl_49881e8ea3681cd = ((sqrt(dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada)) * _webgl_41a0cad7d2087d04.w) + _webgl_41a0cad7d2087d04.z));
float4 _webgl_24698dc60b28d11 = {0.0, 0.0, 0.0, 0.0};
(_webgl_24698dc60b28d11 = gl_texture2D(_webgl_b153a7264c2e8600, _webgl_5c0e44922e86c9ef.xy));
float3 _webgl_61c6aec6c44642a1 = {0.0, 0.0, 0.0};
(_webgl_61c6aec6c44642a1.z = 0.0);
(_webgl_61c6aec6c44642a1.x = ((_webgl_24698dc60b28d11.y * 0.0039215689) + _webgl_24698dc60b28d11.x));
(_webgl_61c6aec6c44642a1.y = ((_webgl_24698dc60b28d11.w * 0.0039215689) + _webgl_24698dc60b28d11.z));
float _webgl_af838643f97a28e8 = {0.0};
(_webgl_af838643f97a28e8 = (_webgl_41a0cad7d2087d04.y * _webgl_49881e8ea3681cd));
float _webgl_b3646d04812e7a4a = {0.0};
(_webgl_b3646d04812e7a4a = max((_webgl_61c6aec6c44642a1.y - (_webgl_61c6aec6c44642a1.x * _webgl_61c6aec6c44642a1.x)), (_webgl_af838643f97a28e8 * _webgl_af838643f97a28e8)));
float _webgl_7edc71e79ab928c1 = {0.0};
(_webgl_7edc71e79ab928c1 = (_webgl_49881e8ea3681cd - _webgl_61c6aec6c44642a1.x));
float _webgl_8badbc4aa9205681 = {0.0};
(_webgl_8badbc4aa9205681 = clamp((((_webgl_b3646d04812e7a4a / (_webgl_b3646d04812e7a4a + (_webgl_7edc71e79ab928c1 * _webgl_7edc71e79ab928c1))) - 0.1) / 0.89999998), 0.0, 1.0));
float _webgl_e760ed8adca1c9c3 = {0.0};
if ((_webgl_49881e8ea3681cd <= _webgl_61c6aec6c44642a1.x))
{
(_webgl_e760ed8adca1c9c3 = 1.0);
}
else
{
(_webgl_e760ed8adca1c9c3 = _webgl_8badbc4aa9205681);
}
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * _webgl_e760ed8adca1c9c3));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 + (_webgl_9251dcdacdfa452 * _webgl_10617a1597481d62)));
float _webgl_80f9c2f994f34f1e = {0.0};
(_webgl_80f9c2f994f34f1e = max(exp2((_webgl_8e684f5904e88831 * 11.0)), 9.9999997e-05));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * ((pow(max(dot(normalize(((-_webgl_f05a73b03fcb4961) + _webgl_dbb0b86db3589565)), _webgl_822b69d8b2db705f), 0.0), _webgl_80f9c2f994f34f1e) * (_webgl_80f9c2f994f34f1e + 2.0)) / 8.0)));
(_webgl_3d74e5997dd7c222 = (_webgl_3d74e5997dd7c222 + (_webgl_9251dcdacdfa452 * _webgl_10617a1597481d62)));
}
float3 _webgl_6a9bcb091df1cdf6 = {0.0, 0.0, 0.0};
(_webgl_6a9bcb091df1cdf6 = lerp((_webgl_be24a26eb209eebe.xyz * _webgl_540f7c123bdf52c0), (_webgl_3d74e5997dd7c222 + (_webgl_6b1576cc49ca380b.xyz * _webgl_7ae668e5b64ca8de)), _webgl_acb134d5a49c2148));
(out_webgl_9b98566002e557b5.xyz = _webgl_6a9bcb091df1cdf6);
float3 _webgl_a52374383578cc70 = {0.0, 0.0, 0.0};
float4 _webgl_b9284b17e758fcda = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_56077667bfd6d861 = {0.0, 0.0, 0.0, 0.0};
(_webgl_56077667bfd6d861 = gl_texture2D(_webgl_b15f7cf9d8241198, _webgl_a0b62b4d8ddcd62b));
(_webgl_b9284b17e758fcda.w = _webgl_56077667bfd6d861.w);
(_webgl_b9284b17e758fcda.xyz = pow(_webgl_56077667bfd6d861.xyz, float3(2.2, 2.2, 2.2)));
(_webgl_a52374383578cc70 = (_webgl_b9284b17e758fcda.yyy * _webgl_2d459f8069f64681));
(out_webgl_9b98566002e557b5.xyz = (out_webgl_9b98566002e557b5.xyz + _webgl_a52374383578cc70));
float3 _webgl_b190a86bc7f938d2 = {0.0, 0.0, 0.0};
(_webgl_b190a86bc7f938d2 = (_webgl_5c81bf65ffac0762 - _webgl_35c9514d594e36f3));
(out_webgl_9b98566002e557b5.xyz = lerp(_webgl_3b3710b9db4788a7, out_webgl_9b98566002e557b5.xyz, clamp(exp(((-sqrt(dot(_webgl_b190a86bc7f938d2, _webgl_b190a86bc7f938d2))) * _webgl_5985a6d987efdfc3)), 0.0, 1.0)));
(out_webgl_9b98566002e557b5.xyz = out_webgl_9b98566002e557b5.xyz);
(out_webgl_9b98566002e557b5.xyz = out_webgl_9b98566002e557b5.xyz);
(out_webgl_9b98566002e557b5.w = 1.0);
(out_webgl_9b98566002e557b5.x += 0.48564339);
}
void f_initGlobals()
{
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

