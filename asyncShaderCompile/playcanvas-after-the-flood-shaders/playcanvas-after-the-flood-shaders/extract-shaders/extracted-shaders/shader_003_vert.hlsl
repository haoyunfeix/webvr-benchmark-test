
// Uniforms

uniform float4x4 _webgl_f867f0698072792a : register(c0);
uniform float4x4 _webgl_285673c8bc48ada1 : register(c4);
uniform float3x3 _webgl_af3f66d2b52d4d7c : register(c8);
uniform float _webgl_f0326039cb719c3a : register(c11);
uniform float _webgl_6ff27a4bdd48b6bc : register(c12);
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

static float4 gl_Position = float4(0, 0, 0, 0);

// Varyings
static  float3 _webgl_5c81bf65ffac0762 = {0, 0, 0};
static  float3 _webgl_cc88c95a9917294 = {0, 0, 0};
static  float _webgl_f65f399f8169fe71 = {0};

cbuffer DriverConstants : register(b1)
{
    float4 dx_ViewAdjust : packoffset(c1);
    float2 dx_ViewCoords : packoffset(c2);
    float2 dx_ViewScale  : packoffset(c3);
};

void gl_main()
{
(gl_Position = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_f65f399f8169fe71 = 0.0);
(_webgl_cc88c95a9917294 = float3(0.0, 0.0, 0.0));
(_webgl_5c81bf65ffac0762 = float3(0.0, 0.0, 0.0));
float4 _webgl_c6a0503af9c52415 = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_822b69d8b2db705f = {0.0, 0.0, 0.0, 0.0};
(_webgl_822b69d8b2db705f.w = 1.0);
(_webgl_822b69d8b2db705f.xyz = _webgl_1a3d807ca20b2d7a);
float4 _webgl_f28d072c82c61bea = {0.0, 0.0, 0.0, 0.0};
(_webgl_f28d072c82c61bea = mul(transpose(_webgl_285673c8bc48ada1), _webgl_822b69d8b2db705f));
(_webgl_c6a0503af9c52415.w = _webgl_f28d072c82c61bea.w);
float4 _webgl_49a0cb6f9237aa8 = {0.0, 0.0, 0.0, 0.0};
(_webgl_49a0cb6f9237aa8.x = _webgl_f867f0698072792a[0].w);
(_webgl_49a0cb6f9237aa8.y = _webgl_f867f0698072792a[1].w);
(_webgl_49a0cb6f9237aa8.z = _webgl_f867f0698072792a[2].w);
(_webgl_49a0cb6f9237aa8.w = _webgl_f867f0698072792a[3].w);
float _webgl_3c71294eb0cb894e = {0.0};
(_webgl_3c71294eb0cb894e = max(_webgl_6ff27a4bdd48b6bc, (dot(_webgl_49a0cb6f9237aa8, _webgl_f28d072c82c61bea) * _webgl_f0326039cb719c3a)));
float3x3 _webgl_8f7cfeb5dfbf859 = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
(_webgl_8f7cfeb5dfbf859[0] = _webgl_285673c8bc48ada1[0].xyz);
(_webgl_8f7cfeb5dfbf859[1] = _webgl_285673c8bc48ada1[1].xyz);
(_webgl_8f7cfeb5dfbf859[2] = _webgl_285673c8bc48ada1[2].xyz);
(_webgl_c6a0503af9c52415.xyz = (_webgl_f28d072c82c61bea.xyz + ((_webgl_3c71294eb0cb894e - _webgl_6ff27a4bdd48b6bc) * normalize(mul(transpose(_webgl_8f7cfeb5dfbf859), _webgl_7df2295badec0817)))));
(_webgl_f65f399f8169fe71 = (_webgl_6ff27a4bdd48b6bc / _webgl_3c71294eb0cb894e));
(gl_Position = mul(transpose(_webgl_f867f0698072792a), _webgl_c6a0503af9c52415));
(_webgl_5c81bf65ffac0762 = _webgl_c6a0503af9c52415.xyz);
(_webgl_cc88c95a9917294 = normalize(mul(transpose(_webgl_af3f66d2b52d4d7c), _webgl_7df2295badec0817)));
(_webgl_5c81bf65ffac0762.x += 0.75978428);
}

struct VS_INPUT
{
    float3 _webgl_1a3d807ca20b2d7a : TEXCOORD0;
    float3 _webgl_7df2295badec0817 : TEXCOORD1;
};

void initAttributes(VS_INPUT input)
{
    _webgl_1a3d807ca20b2d7a = input._webgl_1a3d807ca20b2d7a;
    _webgl_7df2295badec0817 = input._webgl_7df2295badec0817;
}

struct VS_OUTPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD3;
    float3 v0 : TEXCOORD0;
    float3 v1 : TEXCOORD1;
    float v2 : TEXCOORD2;
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
    output.v0 = _webgl_5c81bf65ffac0762;
    output.v1 = _webgl_cc88c95a9917294;
    output.v2 = _webgl_f65f399f8169fe71;

    return output;
}

