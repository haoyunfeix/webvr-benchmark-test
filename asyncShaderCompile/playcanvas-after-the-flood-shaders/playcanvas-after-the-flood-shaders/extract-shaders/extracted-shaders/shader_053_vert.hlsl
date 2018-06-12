
float4 vec4_ctor(float3 x0, float x1)
{
    return float4(x0, x1);
}
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
static float3 _webgl_a955988e3e407b8d = {0, 0, 0};

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
float4x4 _webgl_71e60a8105f37492 = _webgl_9cb0bb483ea1c71c;
(_webgl_71e60a8105f37492[3][0] = (_webgl_71e60a8105f37492[3][1] = (_webgl_71e60a8105f37492[3][2] = 0.0)));
(gl_Position = mul(transpose(transpose(mul(transpose(_webgl_bb04e5c336045828), transpose(_webgl_71e60a8105f37492)))), vec4_ctor(_webgl_a955988e3e407b8d, 1.0)));
(gl_Position.z = (gl_Position.w - 9.9999997e-06));
(_webgl_7d1e4db7ab4fa918 = _webgl_a955988e3e407b8d);
(_webgl_7d1e4db7ab4fa918.x *= -1.0);
(gl_Position.x += 0.38064426);
}

struct VS_INPUT
{
    float3 _webgl_a955988e3e407b8d : TEXCOORD0;
};

void initAttributes(VS_INPUT input)
{
    _webgl_a955988e3e407b8d = input._webgl_a955988e3e407b8d;
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

