
// Uniforms

uniform float4x4 _webgl_f867f0698072792a : register(c0);
uniform float4x4 _webgl_285673c8bc48ada1 : register(c4);
uniform float3x3 _webgl_af3f66d2b52d4d7c : register(c8);
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

static float4 gl_Position = float4(0, 0, 0, 0);

// Varyings
static  float3 _webgl_5c81bf65ffac0762 = {0, 0, 0};
static  float3 _webgl_cc88c95a9917294 = {0, 0, 0};
static  float2 _webgl_a0b62b4d8ddcd62b = {0, 0};

cbuffer DriverConstants : register(b1)
{
    float4 dx_ViewAdjust : packoffset(c1);
    float2 dx_ViewCoords : packoffset(c2);
    float2 dx_ViewScale  : packoffset(c3);
};

void gl_main()
{
(gl_Position = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_a0b62b4d8ddcd62b = float2(0.0, 0.0));
(_webgl_cc88c95a9917294 = float3(0.0, 0.0, 0.0));
(_webgl_5c81bf65ffac0762 = float3(0.0, 0.0, 0.0));
float4 _webgl_dbb0b86db3589565 = {0.0, 0.0, 0.0, 0.0};
(_webgl_dbb0b86db3589565.w = 1.0);
(_webgl_dbb0b86db3589565.xyz = _webgl_1a3d807ca20b2d7a);
float4 _webgl_822b69d8b2db705f = {0.0, 0.0, 0.0, 0.0};
(_webgl_822b69d8b2db705f = mul(transpose(_webgl_285673c8bc48ada1), _webgl_dbb0b86db3589565));
(gl_Position = mul(transpose(_webgl_f867f0698072792a), _webgl_822b69d8b2db705f));
(_webgl_5c81bf65ffac0762 = _webgl_822b69d8b2db705f.xyz);
(_webgl_cc88c95a9917294 = normalize(mul(transpose(_webgl_af3f66d2b52d4d7c), _webgl_7df2295badec0817)));
(_webgl_a0b62b4d8ddcd62b = _webgl_c8bdcf0e19b86378);
(_webgl_5c81bf65ffac0762.x += 0.82511568);
}

struct VS_INPUT
{
    float3 _webgl_1a3d807ca20b2d7a : TEXCOORD0;
    float3 _webgl_7df2295badec0817 : TEXCOORD1;
    float2 _webgl_c8bdcf0e19b86378 : TEXCOORD2;
};

void initAttributes(VS_INPUT input)
{
    _webgl_1a3d807ca20b2d7a = input._webgl_1a3d807ca20b2d7a;
    _webgl_7df2295badec0817 = input._webgl_7df2295badec0817;
    _webgl_c8bdcf0e19b86378 = input._webgl_c8bdcf0e19b86378;
}

struct VS_OUTPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD3;
    float3 v0 : TEXCOORD0;
    float3 v1 : TEXCOORD1;
    float2 v2 : TEXCOORD2;
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
    output.v2 = _webgl_a0b62b4d8ddcd62b;

    return output;
}

