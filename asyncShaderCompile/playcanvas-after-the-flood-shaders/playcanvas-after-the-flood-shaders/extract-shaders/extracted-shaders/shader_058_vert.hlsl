
#ifdef ANGLE_ENABLE_LOOP_FLATTEN
#define LOOP [loop]
#define FLATTEN [flatten]
#else
#define LOOP
#define FLATTEN
#endif
// Attributes
static float2 _webgl_1a3d807ca20b2d7a = {0, 0};

static float4 gl_Position = float4(0, 0, 0, 0);

// Varyings
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
float4 _webgl_dbb0b86db3589565 = {0.0, 0.0, 0.0, 0.0};
(_webgl_dbb0b86db3589565.zw = float2(0.5, 1.0));
(_webgl_dbb0b86db3589565.xy = _webgl_1a3d807ca20b2d7a);
(gl_Position = _webgl_dbb0b86db3589565);
(_webgl_a0b62b4d8ddcd62b = ((_webgl_1a3d807ca20b2d7a * 0.5) + 0.5));
(gl_Position.x += 0.37702468);
}

struct VS_INPUT
{
    float2 _webgl_1a3d807ca20b2d7a : TEXCOORD0;
};

void initAttributes(VS_INPUT input)
{
    _webgl_1a3d807ca20b2d7a = input._webgl_1a3d807ca20b2d7a;
}

struct VS_OUTPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD1;
    float2 v0 : TEXCOORD0;
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
    output.v0 = _webgl_a0b62b4d8ddcd62b;

    return output;
}

