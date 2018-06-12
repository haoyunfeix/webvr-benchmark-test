
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
uniform float _webgl_c72812b39ae458b : register(c1);
uniform float3 _webgl_3b3710b9db4788a7 : register(c2);
uniform float _webgl_5985a6d987efdfc3 : register(c3);
uniform float3 _webgl_2d459f8069f64681 : register(c4);
uniform float _webgl_c0eb2e332cfac9bd : register(c5);
uniform float _webgl_508641f47c99a2ed : register(c6);
uniform float _webgl_7ae668e5b64ca8de : register(c7);
uniform float3 _webgl_f836b86ccb55856c : register(c8);
static const uint _webgl_8167d7febf3081fa = 0;
static const uint _webgl_92406ab4e48f953a = 1;
static const uint _webgl_886520cdb034ca8e = 2;
static const uint _webgl_c3b0765d5df09e72 = 3;
static const uint _webgl_d1a7cd505ae30fad = 4;
static const uint _webgl_5c7c81c103b6fbdd = 5;
uniform Texture2D<float4> textures2D[6] : register(t0);
uniform SamplerState samplers2D[6] : register(s0);
static const uint _webgl_e2d4935665806094 = 6;
static const uint _webgl_6d18ad23908e287 = 7;
static const uint _webgl_6666018523ec4102 = 8;
static const uint _webgl_f40e146fb06e4a34 = 9;
static const uint _webgl_340f351c4a4314aa = 10;
static const uint _webgl_7b5e6932dac63e22 = 11;
static const uint textureIndexOffsetCube = 6;
static const uint samplerIndexOffsetCube = 6;
uniform TextureCube<float4> texturesCube[6] : register(t6);
uniform SamplerState samplersCube[6] : register(s6);
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
static  float2 _webgl_c381ead4a4662b4a = {0, 0};
static  float2 _webgl_a01077f60b366ad8 = {0, 0};

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
    SamplerMetadata samplerMetadata[12] : packoffset(c4);
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
static float3 _webgl_acb134d5a49c2148 = {0, 0, 0};
static float _webgl_8e684f5904e88831 = {0};
void gl_main()
{
f_initGlobals();
(out_webgl_9b98566002e557b5 = float4(0.0, 0.0, 0.0, 0.0));
float2 _webgl_a1324e053028e35c[8] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
float3 _webgl_91d068a447762d9f = {0.0, 0.0, 0.0};
float _webgl_feaeedca589c1a59 = {0.0};
float2 _webgl_62c9d5f5e7dd3b43 = {0.0, 0.0};
(_webgl_9d2f5706d0aa9ead = float4(0.0, 0.0, 0.0, 0.0));
float3 _webgl_3c71294eb0cb894e = {0.0, 0.0, 0.0};
(_webgl_3c71294eb0cb894e = normalize((_webgl_35c9514d594e36f3 - _webgl_5c81bf65ffac0762)));
float3x3 _webgl_8f7cfeb5dfbf859 = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
(_webgl_8f7cfeb5dfbf859[0] = normalize(_webgl_6580760fc7b305a7));
(_webgl_8f7cfeb5dfbf859[1] = normalize(_webgl_6ccc0e73d2b9d4de));
(_webgl_8f7cfeb5dfbf859[2] = normalize(_webgl_cc88c95a9917294));
(_webgl_d189f73da6eb4d5b = mul(transpose(_webgl_8f7cfeb5dfbf859), normalize(lerp(float3(0.0, 0.0, 1.0), ((gl_texture2D(_webgl_8167d7febf3081fa, _webgl_a01077f60b366ad8).xyz * 2.0) - 1.0), _webgl_c72812b39ae458b))));
float3 _webgl_cfb863ec5a9ad847 = {0.0, 0.0, 0.0};
(_webgl_cfb863ec5a9ad847 = normalize(((2.0 * (dot(_webgl_d189f73da6eb4d5b, _webgl_3c71294eb0cb894e) * _webgl_d189f73da6eb4d5b)) - _webgl_3c71294eb0cb894e)));
float4 _webgl_e68b8753c4f9154c = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_46665ba4a0ebb347 = {0.0, 0.0, 0.0, 0.0};
(_webgl_46665ba4a0ebb347 = gl_texture2D(_webgl_92406ab4e48f953a, _webgl_a01077f60b366ad8));
(_webgl_e68b8753c4f9154c.w = _webgl_46665ba4a0ebb347.w);
(_webgl_e68b8753c4f9154c.xyz = pow(_webgl_46665ba4a0ebb347.xyz, float3(2.2, 2.2, 2.2)));
float3 _webgl_73488ceaa0ef8fe3 = {0.0, 0.0, 0.0};
(_webgl_73488ceaa0ef8fe3 = lerp(float3(0.039999999, 0.039999999, 0.039999999), _webgl_e68b8753c4f9154c.xyz, _webgl_c0eb2e332cfac9bd));
(_webgl_d7c0aae5deddf4ea = (_webgl_e68b8753c4f9154c.xyz * (1.0 - _webgl_c0eb2e332cfac9bd)));
(_webgl_8e684f5904e88831 = ((_webgl_508641f47c99a2ed * gl_texture2D(_webgl_886520cdb034ca8e, _webgl_a01077f60b366ad8).y) + 1e-07));
float _webgl_b1ab2f1865b8b831 = {0.0};
float _webgl_4879e67e5ac43730 = {0.0};
(_webgl_4879e67e5ac43730 = (1.0 - max(dot(_webgl_d189f73da6eb4d5b, _webgl_3c71294eb0cb894e), 0.0)));
float _webgl_e25c9b31409332e8 = {0.0};
(_webgl_e25c9b31409332e8 = (_webgl_4879e67e5ac43730 * _webgl_4879e67e5ac43730));
(_webgl_b1ab2f1865b8b831 = (_webgl_4879e67e5ac43730 * (_webgl_e25c9b31409332e8 * _webgl_e25c9b31409332e8)));
(_webgl_b1ab2f1865b8b831 = (_webgl_b1ab2f1865b8b831 * (_webgl_8e684f5904e88831 * _webgl_8e684f5904e88831)));
(_webgl_acb134d5a49c2148 = (_webgl_73488ceaa0ef8fe3 + ((1.0 - _webgl_73488ceaa0ef8fe3) * _webgl_b1ab2f1865b8b831)));
float4 _webgl_91c6fbb789786f97 = {0.0, 0.0, 0.0, 0.0};
(_webgl_91c6fbb789786f97 = gl_texture2D(_webgl_c3b0765d5df09e72, _webgl_c381ead4a4662b4a));
float4 _webgl_9e247bb82e5c20e0 = {0.0, 0.0, 0.0, 0.0};
(_webgl_9e247bb82e5c20e0 = gl_texture2D(_webgl_d1a7cd505ae30fad, _webgl_c381ead4a4662b4a));
float3 _webgl_3489059248406aa1 = {0.0, 0.0, 0.0};
(_webgl_3489059248406aa1 = ((8.0 * _webgl_9e247bb82e5c20e0.w) * _webgl_9e247bb82e5c20e0.xyz));
(_webgl_540f7c123bdf52c0 = (_webgl_3489059248406aa1 * _webgl_3489059248406aa1));
float4 _webgl_f94a73bb11bba4b9 = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_f37b745988ad0a11 = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_ccea86689dc61b87[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
float3 _webgl_4bca4c0ad51c0c84 = {0.0, 0.0, 0.0};
int _webgl_fb6dc8302965ed92 = {0};
int _webgl_9a78fcd45b2fed28 = {0};
float _webgl_bd1cf0f064bc6fed = {0.0};
(_webgl_bd1cf0f064bc6fed = (clamp((1.0 - _webgl_8e684f5904e88831), 0.0, 1.0) * 5.0));
(_webgl_9a78fcd45b2fed28 = int_ctor(_webgl_bd1cf0f064bc6fed));
(_webgl_fb6dc8302965ed92 = int_ctor(min((_webgl_bd1cf0f064bc6fed + 1.0), 7.0)));
float3 _webgl_fff2fad9ead8e262 = {0.0, 0.0, 0.0};
(_webgl_fff2fad9ead8e262 = _webgl_cfb863ec5a9ad847);
float _webgl_4a69825d2061f2e4 = {0.0};
(_webgl_4a69825d2061f2e4 = (1.0 - (exp2(_webgl_bd1cf0f064bc6fed) / 128.0)));
float _webgl_85f7bf17706eab85 = {0.0};
(_webgl_85f7bf17706eab85 = max(max(abs(_webgl_cfb863ec5a9ad847.x), abs(_webgl_cfb863ec5a9ad847.y)), abs(_webgl_cfb863ec5a9ad847.z)));
float _webgl_5cfd34df9dcb15f5 = {0.0};
(_webgl_5cfd34df9dcb15f5 = abs(_webgl_cfb863ec5a9ad847.x));
if ((_webgl_5cfd34df9dcb15f5 != _webgl_85f7bf17706eab85))
{
(_webgl_fff2fad9ead8e262.x = (_webgl_cfb863ec5a9ad847.x * _webgl_4a69825d2061f2e4));
}
float _webgl_cfe4f407d6834756 = {0.0};
(_webgl_cfe4f407d6834756 = abs(_webgl_cfb863ec5a9ad847.y));
if ((_webgl_cfe4f407d6834756 != _webgl_85f7bf17706eab85))
{
(_webgl_fff2fad9ead8e262.y = (_webgl_cfb863ec5a9ad847.y * _webgl_4a69825d2061f2e4));
}
float _webgl_8eabcbad90e5f7cf = {0.0};
(_webgl_8eabcbad90e5f7cf = abs(_webgl_cfb863ec5a9ad847.z));
if ((_webgl_8eabcbad90e5f7cf != _webgl_85f7bf17706eab85))
{
(_webgl_fff2fad9ead8e262.z = (_webgl_cfb863ec5a9ad847.z * _webgl_4a69825d2061f2e4));
}
(_webgl_4bca4c0ad51c0c84.yz = _webgl_fff2fad9ead8e262.yz);
(_webgl_4bca4c0ad51c0c84.x = (-_webgl_fff2fad9ead8e262.x));
(_webgl_ccea86689dc61b87[0] = gl_textureCube(_webgl_e2d4935665806094, _webgl_4bca4c0ad51c0c84));
(_webgl_ccea86689dc61b87[1] = gl_textureCube(_webgl_6d18ad23908e287, _webgl_4bca4c0ad51c0c84));
(_webgl_ccea86689dc61b87[2] = gl_textureCube(_webgl_6666018523ec4102, _webgl_4bca4c0ad51c0c84));
(_webgl_ccea86689dc61b87[3] = gl_textureCube(_webgl_f40e146fb06e4a34, _webgl_4bca4c0ad51c0c84));
(_webgl_ccea86689dc61b87[4] = gl_textureCube(_webgl_340f351c4a4314aa, _webgl_4bca4c0ad51c0c84));
(_webgl_ccea86689dc61b87[5] = gl_textureCube(_webgl_7b5e6932dac63e22, _webgl_4bca4c0ad51c0c84));
{ for(int _webgl_8ecf859cafea42ba = {0}; (_webgl_8ecf859cafea42ba < 6); (_webgl_8ecf859cafea42ba++))
{
if ((_webgl_8ecf859cafea42ba == _webgl_9a78fcd45b2fed28))
{
(_webgl_f94a73bb11bba4b9 = _webgl_ccea86689dc61b87[int_ctor(clamp(float_ctor(_webgl_8ecf859cafea42ba), 0.0, 5.0))]);
}
if ((_webgl_8ecf859cafea42ba == _webgl_fb6dc8302965ed92))
{
(_webgl_f37b745988ad0a11 = _webgl_ccea86689dc61b87[int_ctor(clamp(float_ctor(_webgl_8ecf859cafea42ba), 0.0, 5.0))]);
}
}
}
float4 _webgl_45bc8ea7e5f7a77c = {0.0, 0.0, 0.0, 0.0};
(_webgl_45bc8ea7e5f7a77c = lerp(_webgl_f94a73bb11bba4b9, _webgl_f37b745988ad0a11, frac(_webgl_bd1cf0f064bc6fed)));
float3 _webgl_d7a381f02878b408 = {0.0, 0.0, 0.0};
(_webgl_d7a381f02878b408 = ((8.0 * _webgl_45bc8ea7e5f7a77c.w) * _webgl_45bc8ea7e5f7a77c.xyz));
float4 _webgl_1e0a569fa8d323c5 = {0.0, 0.0, 0.0, 0.0};
(_webgl_1e0a569fa8d323c5.xyz = (_webgl_d7a381f02878b408 * _webgl_d7a381f02878b408));
(_webgl_1e0a569fa8d323c5.w = _webgl_7ae668e5b64ca8de);
(_webgl_9d2f5706d0aa9ead = (_webgl_1e0a569fa8d323c5 * _webgl_91c6fbb789786f97.z));
float3 _webgl_6b1576cc49ca380b = {0.0, 0.0, 0.0};
(_webgl_6b1576cc49ca380b = (_webgl_5c81bf65ffac0762 - _webgl_f836b86ccb55856c));
float2 _webgl_82fa7c9f93cc7839 = {0.0, 0.0};
(_webgl_82fa7c9f93cc7839 = (((_webgl_6b1576cc49ca380b.xz / float2(16.0, -16.0)) * 0.5) + 0.5));
(_webgl_62c9d5f5e7dd3b43 = _webgl_82fa7c9f93cc7839);
(_webgl_feaeedca589c1a59 = 0.0);
if (((((_webgl_6b1576cc49ca380b.x > -1.1) && (_webgl_6b1576cc49ca380b.x < 1.1)) && (_webgl_6b1576cc49ca380b.z > -1.1)) && (_webgl_6b1576cc49ca380b.z < 1.1)))
{
(_webgl_feaeedca589c1a59 = 1.0);
}
(_webgl_feaeedca589c1a59 = ((_webgl_feaeedca589c1a59 / 4.0) + 0.0099999998));
(_webgl_91d068a447762d9f = float3(0.0, 0.0, 0.0));
(_webgl_a1324e053028e35c[0] = float2(-0.003196313, -0.00186043));
(_webgl_a1324e053028e35c[1] = float2(-0.0021621611, -0.0060225748));
(_webgl_a1324e053028e35c[2] = float2(-0.0039871801, 0.0024021049));
(_webgl_a1324e053028e35c[3] = float2(0.0035525649, 0.00177002));
(_webgl_a1324e053028e35c[4] = float2(-0.0001136277, 0.0050865328));
(_webgl_a1324e053028e35c[5] = float2(0.002264441, -0.0036473919));
(_webgl_a1324e053028e35c[6] = float2(0.0065642162, -0.002330364));
(_webgl_a1324e053028e35c[7] = float2(0.0054957881, 0.0052629658));
FLATTEN if ((_webgl_cc88c95a9917294.y > 0.0))
{
{LOOP for(int _webgl_378d0832127234f0 = {0}; (_webgl_378d0832127234f0 < 8); (_webgl_378d0832127234f0++))
{
float4 _webgl_bc517a070a88ef4a = {0.0, 0.0, 0.0, 0.0};
(_webgl_bc517a070a88ef4a = gl_texture2D(_webgl_5c7c81c103b6fbdd, (_webgl_62c9d5f5e7dd3b43 + _webgl_a1324e053028e35c[int_ctor(clamp(float_ctor(_webgl_378d0832127234f0), 0.0, 7.0))])));
float _webgl_a5cbea098f008107 = {0.0};
(_webgl_a5cbea098f008107 = _webgl_bc517a070a88ef4a.w);
float3 _webgl_e422f03590b051e5 = {0.0, 0.0, 0.0};
if ((_webgl_feaeedca589c1a59 < _webgl_bc517a070a88ef4a.w))
{
float3 _webgl_a2ea1ce929cac431 = {0.0, 0.0, 0.0};
(_webgl_a2ea1ce929cac431.xz = float2(0.125, 1.0));
(_webgl_a2ea1ce929cac431.y = _webgl_a5cbea098f008107);
(_webgl_e422f03590b051e5 = _webgl_a2ea1ce929cac431);
}
else
{
(_webgl_e422f03590b051e5 = float3(0.0, 0.0, 0.0));
}
(_webgl_91d068a447762d9f = (_webgl_91d068a447762d9f + _webgl_e422f03590b051e5));
}
}
(_webgl_91d068a447762d9f.x = (1.0 - (_webgl_91d068a447762d9f.x * 0.30000001)));
(_webgl_91d068a447762d9f.y = (_webgl_91d068a447762d9f.y / _webgl_91d068a447762d9f.z));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 * lerp(_webgl_91d068a447762d9f.x, 1.0, clamp(_webgl_91d068a447762d9f.y, 0.0, 1.0))));
float4 _webgl_d3a0349fad6621fb = {0.0, 0.0, 0.0, 0.0};
(_webgl_d3a0349fad6621fb = gl_texture2D(_webgl_5c7c81c103b6fbdd, _webgl_82fa7c9f93cc7839));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 * lerp(1.0, (1.0 - clamp(((_webgl_d3a0349fad6621fb.x - _webgl_d3a0349fad6621fb.y) * 4.0), 0.0, 1.0)), clamp(_webgl_cc88c95a9917294.y, 0.0, 1.0))));
}
float3 _webgl_48742813565ac55d = {0.0, 0.0, 0.0};
(_webgl_48742813565ac55d = lerp((_webgl_d7c0aae5deddf4ea * _webgl_540f7c123bdf52c0), (_webgl_9d2f5706d0aa9ead.xyz * _webgl_9d2f5706d0aa9ead.w), _webgl_acb134d5a49c2148));
(out_webgl_9b98566002e557b5.xyz = _webgl_48742813565ac55d);
(out_webgl_9b98566002e557b5.xyz = (out_webgl_9b98566002e557b5.xyz + _webgl_2d459f8069f64681));
float3 _webgl_f05a73b03fcb4961 = {0.0, 0.0, 0.0};
(_webgl_f05a73b03fcb4961 = (_webgl_5c81bf65ffac0762 - _webgl_35c9514d594e36f3));
(out_webgl_9b98566002e557b5.xyz = lerp(_webgl_3b3710b9db4788a7, out_webgl_9b98566002e557b5.xyz, clamp(exp(((-sqrt(dot(_webgl_f05a73b03fcb4961, _webgl_f05a73b03fcb4961))) * _webgl_5985a6d987efdfc3)), 0.0, 1.0)));
(out_webgl_9b98566002e557b5.xyz = out_webgl_9b98566002e557b5.xyz);
(out_webgl_9b98566002e557b5.xyz = out_webgl_9b98566002e557b5.xyz);
(out_webgl_9b98566002e557b5.w = 1.0);
(out_webgl_9b98566002e557b5.x += 0.8298074);
}
void f_initGlobals()
{
(_webgl_9d2f5706d0aa9ead = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_d7c0aae5deddf4ea = float3(0.0, 0.0, 0.0));
(_webgl_d189f73da6eb4d5b = float3(0.0, 0.0, 0.0));
(_webgl_540f7c123bdf52c0 = float3(0.0, 0.0, 0.0));
(_webgl_acb134d5a49c2148 = float3(0.0, 0.0, 0.0));
(_webgl_8e684f5904e88831 = 0.0);
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
    _webgl_a01077f60b366ad8 = input.v4.xy;
    _webgl_c381ead4a4662b4a = input.v5.xy;

    gl_main();

    return generateOutput();
}

