
// Uniforms

uniform float4x4 _webgl_9cb0bb483ea1c71c : register(c0);
uniform float4x4 _webgl_bb04e5c336045828 : register(c4);
#ifdef ANGLE_ENABLE_LOOP_FLATTEN
#define LOOP [loop]
#define FLATTEN [flatten]
#else
#define LOOP
#define FLATTEN
#endif
// Attributes
static float3 _webgl_1a3d807ca20b2d7a = {0, 0, 0};

static float4 gl_Position = float4(0, 0, 0, 0);

// Varyings
static  float3 _webgl_7d1e4db7ab4fa918 = {0, 0, 0};

cbuffer DriverConstants : register(b1)
{
    float4 dx_ViewAdjust : packoffset(c1);
    float2 dx_ViewCoords : packoffset(c2);
    float2 dx_ViewScale  : packoffset(c3);
};

void gl_main()
{
(gl_Position = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_7d1e4db7ab4fa918 = float3(0.0, 0.0, 0.0));
float4x4 _webgl_ece842a1c1f082ba = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
(_webgl_ece842a1c1f082ba = _webgl_9cb0bb483ea1c71c);
float4 _webgl_822b69d8b2db705f = {0.0, 0.0, 0.0, 0.0};
(_webgl_822b69d8b2db705f.xyw = _webgl_9cb0bb483ea1c71c[3].xyw);
(_webgl_822b69d8b2db705f.z = 0.0);
(_webgl_ece842a1c1f082ba[3] = _webgl_822b69d8b2db705f);
float4 _webgl_f28d072c82c61bea = {0.0, 0.0, 0.0, 0.0};
(_webgl_f28d072c82c61bea.xzw = _webgl_ece842a1c1f082ba[3].xzw);
(_webgl_f28d072c82c61bea.y = _webgl_822b69d8b2db705f.z);
(_webgl_ece842a1c1f082ba[3] = _webgl_f28d072c82c61bea);
float4 _webgl_49a0cb6f9237aa8 = {0.0, 0.0, 0.0, 0.0};
(_webgl_49a0cb6f9237aa8.yzw = _webgl_ece842a1c1f082ba[3].yzw);
(_webgl_49a0cb6f9237aa8.x = _webgl_f28d072c82c61bea.y);
(_webgl_ece842a1c1f082ba[3] = _webgl_49a0cb6f9237aa8);
float4 _webgl_3c71294eb0cb894e = {0.0, 0.0, 0.0, 0.0};
(_webgl_3c71294eb0cb894e.w = 1.0);
(_webgl_3c71294eb0cb894e.xyz = _webgl_1a3d807ca20b2d7a);
(gl_Position = mul(transpose(transpose(mul(transpose(_webgl_bb04e5c336045828), transpose(_webgl_ece842a1c1f082ba)))), _webgl_3c71294eb0cb894e));
(gl_Position.z = (gl_Position.w - 4.9999999e-06));
(_webgl_7d1e4db7ab4fa918.y = _webgl_1a3d807ca20b2d7a.y);
float2x2 _webgl_8f7cfeb5dfbf859 = {0.0, 0.0, 0.0, 0.0};
(_webgl_8f7cfeb5dfbf859[0].x = 0.92106098);
(_webgl_8f7cfeb5dfbf859[0].y = -0.3894183);
(_webgl_8f7cfeb5dfbf859[1].x = 0.3894183);
(_webgl_8f7cfeb5dfbf859[1].y = 0.92106098);
(_webgl_7d1e4db7ab4fa918.xz = mul(transpose(_webgl_8f7cfeb5dfbf859), _webgl_1a3d807ca20b2d7a.xz));
(gl_Position.x += 0.17126097);
}

struct VS_INPUT
{
    float3 _webgl_1a3d807ca20b2d7a : TEXCOORD0;
};

void initAttributes(VS_INPUT input)
{
    _webgl_1a3d807ca20b2d7a = input._webgl_1a3d807ca20b2d7a;
}

struct VS_OUTPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD1;
    float3 v0 : TEXCOORD0;
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
    output.v0 = _webgl_7d1e4db7ab4fa918;

    return output;
}

