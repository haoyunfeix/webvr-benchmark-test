
// Uniforms

uniform float _webgl_9a8fb5cd706f4c3 : register(c0);
uniform float4x4 _webgl_f867f0698072792a : register(c1);
uniform float4x4 _webgl_285673c8bc48ada1 : register(c5);
static const uint _webgl_995e741fed8cd01c = 0;
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
static float3 _webgl_7df2295badec0817 = {0, 0, 0};
static float2 _webgl_f19cfa196e6c7515 = {0, 0};

static float4 gl_Position = float4(0, 0, 0, 0);

// Varyings
static  float4 _webgl_51798873aa8ff428 = {0, 0, 0, 0};
static  float3 _webgl_5c81bf65ffac0762 = {0, 0, 0};
static  float3 _webgl_85d2dc26c2bd8386 = {0, 0, 0};
static  float3 _webgl_cc88c95a9917294 = {0, 0, 0};
static  float4 _webgl_5ac6563b812ba71b = {0, 0, 0, 0};
static  float _webgl_b702800ba18a8f38 = {0};
static  float2 _webgl_443362e793885325 = {0, 0};

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

void gl_main()
{
(gl_Position = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_443362e793885325 = float2(0.0, 0.0));
(_webgl_b702800ba18a8f38 = 0.0);
(_webgl_5ac6563b812ba71b = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_cc88c95a9917294 = float3(0.0, 0.0, 0.0));
(_webgl_85d2dc26c2bd8386 = float3(0.0, 0.0, 0.0));
(_webgl_5c81bf65ffac0762 = float3(0.0, 0.0, 0.0));
(_webgl_51798873aa8ff428 = float4(0.0, 0.0, 0.0, 0.0));
float3 _webgl_58f7246ea1e7f22e = {0.0, 0.0, 0.0};
float3 _webgl_dff8e395cc090eaa = {0.0, 0.0, 0.0};
float3 _webgl_2e5c02a9d72c89d7 = {0.0, 0.0, 0.0};
float3 _webgl_6310e8631017badd = {0.0, 0.0, 0.0};
float2 _webgl_3ca1594e1514e511 = {0.0, 0.0};
float _webgl_8f7cfeb5dfbf859 = {0.0};
(_webgl_8f7cfeb5dfbf859 = frac((_webgl_f19cfa196e6c7515.y * 10.0)));
float2 _webgl_cfb863ec5a9ad847 = {0.0, 0.0};
(_webgl_cfb863ec5a9ad847.x = _webgl_f19cfa196e6c7515.y);
(_webgl_cfb863ec5a9ad847.y = _webgl_8f7cfeb5dfbf859);
(_webgl_51798873aa8ff428.xy = (_webgl_1a3d807ca20b2d7a.xy + 0.5));
(_webgl_51798873aa8ff428.xy = _webgl_51798873aa8ff428.yx);
(_webgl_51798873aa8ff428.zw = _webgl_51798873aa8ff428.xy);
(_webgl_51798873aa8ff428.xy = (_webgl_51798873aa8ff428.xy / float2(5.0, 1.0)));
(_webgl_51798873aa8ff428.xy = (_webgl_51798873aa8ff428.xy + (floor((_webgl_cfb863ec5a9ad847 * float2(5.0, 1.0))) / float2(5.0, 1.0))));
float _webgl_5ccca921d933644d = {0.0};
(_webgl_5ccca921d933644d = ((dot(gl_texture2DLod0(_webgl_995e741fed8cd01c, (((_webgl_7df2295badec0817.xz / float2(16.0, -16.0)) * 0.5) + 0.5)), float4(5.9604641e-08, 1.5258791e-05, 0.00390625, 1.0)) * -1000.0) + 100.0));
float _webgl_46665ba4a0ebb347 = {0.0};
if ((_webgl_5ccca921d933644d > 0.0099999998))
{
(_webgl_46665ba4a0ebb347 = _webgl_5ccca921d933644d);
}
else
{
(_webgl_46665ba4a0ebb347 = -1.0);
}
float _webgl_73488ceaa0ef8fe3 = {0.0};
(_webgl_73488ceaa0ef8fe3 = (_webgl_7df2295badec0817.y - _webgl_46665ba4a0ebb347));
(_webgl_b702800ba18a8f38 = _webgl_73488ceaa0ef8fe3);
(_webgl_3ca1594e1514e511.y = _webgl_cfb863ec5a9ad847.y);
(_webgl_3ca1594e1514e511.x = (_webgl_f19cfa196e6c7515.y + frac(_webgl_9a8fb5cd706f4c3)));
(_webgl_3ca1594e1514e511.x = lerp(0.25, _webgl_3ca1594e1514e511.x, clamp(_webgl_73488ceaa0ef8fe3, 0.0, 1.0)));
(_webgl_443362e793885325 = (_webgl_51798873aa8ff428.zw / float2(16.0, 5.0)));
(_webgl_443362e793885325 = (_webgl_443362e793885325 + (floor((_webgl_3ca1594e1514e511 * float2(16.0, 5.0))) / float2(16.0, 5.0))));
float _webgl_73ad0cb88cd907dd = {0.0};
(_webgl_73ad0cb88cd907dd = ((_webgl_1a3d807ca20b2d7a.y * _webgl_1a3d807ca20b2d7a.y) * (_webgl_f19cfa196e6c7515.y * 2.0)));
float3 _webgl_4879e67e5ac43730 = {0.0, 0.0, 0.0};
(_webgl_4879e67e5ac43730.xz = float2(0.0, 1.0));
(_webgl_4879e67e5ac43730.y = lerp(-0.5, 0.5, (_webgl_1a3d807ca20b2d7a.y + 0.5)));
float3 _webgl_e25c9b31409332e8 = {0.0, 0.0, 0.0};
(_webgl_e25c9b31409332e8 = normalize(_webgl_4879e67e5ac43730));
(_webgl_6310e8631017badd.z = _webgl_e25c9b31409332e8.z);
float2 _webgl_91c6fbb789786f97 = {0.0, 0.0};
float _webgl_2bd82fd4124d9be3 = {0.0};
(_webgl_2bd82fd4124d9be3 = ((_webgl_f19cfa196e6c7515.y + _webgl_8f7cfeb5dfbf859) * 3.1400001));
float _webgl_3489059248406aa1 = {0.0};
(_webgl_3489059248406aa1 = cos(_webgl_2bd82fd4124d9be3));
float _webgl_9086f39b9ec20200 = {0.0};
(_webgl_9086f39b9ec20200 = sin(_webgl_2bd82fd4124d9be3));
float2x2 _webgl_f26380f436f82532 = {0.0, 0.0, 0.0, 0.0};
(_webgl_f26380f436f82532[0].x = _webgl_3489059248406aa1);
(_webgl_f26380f436f82532[0].y = (-_webgl_9086f39b9ec20200));
(_webgl_f26380f436f82532[1].x = _webgl_9086f39b9ec20200);
(_webgl_f26380f436f82532[1].y = _webgl_3489059248406aa1);
(_webgl_91c6fbb789786f97 = mul(transpose(_webgl_f26380f436f82532), _webgl_1a3d807ca20b2d7a.xy));
float _webgl_5146f2bc1ba9fb06 = {0.0};
(_webgl_5146f2bc1ba9fb06 = ((_webgl_f19cfa196e6c7515.y + _webgl_8f7cfeb5dfbf859) * 3.1400001));
float _webgl_cd6eaaff7ab905f1 = {0.0};
(_webgl_cd6eaaff7ab905f1 = cos(_webgl_5146f2bc1ba9fb06));
float _webgl_cf179e362a646f90 = {0.0};
(_webgl_cf179e362a646f90 = sin(_webgl_5146f2bc1ba9fb06));
float2x2 _webgl_6472b8a26530e78b = {0.0, 0.0, 0.0, 0.0};
(_webgl_6472b8a26530e78b[0].x = _webgl_cd6eaaff7ab905f1);
(_webgl_6472b8a26530e78b[0].y = (-_webgl_cf179e362a646f90));
(_webgl_6472b8a26530e78b[1].x = _webgl_cf179e362a646f90);
(_webgl_6472b8a26530e78b[1].y = _webgl_cd6eaaff7ab905f1);
(_webgl_6310e8631017badd.xy = mul(transpose(_webgl_6472b8a26530e78b), _webgl_e25c9b31409332e8.xy));
float3 _webgl_ba8e8168781d9774 = {0.0, 0.0, 0.0};
(_webgl_ba8e8168781d9774.x = _webgl_91c6fbb789786f97.y);
(_webgl_ba8e8168781d9774.y = _webgl_73ad0cb88cd907dd);
(_webgl_ba8e8168781d9774.z = _webgl_91c6fbb789786f97.x);
float3 _webgl_bd1cf0f064bc6fed = {0.0, 0.0, 0.0};
(_webgl_bd1cf0f064bc6fed = (_webgl_ba8e8168781d9774 * ((_webgl_f19cfa196e6c7515.y * 0.5) + 1.0)));
float3 _webgl_dad807c3e946fcc4 = {0.0, 0.0, 0.0};
(_webgl_dad807c3e946fcc4.x = _webgl_6310e8631017badd.y);
(_webgl_dad807c3e946fcc4.y = (-_webgl_e25c9b31409332e8.z));
(_webgl_dad807c3e946fcc4.z = _webgl_6310e8631017badd.x);
float3 _webgl_4a69825d2061f2e4 = {0.0, 0.0, 0.0};
(_webgl_4a69825d2061f2e4 = normalize(_webgl_dad807c3e946fcc4));
(_webgl_2e5c02a9d72c89d7.y = (_webgl_bd1cf0f064bc6fed.y + 0.1));
float4 _webgl_85f7bf17706eab85 = {0.0, 0.0, 0.0, 0.0};
(_webgl_85f7bf17706eab85 = abs(((frac(((((frac((((_webgl_9a8fb5cd706f4c3 * 0.2) + dot(_webgl_7df2295badec0817, float3(1.0, 1.0, 1.0))) * float4(1.975, 0.79299998, 0.375, 0.193))) * 2.0) - float4(1.0, 1.0, 1.0, 1.0)) * 0.1) + 0.5)) * 2.0) - 1.0)));
float4 _webgl_5cfd34df9dcb15f5 = {0.0, 0.0, 0.0, 0.0};
(_webgl_5cfd34df9dcb15f5 = ((_webgl_85f7bf17706eab85 * _webgl_85f7bf17706eab85) * (3.0 - (2.0 * _webgl_85f7bf17706eab85))));
(_webgl_2e5c02a9d72c89d7.xz = (_webgl_bd1cf0f064bc6fed.xz + (((_webgl_5cfd34df9dcb15f5.xz + _webgl_5cfd34df9dcb15f5.yw) * _webgl_73ad0cb88cd907dd) * 4.0)));
(_webgl_dff8e395cc090eaa.y = _webgl_2e5c02a9d72c89d7.y);
float _webgl_cfe4f407d6834756 = {0.0};
(_webgl_cfe4f407d6834756 = ((_webgl_9a8fb5cd706f4c3 + (_webgl_f19cfa196e6c7515.y * 1.6)) * 4.0));
float _webgl_8eabcbad90e5f7cf = {0.0};
(_webgl_8eabcbad90e5f7cf = ((_webgl_9a8fb5cd706f4c3 + (_webgl_8f7cfeb5dfbf859 * 1.6)) * 4.0));
float _webgl_45bc8ea7e5f7a77c = {0.0};
(_webgl_45bc8ea7e5f7a77c = cos(_webgl_cfe4f407d6834756));
float _webgl_d7a381f02878b408 = {0.0};
(_webgl_d7a381f02878b408 = sin(_webgl_cfe4f407d6834756));
float2x2 _webgl_1e0a569fa8d323c5 = {0.0, 0.0, 0.0, 0.0};
(_webgl_1e0a569fa8d323c5[0].x = _webgl_45bc8ea7e5f7a77c);
(_webgl_1e0a569fa8d323c5[0].y = (-_webgl_d7a381f02878b408));
(_webgl_1e0a569fa8d323c5[1].x = _webgl_d7a381f02878b408);
(_webgl_1e0a569fa8d323c5[1].y = _webgl_45bc8ea7e5f7a77c);
(_webgl_dff8e395cc090eaa.xz = mul(transpose(_webgl_1e0a569fa8d323c5), _webgl_2e5c02a9d72c89d7.xz));
float _webgl_6b1576cc49ca380b = {0.0};
(_webgl_6b1576cc49ca380b = cos(_webgl_8eabcbad90e5f7cf));
float _webgl_82fa7c9f93cc7839 = {0.0};
(_webgl_82fa7c9f93cc7839 = sin(_webgl_8eabcbad90e5f7cf));
float2x2 _webgl_6b8507d7c52a30c5 = {0.0, 0.0, 0.0, 0.0};
(_webgl_6b8507d7c52a30c5[0].x = _webgl_6b1576cc49ca380b);
(_webgl_6b8507d7c52a30c5[0].y = (-_webgl_82fa7c9f93cc7839));
(_webgl_6b8507d7c52a30c5[1].x = _webgl_82fa7c9f93cc7839);
(_webgl_6b8507d7c52a30c5[1].y = _webgl_6b1576cc49ca380b);
(_webgl_dff8e395cc090eaa.xy = mul(transpose(_webgl_6b8507d7c52a30c5), _webgl_dff8e395cc090eaa.yx).yx);
float3 _webgl_bc517a070a88ef4a = {0.0, 0.0, 0.0};
(_webgl_bc517a070a88ef4a = lerp(_webgl_2e5c02a9d72c89d7, _webgl_dff8e395cc090eaa, clamp(_webgl_73488ceaa0ef8fe3, 0.0, 1.0)));
(_webgl_2e5c02a9d72c89d7 = _webgl_bc517a070a88ef4a);
(_webgl_58f7246ea1e7f22e.y = _webgl_4a69825d2061f2e4.y);
float _webgl_a5cbea098f008107 = {0.0};
(_webgl_a5cbea098f008107 = cos(_webgl_cfe4f407d6834756));
float _webgl_e422f03590b051e5 = {0.0};
(_webgl_e422f03590b051e5 = sin(_webgl_cfe4f407d6834756));
float2x2 _webgl_a2ea1ce929cac431 = {0.0, 0.0, 0.0, 0.0};
(_webgl_a2ea1ce929cac431[0].x = _webgl_a5cbea098f008107);
(_webgl_a2ea1ce929cac431[0].y = (-_webgl_e422f03590b051e5));
(_webgl_a2ea1ce929cac431[1].x = _webgl_e422f03590b051e5);
(_webgl_a2ea1ce929cac431[1].y = _webgl_a5cbea098f008107);
(_webgl_58f7246ea1e7f22e.xz = mul(transpose(_webgl_a2ea1ce929cac431), _webgl_4a69825d2061f2e4.xz));
float _webgl_d3a0349fad6621fb = {0.0};
(_webgl_d3a0349fad6621fb = cos(_webgl_cfe4f407d6834756));
float _webgl_48742813565ac55d = {0.0};
(_webgl_48742813565ac55d = sin(_webgl_cfe4f407d6834756));
float2x2 _webgl_f05a73b03fcb4961 = {0.0, 0.0, 0.0, 0.0};
(_webgl_f05a73b03fcb4961[0].x = _webgl_d3a0349fad6621fb);
(_webgl_f05a73b03fcb4961[0].y = (-_webgl_48742813565ac55d));
(_webgl_f05a73b03fcb4961[1].x = _webgl_48742813565ac55d);
(_webgl_f05a73b03fcb4961[1].y = _webgl_d3a0349fad6621fb);
float4 _webgl_bb4c022d8fffa1de = {0.0, 0.0, 0.0, 0.0};
(_webgl_bb4c022d8fffa1de.x = _webgl_d3a0349fad6621fb);
(_webgl_bb4c022d8fffa1de.y = (-_webgl_48742813565ac55d));
(_webgl_bb4c022d8fffa1de.z = _webgl_48742813565ac55d);
(_webgl_bb4c022d8fffa1de.w = _webgl_d3a0349fad6621fb);
(_webgl_5ac6563b812ba71b = _webgl_bb4c022d8fffa1de);
(_webgl_58f7246ea1e7f22e.xy = mul(transpose(_webgl_f05a73b03fcb4961), _webgl_58f7246ea1e7f22e.yx).yx);
(_webgl_cc88c95a9917294 = normalize(lerp(_webgl_4a69825d2061f2e4, _webgl_58f7246ea1e7f22e, clamp(_webgl_73488ceaa0ef8fe3, 0.0, 1.0))));
float3 _webgl_6cd3ea4a4d7f2e24 = {0.0, 0.0, 0.0};
(_webgl_6cd3ea4a4d7f2e24 = ((_webgl_bc517a070a88ef4a * 0.30000001) + _webgl_7df2295badec0817));
(_webgl_85d2dc26c2bd8386 = _webgl_6cd3ea4a4d7f2e24);
float4 _webgl_17eaf291e44ff974 = {0.0, 0.0, 0.0, 0.0};
(_webgl_17eaf291e44ff974.w = 1.0);
(_webgl_17eaf291e44ff974.xyz = _webgl_6cd3ea4a4d7f2e24);
(_webgl_5c81bf65ffac0762 = mul(transpose(_webgl_285673c8bc48ada1), _webgl_17eaf291e44ff974).xyz);
float4 _webgl_265b07338d1f26ef = {0.0, 0.0, 0.0, 0.0};
(_webgl_265b07338d1f26ef.w = 1.0);
(_webgl_265b07338d1f26ef.xyz = _webgl_5c81bf65ffac0762);
(gl_Position = mul(transpose(_webgl_f867f0698072792a), _webgl_265b07338d1f26ef));
(_webgl_5c81bf65ffac0762.x += 0.97583818);
}

struct VS_INPUT
{
    float3 _webgl_1a3d807ca20b2d7a : TEXCOORD0;
    float3 _webgl_7df2295badec0817 : TEXCOORD1;
    float2 _webgl_f19cfa196e6c7515 : TEXCOORD2;
};

void initAttributes(VS_INPUT input)
{
    _webgl_1a3d807ca20b2d7a = input._webgl_1a3d807ca20b2d7a;
    _webgl_7df2295badec0817 = input._webgl_7df2295badec0817;
    _webgl_f19cfa196e6c7515 = input._webgl_f19cfa196e6c7515;
}

struct VS_OUTPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD5;
    float4 v0 : TEXCOORD0;
    float3 v1 : TEXCOORD1;
    float3 v2 : TEXCOORD2;
    float3 v3 : TEXCOORD3;
    float v4 : TEXCOORD4;
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
    output.v0 = _webgl_51798873aa8ff428;
    output.v1 = _webgl_5c81bf65ffac0762;
    output.v2 = _webgl_85d2dc26c2bd8386;
    output.v3 = _webgl_cc88c95a9917294;
    output.v4 = _webgl_b702800ba18a8f38;

    return output;
}

