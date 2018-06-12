
// Uniforms

uniform float4x4 _webgl_f867f0698072792a : register(c0);
uniform float4x4 _webgl_285673c8bc48ada1 : register(c4);
uniform float3x3 _webgl_af3f66d2b52d4d7c : register(c8);
uniform float _webgl_9a8fb5cd706f4c3 : register(c11);
uniform float _webgl_c69990ec6a7a5be2 : register(c12);
uniform float _webgl_9969cde70a80da2c : register(c13);
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
static float4 _webgl_593ea1901df659ca = {0, 0, 0, 0};

static float4 gl_Position = float4(0, 0, 0, 0);

// Varyings
static  float4 _webgl_e5253e8e18397069 = {0, 0, 0, 0};
static  float3 _webgl_5c81bf65ffac0762 = {0, 0, 0};
static  float3 _webgl_cc88c95a9917294 = {0, 0, 0};
static  float2 _webgl_a0b62b4d8ddcd62b = {0, 0};
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
(_webgl_a0b62b4d8ddcd62b = float2(0.0, 0.0));
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
(_webgl_49a0cb6f9237aa8 = normalize(((_webgl_593ea1901df659ca.xyz * 2.0) - 1.0)));
float3 _webgl_3c71294eb0cb894e = {0.0, 0.0, 0.0};
(_webgl_3c71294eb0cb894e = normalize(((_webgl_49a0cb6f9237aa8.yzx * float3(1.0, 0.0, 0.0)) - (_webgl_49a0cb6f9237aa8.zxy * float3(0.0, 1.0, 0.0)))));
float3x3 _webgl_8f7cfeb5dfbf859 = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
(_webgl_8f7cfeb5dfbf859[0] = _webgl_3c71294eb0cb894e);
(_webgl_8f7cfeb5dfbf859[1] = normalize(((_webgl_49a0cb6f9237aa8.yzx * _webgl_3c71294eb0cb894e.zxy) - (_webgl_49a0cb6f9237aa8.zxy * _webgl_3c71294eb0cb894e.yzx))));
(_webgl_8f7cfeb5dfbf859[2] = _webgl_49a0cb6f9237aa8);
float3 _webgl_3375fe8687d0eb79 = {0.0, 0.0, 0.0};
(_webgl_3375fe8687d0eb79 = mul(_webgl_c9ba5e9010c2d845, transpose(_webgl_8f7cfeb5dfbf859)));
float _webgl_5ccca921d933644d = {0.0};
(_webgl_5ccca921d933644d = abs(cos((_webgl_9a8fb5cd706f4c3 + dot(((_webgl_49a0cb6f9237aa8 * 3.0) + _webgl_285673c8bc48ada1[3].xyz), float3(1.0, 1.0, 1.0))))));
float _webgl_eba94031eb4f9a51 = {0.0};
(_webgl_eba94031eb4f9a51 = (((0.050000001 * ((_webgl_5ccca921d933644d * _webgl_5ccca921d933644d) * (3.0 - (2.0 * _webgl_5ccca921d933644d)))) * clamp((sqrt(dot(_webgl_c9ba5e9010c2d845, _webgl_c9ba5e9010c2d845)) / 3.5), 0.0, 1.0)) * _webgl_9969cde70a80da2c));
float _webgl_73488ceaa0ef8fe3 = {0.0};
(_webgl_73488ceaa0ef8fe3 = cos(_webgl_eba94031eb4f9a51));
float _webgl_73ad0cb88cd907dd = {0.0};
(_webgl_73ad0cb88cd907dd = sin(_webgl_eba94031eb4f9a51));
float2x2 _webgl_4879e67e5ac43730 = {0.0, 0.0, 0.0, 0.0};
(_webgl_4879e67e5ac43730[0].x = _webgl_73488ceaa0ef8fe3);
(_webgl_4879e67e5ac43730[0].y = (-_webgl_73ad0cb88cd907dd));
(_webgl_4879e67e5ac43730[1].x = _webgl_73ad0cb88cd907dd);
(_webgl_4879e67e5ac43730[1].y = _webgl_73488ceaa0ef8fe3);
(_webgl_3375fe8687d0eb79.yz = mul(transpose(_webgl_4879e67e5ac43730), _webgl_3375fe8687d0eb79.yz));
(_webgl_3375fe8687d0eb79 = mul(transpose(_webgl_8f7cfeb5dfbf859), _webgl_3375fe8687d0eb79));
(_webgl_c9ba5e9010c2d845 = _webgl_3375fe8687d0eb79);
(_webgl_5adc46d477b653fe = _webgl_3375fe8687d0eb79);
float4 _webgl_e25c9b31409332e8 = {0.0, 0.0, 0.0, 0.0};
(_webgl_e25c9b31409332e8.w = 1.0);
(_webgl_e25c9b31409332e8.xyz = _webgl_3375fe8687d0eb79);
float4 _webgl_91c6fbb789786f97 = {0.0, 0.0, 0.0, 0.0};
(_webgl_91c6fbb789786f97 = mul(transpose(_webgl_285673c8bc48ada1), _webgl_e25c9b31409332e8));
(gl_Position = mul(transpose(_webgl_f867f0698072792a), _webgl_91c6fbb789786f97));
(_webgl_5c81bf65ffac0762 = _webgl_91c6fbb789786f97.xyz);
(_webgl_cc88c95a9917294 = normalize(mul(transpose(_webgl_af3f66d2b52d4d7c), _webgl_7df2295badec0817)));
(_webgl_a0b62b4d8ddcd62b = _webgl_c8bdcf0e19b86378);
(_webgl_e5253e8e18397069 = _webgl_593ea1901df659ca);
(_webgl_5c81bf65ffac0762.x += 0.27072731);
}

struct VS_INPUT
{
    float3 _webgl_1a3d807ca20b2d7a : TEXCOORD0;
    float3 _webgl_7df2295badec0817 : TEXCOORD1;
    float2 _webgl_c8bdcf0e19b86378 : TEXCOORD2;
    float4 _webgl_593ea1901df659ca : TEXCOORD3;
};

void initAttributes(VS_INPUT input)
{
    _webgl_1a3d807ca20b2d7a = input._webgl_1a3d807ca20b2d7a;
    _webgl_7df2295badec0817 = input._webgl_7df2295badec0817;
    _webgl_c8bdcf0e19b86378 = input._webgl_c8bdcf0e19b86378;
    _webgl_593ea1901df659ca = input._webgl_593ea1901df659ca;
}

struct VS_OUTPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD4;
    float4 v0 : TEXCOORD0;
    float3 v1 : TEXCOORD1;
    float3 v2 : TEXCOORD2;
    float2 v3 : TEXCOORD3;
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
    output.v2 = _webgl_cc88c95a9917294;
    output.v3 = _webgl_a0b62b4d8ddcd62b;

    return output;
}

