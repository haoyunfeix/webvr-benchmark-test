
// Uniforms

uniform float4x4 _webgl_f867f0698072792a : register(c0);
uniform float4x4 _webgl_285673c8bc48ada1 : register(c4);
uniform float3x3 _webgl_af3f66d2b52d4d7c : register(c8);
uniform float3 _webgl_3f8b4f528273600b : register(c11);
uniform float _webgl_9a8fb5cd706f4c3 : register(c12);
uniform float _webgl_c69990ec6a7a5be2 : register(c13);
uniform float _webgl_9969cde70a80da2c : register(c14);
#ifdef ANGLE_ENABLE_LOOP_FLATTEN
#define LOOP [loop]
#define FLATTEN [flatten]
#else
#define LOOP
#define FLATTEN
#endif
// Attributes
static float3 _webgl_1a3d807ca20b2d7a = {0, 0, 0};
static float3 _webgl_7df2295badec0817 = {0, 0, 0};
static float2 _webgl_c8bdcf0e19b86378 = {0, 0};
static float2 _webgl_f19cfa196e6c7515 = {0, 0};
static float4 _webgl_4be753fa086b8246 = {0, 0, 0, 0};
static float4 _webgl_593ea1901df659ca = {0, 0, 0, 0};

static float4 gl_Position = float4(0, 0, 0, 0);

// Varyings
static  float4 _webgl_e5253e8e18397069 = {0, 0, 0, 0};
static  float3 _webgl_5c81bf65ffac0762 = {0, 0, 0};
static  float3 _webgl_cc88c95a9917294 = {0, 0, 0};
static  float3 _webgl_6580760fc7b305a7 = {0, 0, 0};
static  float3 _webgl_6ccc0e73d2b9d4de = {0, 0, 0};
static  float2 _webgl_a0b62b4d8ddcd62b = {0, 0};
static  float2 _webgl_c381ead4a4662b4a = {0, 0};
static  float3 _webgl_5adc46d477b653fe = {0, 0, 0};

cbuffer DriverConstants : register(b1)
{
    float4 dx_ViewAdjust : packoffset(c1);
    float2 dx_ViewCoords : packoffset(c2);
    float2 dx_ViewScale  : packoffset(c3);
};

