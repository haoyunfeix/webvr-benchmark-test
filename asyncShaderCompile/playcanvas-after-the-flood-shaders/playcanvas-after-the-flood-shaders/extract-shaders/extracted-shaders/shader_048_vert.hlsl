
float float_ctor(float x0)
{
    return float(x0);
}
float2 vec2_ctor(float x0, float x1)
{
    return float2(x0, x1);
}
float4 vec4_ctor(float3 x0, float x1)
{
    return float4(x0, x1);
}
float4x4 mat4_ctor(float x0, float x1, float x2, float x3, float x4, float x5, float x6, float x7, float x8, float x9, float x10, float x11, float x12, float x13, float x14, float x15)
{
    return float4x4(x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15);
}
// Uniforms

uniform float4x4 _webgl_f867f0698072792a : register(c0);
uniform float2 _webgl_232d04a919ce2037 : register(c4);
uniform float3 _webgl_c3112bc8f2a3d1d0 : register(c5);
uniform float4x4 _webgl_9cb0bb483ea1c71c : register(c6);
uniform float _webgl_3001886dadbe6f54 : register(c10);
static const uint _webgl_b3d4ddd782c621f4 = 0;
uniform Texture2D<float4> textures2D[1] : register(t0);
uniform SamplerState samplers2D[1] : register(s0);
#ifdef ANGLE_ENABLE_LOOP_FLATTEN
#define LOOP [loop]
#define FLATTEN [flatten]
#else
#define LOOP
#define FLATTEN
#endif
// Attributes
static float3 _webgl_1a3d807ca20b2d7a = {0, 0, 0};
static float4 _webgl_29f5dfe38630ae0c = {0, 0, 0, 0};
static float4 _webgl_a245f16f73405fdf = {0, 0, 0, 0};

static float4 gl_Position = float4(0, 0, 0, 0);

// Varyings
static  float _webgl_215477360de748ea = {0};

cbuffer DriverConstants : register(b1)
{
    float4 dx_ViewAdjust : packoffset(c1);
    float2 dx_ViewCoords : packoffset(c2);
    float2 dx_ViewScale  : packoffset(c3);
    struct SamplerMetadata
    {
        int baseLevel;
        int internalFormatBits;
        int wrapModes;
        int padding;
    };
    SamplerMetadata samplerMetadata[1] : packoffset(c4);
};

float4 gl_texture2DLod0(uint samplerIndex, float2 t)
{
    return textures2D[samplerIndex].SampleLevel(samplers2D[samplerIndex], float2(t.x, t.y), 0);
}

float mod_emu(float x, float y)
{
    return x - y * floor(x / y);
}


