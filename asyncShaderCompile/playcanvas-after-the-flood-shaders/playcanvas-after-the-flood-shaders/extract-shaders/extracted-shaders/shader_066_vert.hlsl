
float4 vec4_ctor(float3 x0, float x1)
{
    return float4(x0, x1);
}
// Uniforms

uniform float4x4 _webgl_285673c8bc48ada1 : register(c0);
uniform float4x4 _webgl_f867f0698072792a : register(c4);
#ifdef ANGLE_ENABLE_LOOP_FLATTEN
#define LOOP [loop]
#define FLATTEN [flatten]
#else
#define LOOP
#define FLATTEN
#endif
// Attributes
static float3 _webgl_1a3d807ca20b2d7a = {0, 0, 0};
static float2 _webgl_c8bdcf0e19b86378 = {0, 0};

static float4 gl_Position = float4(0, 0, 0, 0);

// Varyings
static  float2 _webgl_a0b62b4d8ddcd62b = {0, 0};
static  float3 _webgl_574c5c41cd2da6c7 = {0, 0, 0};

cbuffer DriverConstants : register(b1)
{
    float4 dx_ViewAdjust : packoffset(c1);
    float2 dx_ViewCoords : packoffset(c2);
    float2 dx_ViewScale  : packoffset(c3);
};

void f_initGlobals();
;
static float3 _webgl_74cda71a008d77ed = {0, 0, 0};
static float4x4 _webgl_e3cc889e2b93aefa = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
float4x4 f_webgl_ca037f2452e5345c()
{
return _webgl_285673c8bc48ada1;
}
float4 f_webgl_1d95b8738c958664()
{
(_webgl_e3cc889e2b93aefa = f_webgl_ca037f2452e5345c());
float4 _webgl_e9ddddf9e551de3f = mul(transpose(_webgl_e3cc889e2b93aefa), vec4_ctor(_webgl_1a3d807ca20b2d7a, 1.0));
(_webgl_74cda71a008d77ed = _webgl_e9ddddf9e551de3f.xyz);
return mul(transpose(_webgl_f867f0698072792a), _webgl_e9ddddf9e551de3f);
}
void gl_main()
{
f_initGlobals();
(gl_Position = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_574c5c41cd2da6c7 = float3(0.0, 0.0, 0.0));
(_webgl_a0b62b4d8ddcd62b = float2(0.0, 0.0));
(gl_Position = f_webgl_1d95b8738c958664());
(_webgl_a0b62b4d8ddcd62b = _webgl_c8bdcf0e19b86378);
(_webgl_574c5c41cd2da6c7 = _webgl_74cda71a008d77ed);
(gl_Position.x += 0.031359505);
}
void f_initGlobals()
{
(_webgl_74cda71a008d77ed = float3(0.0, 0.0, 0.0));
(_webgl_e3cc889e2b93aefa = float4x4(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0));
}

struct VS_INPUT
{
    float3 _webgl_1a3d807ca20b2d7a : TEXCOORD0;
    float2 _webgl_c8bdcf0e19b86378 : TEXCOORD1;
};

void initAttributes(VS_INPUT input)
{
    _webgl_1a3d807ca20b2d7a = input._webgl_1a3d807ca20b2d7a;
    _webgl_c8bdcf0e19b86378 = input._webgl_c8bdcf0e19b86378;
}

struct VS_OUTPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD2;
    float3 v0 : TEXCOORD0;
    float2 v1 : TEXCOORD1;
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
    output.v0 = _webgl_574c5c41cd2da6c7;
    output.v1 = _webgl_a0b62b4d8ddcd62b;

    return output;
}