void gl_main()
{
(gl_Position = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_5adc46d477b653fe = float3(0.0, 0.0, 0.0));
(_webgl_c381ead4a4662b4a = float2(0.0, 0.0));
(_webgl_a0b62b4d8ddcd62b = float2(0.0, 0.0));
(_webgl_6ccc0e73d2b9d4de = float3(0.0, 0.0, 0.0));
(_webgl_6580760fc7b305a7 = float3(0.0, 0.0, 0.0));
(_webgl_cc88c95a9917294 = float3(0.0, 0.0, 0.0));
(_webgl_5c81bf65ffac0762 = float3(0.0, 0.0, 0.0));
(_webgl_e5253e8e18397069 = float4(0.0, 0.0, 0.0, 0.0));
float3 _webgl_c9ba5e9010c2d845 = {0.0, 0.0, 0.0};
(_webgl_c9ba5e9010c2d845 = _webgl_1a3d807ca20b2d7a);
if ((_webgl_c69990ec6a7a5be2 > 0.5))
{
float4 _webgl_822b69d8b2db705f = {0.0, 0.0, 0.0, 0.0};
(_webgl_822b69d8b2db705f = abs(((frac(((((frac(((_webgl_9a8fb5cd706f4c3 + dot(_webgl_1a3d807ca20b2d7a, float3(1.0, 1.0, 1.0))) * float4(1.975, 0.79299998, 0.375, 0.193))) * 2.0) - float4(1.0, 1.0, 1.0, 1.0)) * 0.1) + 0.5)) * 2.0) - 1.0)));
float4 _webgl_f28d072c82c61bea = {0.0, 0.0, 0.0, 0.0};
(_webgl_f28d072c82c61bea = ((_webgl_822b69d8b2db705f * _webgl_822b69d8b2db705f) * (3.0 - (2.0 * _webgl_822b69d8b2db705f))));
(_webgl_c9ba5e9010c2d845 = (_webgl_1a3d807ca20b2d7a + (((_webgl_f28d072c82c61bea.xz + _webgl_f28d072c82c61bea.yw).xxy * _webgl_7df2295badec0817) * _webgl_c8bdcf0e19b86378.y)));
}
float3 _webgl_49a0cb6f9237aa8 = {0.0, 0.0, 0.0};
(_webgl_49a0cb6f9237aa8 = ((_webgl_3f8b4f528273600b * 0.0254) / 0.3048));
float3 _webgl_3c71294eb0cb894e = {0.0, 0.0, 0.0};
(_webgl_3c71294eb0cb894e.x = frac(_webgl_f19cfa196e6c7515.x));
(_webgl_3c71294eb0cb894e.y = frac((_webgl_f19cfa196e6c7515.x * 256.0)));
(_webgl_3c71294eb0cb894e.z = frac((_webgl_f19cfa196e6c7515.x * 65536.0)));
float3 _webgl_8f7cfeb5dfbf859 = {0.0, 0.0, 0.0};
(_webgl_8f7cfeb5dfbf859 = (_webgl_3c71294eb0cb894e - float3(0.5, 0.5, 0.0)));
float3 _webgl_cfb863ec5a9ad847 = {0.0, 0.0, 0.0};
(_webgl_cfb863ec5a9ad847.x = frac(_webgl_f19cfa196e6c7515.y));
(_webgl_cfb863ec5a9ad847.y = frac((_webgl_f19cfa196e6c7515.y * 256.0)));
(_webgl_cfb863ec5a9ad847.z = frac((_webgl_f19cfa196e6c7515.y * 65536.0)));
float3 _webgl_5ccca921d933644d = {0.0, 0.0, 0.0};
(_webgl_5ccca921d933644d = (_webgl_cfb863ec5a9ad847 - float3(0.5, 0.5, 0.0)));
float3 _webgl_46665ba4a0ebb347 = {0.0, 0.0, 0.0};
(_webgl_46665ba4a0ebb347 = normalize(((_webgl_593ea1901df659ca.xyz * 2.0) - 1.0)));
float3 _webgl_73488ceaa0ef8fe3 = {0.0, 0.0, 0.0};
(_webgl_73488ceaa0ef8fe3 = normalize((_webgl_8f7cfeb5dfbf859 - _webgl_5ccca921d933644d)));
float3 _webgl_73ad0cb88cd907dd = {0.0, 0.0, 0.0};
(_webgl_73ad0cb88cd907dd = normalize(((_webgl_46665ba4a0ebb347.yzx * float3(1.0, 0.0, 0.0)) - (_webgl_46665ba4a0ebb347.zxy * float3(0.0, 1.0, 0.0)))));
float3x3 _webgl_4879e67e5ac43730 = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
(_webgl_4879e67e5ac43730[0] = _webgl_73ad0cb88cd907dd);
(_webgl_4879e67e5ac43730[1] = normalize(((_webgl_46665ba4a0ebb347.yzx * _webgl_73ad0cb88cd907dd.zxy) - (_webgl_46665ba4a0ebb347.zxy * _webgl_73ad0cb88cd907dd.yzx))));
(_webgl_4879e67e5ac43730[2] = _webgl_46665ba4a0ebb347);
float3 _webgl_e25c9b31409332e8 = {0.0, 0.0, 0.0};
(_webgl_e25c9b31409332e8 = normalize(((_webgl_73488ceaa0ef8fe3.yzx * float3(1.0, 0.0, 0.0)) - (_webgl_73488ceaa0ef8fe3.zxy * float3(0.0, 1.0, 0.0)))));
float3x3 _webgl_91c6fbb789786f97 = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
(_webgl_91c6fbb789786f97[0] = _webgl_e25c9b31409332e8);
(_webgl_91c6fbb789786f97[1] = normalize(((_webgl_73488ceaa0ef8fe3.yzx * _webgl_e25c9b31409332e8.zxy) - (_webgl_73488ceaa0ef8fe3.zxy * _webgl_e25c9b31409332e8.yzx))));
(_webgl_91c6fbb789786f97[2] = _webgl_73488ceaa0ef8fe3);
float _webgl_9e247bb82e5c20e0 = {0.0};
(_webgl_9e247bb82e5c20e0 = sqrt(dot(_webgl_8f7cfeb5dfbf859, _webgl_8f7cfeb5dfbf859)));
if ((_webgl_9e247bb82e5c20e0 > 0.029999999))
{
float3 _webgl_4bb0c685ab698946 = {0.0, 0.0, 0.0};
float3 _webgl_94dbf8042df43c1d = {0.0, 0.0, 0.0};
(_webgl_94dbf8042df43c1d = (_webgl_8f7cfeb5dfbf859 * _webgl_49a0cb6f9237aa8));
(_webgl_4bb0c685ab698946 = (_webgl_c9ba5e9010c2d845 - _webgl_94dbf8042df43c1d));
float _webgl_f26380f436f82532 = {0.0};
(_webgl_f26380f436f82532 = clamp((sqrt(dot(_webgl_4bb0c685ab698946, _webgl_4bb0c685ab698946)) / 3.5), 0.0, 1.0));
(_webgl_4bb0c685ab698946 = mul(_webgl_4bb0c685ab698946, transpose(_webgl_4879e67e5ac43730)));
float _webgl_f06ab770d8ec1876 = {0.0};
(_webgl_f06ab770d8ec1876 = abs(cos((_webgl_9a8fb5cd706f4c3 + dot(_webgl_94dbf8042df43c1d, float3(1.0, 1.0, 1.0))))));
float _webgl_ad4034d2e8f99b03 = {0.0};
(_webgl_ad4034d2e8f99b03 = (((0.050000001 * ((_webgl_f06ab770d8ec1876 * _webgl_f06ab770d8ec1876) * (3.0 - (2.0 * _webgl_f06ab770d8ec1876)))) * _webgl_f26380f436f82532) * _webgl_9969cde70a80da2c));
float _webgl_cf179e362a646f90 = {0.0};
(_webgl_cf179e362a646f90 = cos(_webgl_ad4034d2e8f99b03));
float _webgl_6472b8a26530e78b = {0.0};
(_webgl_6472b8a26530e78b = sin(_webgl_ad4034d2e8f99b03));
float2x2 _webgl_ba8e8168781d9774 = {0.0, 0.0, 0.0, 0.0};
(_webgl_ba8e8168781d9774[0].x = _webgl_cf179e362a646f90);
(_webgl_ba8e8168781d9774[0].y = (-_webgl_6472b8a26530e78b));
(_webgl_ba8e8168781d9774[1].x = _webgl_6472b8a26530e78b);
(_webgl_ba8e8168781d9774[1].y = _webgl_cf179e362a646f90);
(_webgl_4bb0c685ab698946.yz = mul(transpose(_webgl_ba8e8168781d9774), _webgl_4bb0c685ab698946.yz));
(_webgl_4bb0c685ab698946 = mul(transpose(_webgl_4879e67e5ac43730), _webgl_4bb0c685ab698946));
(_webgl_4bb0c685ab698946 = (_webgl_4bb0c685ab698946 + _webgl_94dbf8042df43c1d));
(_webgl_c9ba5e9010c2d845 = _webgl_4bb0c685ab698946);
}
float _webgl_bd1cf0f064bc6fed = {0.0};
(_webgl_bd1cf0f064bc6fed = sqrt(dot(_webgl_5ccca921d933644d, _webgl_5ccca921d933644d)));
if ((_webgl_bd1cf0f064bc6fed > 0.029999999))
{
float3 _webgl_da4bea48428fa8a6 = {0.0, 0.0, 0.0};
float3 _webgl_5b975a6c2a0280fa = {0.0, 0.0, 0.0};
(_webgl_5b975a6c2a0280fa = (_webgl_5ccca921d933644d * _webgl_49a0cb6f9237aa8));
(_webgl_da4bea48428fa8a6 = (_webgl_c9ba5e9010c2d845 - _webgl_5b975a6c2a0280fa));
float _webgl_85f7bf17706eab85 = {0.0};
(_webgl_85f7bf17706eab85 = clamp((sqrt(dot(_webgl_da4bea48428fa8a6, _webgl_da4bea48428fa8a6)) / 3.5), 0.0, 1.0));
(_webgl_da4bea48428fa8a6 = mul(_webgl_da4bea48428fa8a6, transpose(_webgl_91c6fbb789786f97)));
float _webgl_5cfd34df9dcb15f5 = {0.0};
(_webgl_5cfd34df9dcb15f5 = abs(cos((_webgl_9a8fb5cd706f4c3 + dot(_webgl_5b975a6c2a0280fa, float3(1.0, 1.0, 1.0))))));
float _webgl_de7aa0e9e75b0b9a = {0.0};
(_webgl_de7aa0e9e75b0b9a = (((0.050000001 * ((_webgl_5cfd34df9dcb15f5 * _webgl_5cfd34df9dcb15f5) * (3.0 - (2.0 * _webgl_5cfd34df9dcb15f5)))) * _webgl_85f7bf17706eab85) * _webgl_9969cde70a80da2c));
float _webgl_8eabcbad90e5f7cf = {0.0};
(_webgl_8eabcbad90e5f7cf = cos(_webgl_de7aa0e9e75b0b9a));
float _webgl_45bc8ea7e5f7a77c = {0.0};
(_webgl_45bc8ea7e5f7a77c = sin(_webgl_de7aa0e9e75b0b9a));
float2x2 _webgl_d7a381f02878b408 = {0.0, 0.0, 0.0, 0.0};
(_webgl_d7a381f02878b408[0].x = _webgl_8eabcbad90e5f7cf);
(_webgl_d7a381f02878b408[0].y = (-_webgl_45bc8ea7e5f7a77c));
(_webgl_d7a381f02878b408[1].x = _webgl_45bc8ea7e5f7a77c);
(_webgl_d7a381f02878b408[1].y = _webgl_8eabcbad90e5f7cf);
(_webgl_da4bea48428fa8a6.yz = mul(transpose(_webgl_d7a381f02878b408), _webgl_da4bea48428fa8a6.yz));
(_webgl_da4bea48428fa8a6 = mul(transpose(_webgl_91c6fbb789786f97), _webgl_da4bea48428fa8a6));
(_webgl_da4bea48428fa8a6 = (_webgl_da4bea48428fa8a6 + _webgl_5b975a6c2a0280fa));
(_webgl_c9ba5e9010c2d845 = _webgl_da4bea48428fa8a6);
}
float3 _webgl_286fb8fa63262f04 = {0.0, 0.0, 0.0};
(_webgl_286fb8fa63262f04.x = _webgl_c9ba5e9010c2d845.x);
float _webgl_92509f0ec372eab6 = {0.0};
(_webgl_92509f0ec372eab6 = ((0.035 * cos(_webgl_9a8fb5cd706f4c3)) * clamp((_webgl_c9ba5e9010c2d845.z / 16.0), 0.0, 1.0)));
float _webgl_82fa7c9f93cc7839 = {0.0};
(_webgl_82fa7c9f93cc7839 = cos(_webgl_92509f0ec372eab6));
float _webgl_6b8507d7c52a30c5 = {0.0};
(_webgl_6b8507d7c52a30c5 = sin(_webgl_92509f0ec372eab6));
float2x2 _webgl_bc517a070a88ef4a = {0.0, 0.0, 0.0, 0.0};
(_webgl_bc517a070a88ef4a[0].x = _webgl_82fa7c9f93cc7839);
(_webgl_bc517a070a88ef4a[0].y = (-_webgl_6b8507d7c52a30c5));
(_webgl_bc517a070a88ef4a[1].x = _webgl_6b8507d7c52a30c5);
(_webgl_bc517a070a88ef4a[1].y = _webgl_82fa7c9f93cc7839);
(_webgl_286fb8fa63262f04.yz = mul(transpose(_webgl_bc517a070a88ef4a), _webgl_c9ba5e9010c2d845.yz));
(_webgl_c9ba5e9010c2d845 = _webgl_286fb8fa63262f04);
(_webgl_5adc46d477b653fe = _webgl_8f7cfeb5dfbf859);
float4 _webgl_a5cbea098f008107 = {0.0, 0.0, 0.0, 0.0};
(_webgl_a5cbea098f008107.w = 1.0);
(_webgl_a5cbea098f008107.xyz = _webgl_286fb8fa63262f04);
float4 _webgl_e422f03590b051e5 = {0.0, 0.0, 0.0, 0.0};
(_webgl_e422f03590b051e5 = mul(transpose(_webgl_285673c8bc48ada1), _webgl_a5cbea098f008107));
(gl_Position = mul(transpose(_webgl_f867f0698072792a), _webgl_e422f03590b051e5));
(_webgl_5c81bf65ffac0762 = _webgl_e422f03590b051e5.xyz);
float3 _webgl_a2ea1ce929cac431 = {0.0, 0.0, 0.0};
(_webgl_a2ea1ce929cac431 = normalize(mul(transpose(_webgl_af3f66d2b52d4d7c), _webgl_7df2295badec0817)));
(_webgl_cc88c95a9917294 = _webgl_a2ea1ce929cac431);
float3 _webgl_d3a0349fad6621fb = {0.0, 0.0, 0.0};
(_webgl_d3a0349fad6621fb = normalize(mul(transpose(_webgl_af3f66d2b52d4d7c), _webgl_4be753fa086b8246.xyz)));
(_webgl_6580760fc7b305a7 = _webgl_d3a0349fad6621fb);
(_webgl_6ccc0e73d2b9d4de = (((_webgl_a2ea1ce929cac431.yzx * _webgl_d3a0349fad6621fb.zxy) - (_webgl_a2ea1ce929cac431.zxy * _webgl_d3a0349fad6621fb.yzx)) * _webgl_4be753fa086b8246.w));
(_webgl_a0b62b4d8ddcd62b = _webgl_c8bdcf0e19b86378);
(_webgl_c381ead4a4662b4a = _webgl_f19cfa196e6c7515);
(_webgl_e5253e8e18397069 = _webgl_593ea1901df659ca);
(_webgl_5c81bf65ffac0762.x += 0.56359601);
}