void f_initGlobals();
;
static float3 _webgl_74cda71a008d77ed = {0, 0, 0};
static float4x4 _webgl_e3cc889e2b93aefa = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
float4x4 f_webgl_e1d4b9105545937(const float _webgl_6fdd29f02130ae3a)
{
float _webgl_bf8edcc29be8a79d = (_webgl_6fdd29f02130ae3a * 4.0);
float _webgl_4fc82888d13de398 = mod_emu(_webgl_bf8edcc29be8a79d, float_ctor(_webgl_232d04a919ce2037.x));
float _webgl_75c422100f18a043 = floor((_webgl_bf8edcc29be8a79d / float_ctor(_webgl_232d04a919ce2037.x)));
float _webgl_d683b1a2c10b9450 = (1.0 / float_ctor(_webgl_232d04a919ce2037.x));
float _webgl_48a6da0821a6ca81 = (1.0 / float_ctor(_webgl_232d04a919ce2037.y));
(_webgl_75c422100f18a043 = (_webgl_48a6da0821a6ca81 * (_webgl_75c422100f18a043 + 0.5)));
float4 _webgl_4ac1b12f8783cfef = gl_texture2DLod0(_webgl_b3d4ddd782c621f4, vec2_ctor((_webgl_d683b1a2c10b9450 * (_webgl_4fc82888d13de398 + 0.5)), _webgl_75c422100f18a043));
float4 _webgl_c49bbe71f9ba79c7 = gl_texture2DLod0(_webgl_b3d4ddd782c621f4, vec2_ctor((_webgl_d683b1a2c10b9450 * (_webgl_4fc82888d13de398 + 1.5)), _webgl_75c422100f18a043));
float4 _webgl_37eb5aac288859c2 = gl_texture2DLod0(_webgl_b3d4ddd782c621f4, vec2_ctor((_webgl_d683b1a2c10b9450 * (_webgl_4fc82888d13de398 + 2.5)), _webgl_75c422100f18a043));
float4 _webgl_67baec3b8f33f149 = gl_texture2DLod0(_webgl_b3d4ddd782c621f4, vec2_ctor((_webgl_d683b1a2c10b9450 * (_webgl_4fc82888d13de398 + 3.5)), _webgl_75c422100f18a043));
float4 _s410 = _webgl_4ac1b12f8783cfef;
float4 _s411 = _webgl_c49bbe71f9ba79c7;
float4 _s412 = _webgl_37eb5aac288859c2;
float4 _s413 = _webgl_67baec3b8f33f149;
float4x4 _webgl_9939b9d3b4dcb3f6 = mat4_ctor(_s410[0], _s410[1], _s410[2], _s410[3], _s411[0], _s411[1], _s411[2], _s411[3], _s412[0], _s412[1], _s412[2], _s412[3], _s413[0], _s413[1], _s413[2], _s413[3]);
return _webgl_9939b9d3b4dcb3f6;
}
float4x4 f_webgl_ca037f2452e5345c()
{
return ((((f_webgl_e1d4b9105545937(_webgl_a245f16f73405fdf.x) * _webgl_29f5dfe38630ae0c.x) + (f_webgl_e1d4b9105545937(_webgl_a245f16f73405fdf.y) * _webgl_29f5dfe38630ae0c.y)) + (f_webgl_e1d4b9105545937(_webgl_a245f16f73405fdf.z) * _webgl_29f5dfe38630ae0c.z)) + (f_webgl_e1d4b9105545937(_webgl_a245f16f73405fdf.w) * _webgl_29f5dfe38630ae0c.w));
}
float4 f_webgl_1d95b8738c958664()
{
(_webgl_e3cc889e2b93aefa = f_webgl_ca037f2452e5345c());
float4 _webgl_e9ddddf9e551de3f = mul(transpose(_webgl_e3cc889e2b93aefa), vec4_ctor(_webgl_1a3d807ca20b2d7a, 1.0));
(_webgl_e9ddddf9e551de3f.xyz += _webgl_c3112bc8f2a3d1d0);
(_webgl_74cda71a008d77ed = _webgl_e9ddddf9e551de3f.xyz);
return mul(transpose(_webgl_f867f0698072792a), _webgl_e9ddddf9e551de3f);
}
float3 f_webgl_819389c4c38b43d4()
{
return _webgl_74cda71a008d77ed;
}
void gl_main()
{
f_initGlobals();
(gl_Position = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_215477360de748ea = 0.0);
(gl_Position = f_webgl_1d95b8738c958664());
(_webgl_215477360de748ea = ((-mul(transpose(_webgl_9cb0bb483ea1c71c), vec4_ctor(f_webgl_819389c4c38b43d4(), 1.0)).z) / _webgl_3001886dadbe6f54));
(gl_Position.x += 0.52656782);
}
void f_initGlobals()
{
(_webgl_74cda71a008d77ed = float3(0.0, 0.0, 0.0));
(_webgl_e3cc889e2b93aefa = float4x4(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0));
}

struct VS_INPUT
{
    float3 _webgl_1a3d807ca20b2d7a : TEXCOORD0;
    float4 _webgl_29f5dfe38630ae0c : TEXCOORD1;
    float4 _webgl_a245f16f73405fdf : TEXCOORD2;
};

void initAttributes(VS_INPUT input)
{
    _webgl_1a3d807ca20b2d7a = input._webgl_1a3d807ca20b2d7a;
    _webgl_29f5dfe38630ae0c = input._webgl_29f5dfe38630ae0c;
    _webgl_a245f16f73405fdf = input._webgl_a245f16f73405fdf;
}

struct VS_OUTPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD1;
    float v0 : TEXCOORD0;
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
    output.v0 = _webgl_215477360de748ea;

    return output;
}

