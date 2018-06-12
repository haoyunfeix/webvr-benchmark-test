
// Uniforms

uniform float4x4 _webgl_f867f0698072792a : register(c0);
uniform float4x4 _webgl_285673c8bc48ada1 : register(c4);
uniform float3 _webgl_35c9514d594e36f3 : register(c8);
uniform float _webgl_f26f4f7166479737 : register(c9);
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
static  float3 _webgl_5c81bf65ffac0762 = {0, 0, 0};
static  float2 _webgl_a0b62b4d8ddcd62b = {0, 0};
static  float _webgl_5b5fd660b5715fee = {0};

cbuffer DriverConstants : register(b1)
{
    float4 dx_ViewAdjust : packoffset(c1);
    float2 dx_ViewCoords : packoffset(c2);
    float2 dx_ViewScale  : packoffset(c3);
};

void gl_main()
{
(gl_Position = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_5b5fd660b5715fee = 0.0);
(_webgl_a0b62b4d8ddcd62b = float2(0.0, 0.0));
(_webgl_5c81bf65ffac0762 = float3(0.0, 0.0, 0.0));
float3x3 _webgl_148050cf3c679472 = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
float3 _webgl_20047e1b5822c108 = {0.0, 0.0, 0.0};
float4 _webgl_38fab0a87ea73fe6 = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_49a0cb6f9237aa8 = {0.0, 0.0, 0.0, 0.0};
(_webgl_49a0cb6f9237aa8.w = 1.0);
(_webgl_49a0cb6f9237aa8.xyz = _webgl_1a3d807ca20b2d7a);
(_webgl_38fab0a87ea73fe6.w = mul(transpose(_webgl_285673c8bc48ada1), _webgl_49a0cb6f9237aa8).w);
float3 _webgl_3c71294eb0cb894e = {0.0, 0.0, 0.0};
(_webgl_3c71294eb0cb894e.x = _webgl_285673c8bc48ada1[3].x);
(_webgl_3c71294eb0cb894e.y = _webgl_285673c8bc48ada1[3].y);
(_webgl_3c71294eb0cb894e.z = _webgl_285673c8bc48ada1[3].z);
float3 _webgl_8f7cfeb5dfbf859 = {0.0, 0.0, 0.0};
(_webgl_8f7cfeb5dfbf859.x = _webgl_285673c8bc48ada1[2].x);
(_webgl_8f7cfeb5dfbf859.y = _webgl_285673c8bc48ada1[2].y);
(_webgl_8f7cfeb5dfbf859.z = _webgl_285673c8bc48ada1[2].z);
float3 _webgl_cfb863ec5a9ad847 = {0.0, 0.0, 0.0};
(_webgl_cfb863ec5a9ad847 = normalize(_webgl_8f7cfeb5dfbf859));
float3 _webgl_5ccca921d933644d = {0.0, 0.0, 0.0};
(_webgl_5ccca921d933644d = normalize((_webgl_35c9514d594e36f3 - _webgl_3c71294eb0cb894e)));
float3 _webgl_46665ba4a0ebb347 = {0.0, 0.0, 0.0};
(_webgl_46665ba4a0ebb347.x = _webgl_285673c8bc48ada1[0].x);
(_webgl_46665ba4a0ebb347.y = _webgl_285673c8bc48ada1[0].y);
(_webgl_46665ba4a0ebb347.z = _webgl_285673c8bc48ada1[0].z);
(_webgl_20047e1b5822c108 = (normalize(((_webgl_cfb863ec5a9ad847.yzx * _webgl_5ccca921d933644d.zxy) - (_webgl_cfb863ec5a9ad847.zxy * _webgl_5ccca921d933644d.yzx))) * sqrt(dot(_webgl_46665ba4a0ebb347, _webgl_46665ba4a0ebb347))));
float3x3 _webgl_73488ceaa0ef8fe3 = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
(_webgl_73488ceaa0ef8fe3[0] = _webgl_285673c8bc48ada1[0].xyz);
(_webgl_73488ceaa0ef8fe3[1] = _webgl_285673c8bc48ada1[1].xyz);
(_webgl_73488ceaa0ef8fe3[2] = _webgl_285673c8bc48ada1[2].xyz);
(_webgl_148050cf3c679472 = _webgl_73488ceaa0ef8fe3);
float3 _webgl_73ad0cb88cd907dd = {0.0, 0.0, 0.0};
(_webgl_73ad0cb88cd907dd.yz = _webgl_73488ceaa0ef8fe3[0].yz);
(_webgl_73ad0cb88cd907dd.x = _webgl_20047e1b5822c108.x);
(_webgl_148050cf3c679472[0] = _webgl_73ad0cb88cd907dd);
float3 _webgl_4879e67e5ac43730 = {0.0, 0.0, 0.0};
(_webgl_4879e67e5ac43730.xz = _webgl_148050cf3c679472[0].xz);
(_webgl_4879e67e5ac43730.y = _webgl_20047e1b5822c108.y);
(_webgl_148050cf3c679472[0] = _webgl_4879e67e5ac43730);
float3 _webgl_e25c9b31409332e8 = {0.0, 0.0, 0.0};
(_webgl_e25c9b31409332e8.xy = _webgl_148050cf3c679472[0].xy);
(_webgl_e25c9b31409332e8.z = _webgl_20047e1b5822c108.z);
(_webgl_148050cf3c679472[0] = _webgl_e25c9b31409332e8);
float3 _webgl_91c6fbb789786f97 = {0.0, 0.0, 0.0};
(_webgl_91c6fbb789786f97.yz = _webgl_148050cf3c679472[1].yz);
(_webgl_91c6fbb789786f97.x = _webgl_5ccca921d933644d.x);
(_webgl_148050cf3c679472[1] = _webgl_91c6fbb789786f97);
float3 _webgl_9e247bb82e5c20e0 = {0.0, 0.0, 0.0};
(_webgl_9e247bb82e5c20e0.xz = _webgl_148050cf3c679472[1].xz);
(_webgl_9e247bb82e5c20e0.y = _webgl_5ccca921d933644d.y);
(_webgl_148050cf3c679472[1] = _webgl_9e247bb82e5c20e0);
float3 _webgl_3489059248406aa1 = {0.0, 0.0, 0.0};
(_webgl_3489059248406aa1.xy = _webgl_148050cf3c679472[1].xy);
(_webgl_3489059248406aa1.z = _webgl_5ccca921d933644d.z);
(_webgl_148050cf3c679472[1] = _webgl_3489059248406aa1);
(_webgl_38fab0a87ea73fe6.xyz = (mul(transpose(_webgl_148050cf3c679472), _webgl_1a3d807ca20b2d7a) + _webgl_3c71294eb0cb894e));
(_webgl_5b5fd660b5715fee = (1.0 - abs(dot(_webgl_cfb863ec5a9ad847, (-normalize((_webgl_35c9514d594e36f3 - _webgl_38fab0a87ea73fe6.xyz)))))));
(_webgl_5b5fd660b5715fee = (_webgl_5b5fd660b5715fee * (_webgl_5b5fd660b5715fee * _webgl_f26f4f7166479737)));
(gl_Position = mul(transpose(_webgl_f867f0698072792a), _webgl_38fab0a87ea73fe6));
(_webgl_5c81bf65ffac0762 = _webgl_38fab0a87ea73fe6.xyz);
(_webgl_a0b62b4d8ddcd62b = _webgl_c8bdcf0e19b86378);
(_webgl_5c81bf65ffac0762.x += 0.53084505);
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
    float4 gl_Position : TEXCOORD3;
    float3 v0 : TEXCOORD0;
    float2 v1 : TEXCOORD1;
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
    output.v1 = _webgl_a0b62b4d8ddcd62b;
    output.v2 = _webgl_5b5fd660b5715fee;

    return output;
}