struct VS_INPUT
{
    float3 _webgl_1a3d807ca20b2d7a : TEXCOORD0;
    float3 _webgl_7df2295badec0817 : TEXCOORD1;
    float2 _webgl_c8bdcf0e19b86378 : TEXCOORD2;
    float2 _webgl_f19cfa196e6c7515 : TEXCOORD3;
    float4 _webgl_4be753fa086b8246 : TEXCOORD4;
    float4 _webgl_593ea1901df659ca : TEXCOORD5;
};

void initAttributes(VS_INPUT input)
{
    _webgl_1a3d807ca20b2d7a = input._webgl_1a3d807ca20b2d7a;
    _webgl_7df2295badec0817 = input._webgl_7df2295badec0817;
    _webgl_c8bdcf0e19b86378 = input._webgl_c8bdcf0e19b86378;
    _webgl_f19cfa196e6c7515 = input._webgl_f19cfa196e6c7515;
    _webgl_4be753fa086b8246 = input._webgl_4be753fa086b8246;
    _webgl_593ea1901df659ca = input._webgl_593ea1901df659ca;
}

struct VS_OUTPUT
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

VS_OUTPUT main(VS_INPUT input)
{
    initAttributes(input);

    gl_main();

    VS_OUTPUT output;
    output.gl_Position = gl_Position;
    output.dx_Position.x = gl_Position.x;
    output.dx_Position.y = - gl_Position.y;
    output.dx_Position.z = (gl_Position.z + gl_Position.w) * 0.5;
    output.dx_Position.w = gl_Position.w;
    output.v0 = _webgl_e5253e8e18397069;
    output.v1 = _webgl_5c81bf65ffac0762;
    output.v2 = _webgl_6580760fc7b305a7;
    output.v3 = _webgl_6ccc0e73d2b9d4de;
    output.v4 = _webgl_cc88c95a9917294;
    output.v5 = _webgl_a0b62b4d8ddcd62b;
    output.v6 = _webgl_c381ead4a4662b4a;

    return output;
}

