
// Uniforms

uniform float3 _webgl_35c9514d594e36f3 : register(c0);
uniform float3 _webgl_1855da97c0758e43 : register(c1);
uniform float3 _webgl_16d8e27babe3e15e : register(c2);
uniform float _webgl_1a380463a8bc7359 : register(c3);
uniform float3 _webgl_35202d7eed2427d : register(c4);
uniform float _webgl_2dd2385497bef344 : register(c5);
uniform float _webgl_755af7149e45828a : register(c6);
uniform float3 _webgl_10617a1597481d62 : register(c7);
uniform float3 _webgl_71e3cad5e42a89bb : register(c8);
uniform float _webgl_1c82dc879cda6ae2 : register(c9);
uniform float3 _webgl_a8a39767ea2c8eb7 : register(c10);
uniform float _webgl_e6010fd023fb284f : register(c11);
uniform float _webgl_34ab7d99e8e69aa4 : register(c12);
uniform float3 _webgl_5886825673b0276f : register(c13);
uniform float3 _webgl_a0d6d9dec5ad53fe : register(c14);
uniform float _webgl_2f0c4fd3d54f412 : register(c15);
uniform float3 _webgl_c74e73a88f49c8c7 : register(c16);
uniform float _webgl_e3e131ff0e27f0c0 : register(c17);
uniform float _webgl_b1fe332e1acaed26 : register(c18);
uniform float4x4 _webgl_f2f5cb546e387827 : register(c19);
uniform float4 _webgl_a4c24d4920e1444a : register(c23);
uniform float _webgl_c72812b39ae458b : register(c24);
uniform float3 _webgl_3b3710b9db4788a7 : register(c25);
uniform float _webgl_5985a6d987efdfc3 : register(c26);
uniform float _webgl_ae2115093f2ac183 : register(c27);
uniform float3 _webgl_2d459f8069f64681 : register(c28);
static const uint _webgl_615055869f1b0841 = 0;
static const uint _webgl_8167d7febf3081fa = 1;
static const uint _webgl_92406ab4e48f953a = 2;
uniform Texture2D<float4> textures2D[3] : register(t0);
uniform SamplerState samplers2D[3] : register(s0);
static const uint _webgl_7b5e6932dac63e22 = 3;
static const uint textureIndexOffsetCube = 3;
static const uint samplerIndexOffsetCube = 3;
uniform TextureCube<float4> texturesCube[1] : register(t3);
uniform SamplerState samplersCube[1] : register(s3);
#ifdef ANGLE_ENABLE_LOOP_FLATTEN
#define LOOP [loop]
#define FLATTEN [flatten]
#else
#define LOOP
#define FLATTEN
#endif
// Varyings
static  float3 _webgl_5c81bf65ffac0762 = {0, 0, 0};
static  float3 _webgl_cc88c95a9917294 = {0, 0, 0};
static  float3 _webgl_6580760fc7b305a7 = {0, 0, 0};
static  float3 _webgl_6ccc0e73d2b9d4de = {0, 0, 0};
static  float2 _webgl_a0b62b4d8ddcd62b = {0, 0};

static float4 out_webgl_9b98566002e557b5 = {0, 0, 0, 0};

cbuffer DriverConstants : register(b1)
{
    struct SamplerMetadata
    {
        int baseLevel;
        int internalFormatBits;
        int wrapModes;
        int padding;
    };
    SamplerMetadata samplerMetadata[4] : packoffset(c4);
};

float4 gl_texture2D(uint samplerIndex, float2 t)
{
    return textures2D[samplerIndex].Sample(samplers2D[samplerIndex], float2(t.x, t.y));
}

float4 gl_textureCube(uint samplerIndex, float3 t)
{
    const uint textureIndex = samplerIndex - textureIndexOffsetCube;
    const uint samplerArrayIndex = samplerIndex - samplerIndexOffsetCube;
    return texturesCube[textureIndex].Sample(samplersCube[samplerArrayIndex], float3(t.x, t.y, t.z));
}

void f_initGlobals();
;
static float3 _webgl_d189f73da6eb4d5b = {0, 0, 0};
static float3 _webgl_540f7c123bdf52c0 = {0, 0, 0};
static float3 _webgl_11482133dc10ada = {0, 0, 0};
static float _webgl_9251dcdacdfa452 = {0};
void gl_main()
{
f_initGlobals();
(out_webgl_9b98566002e557b5 = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_540f7c123bdf52c0 = float3(0.0, 0.0, 0.0));
float3x3 _webgl_dbb0b86db3589565 = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
(_webgl_dbb0b86db3589565[0] = normalize(_webgl_6580760fc7b305a7));
(_webgl_dbb0b86db3589565[1] = normalize(_webgl_6ccc0e73d2b9d4de));
(_webgl_dbb0b86db3589565[2] = normalize(_webgl_cc88c95a9917294));
(_webgl_d189f73da6eb4d5b = mul(transpose(_webgl_dbb0b86db3589565), normalize(lerp(float3(0.0, 0.0, 1.0), ((gl_texture2D(_webgl_8167d7febf3081fa, _webgl_a0b62b4d8ddcd62b).xyz * 2.0) - 1.0), _webgl_c72812b39ae458b))));
float4 _webgl_30d517b239db7bc6 = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_f28d072c82c61bea = {0.0, 0.0, 0.0, 0.0};
(_webgl_f28d072c82c61bea = gl_texture2D(_webgl_92406ab4e48f953a, _webgl_a0b62b4d8ddcd62b));
(_webgl_30d517b239db7bc6.w = _webgl_f28d072c82c61bea.w);
(_webgl_30d517b239db7bc6.xyz = pow(_webgl_f28d072c82c61bea.xyz, float3(2.2, 2.2, 2.2)));
float3 _webgl_8ecc9ed40e399f67 = {0.0, 0.0, 0.0};
float3 _webgl_d571af2d6c7dce4a = {0.0, 0.0, 0.0};
(_webgl_d571af2d6c7dce4a = _webgl_d189f73da6eb4d5b);
float _webgl_8f7cfeb5dfbf859 = {0.0};
(_webgl_8f7cfeb5dfbf859 = max(max(abs(_webgl_d189f73da6eb4d5b.x), abs(_webgl_d189f73da6eb4d5b.y)), abs(_webgl_d189f73da6eb4d5b.z)));
float _webgl_cfb863ec5a9ad847 = {0.0};
(_webgl_cfb863ec5a9ad847 = abs(_webgl_d189f73da6eb4d5b.x));
if ((_webgl_cfb863ec5a9ad847 != _webgl_8f7cfeb5dfbf859))
{
(_webgl_d571af2d6c7dce4a.x = (_webgl_d189f73da6eb4d5b.x * 0.75));
}
float _webgl_5ccca921d933644d = {0.0};
(_webgl_5ccca921d933644d = abs(_webgl_d189f73da6eb4d5b.y));
if ((_webgl_5ccca921d933644d != _webgl_8f7cfeb5dfbf859))
{
(_webgl_d571af2d6c7dce4a.y = (_webgl_d189f73da6eb4d5b.y * 0.75));
}
float _webgl_46665ba4a0ebb347 = {0.0};
(_webgl_46665ba4a0ebb347 = abs(_webgl_d189f73da6eb4d5b.z));
if ((_webgl_46665ba4a0ebb347 != _webgl_8f7cfeb5dfbf859))
{
(_webgl_d571af2d6c7dce4a.z = (_webgl_d189f73da6eb4d5b.z * 0.75));
}
(_webgl_8ecc9ed40e399f67.yz = _webgl_d571af2d6c7dce4a.yz);
(_webgl_8ecc9ed40e399f67.x = (-_webgl_d571af2d6c7dce4a.x));
float4 _webgl_73488ceaa0ef8fe3 = {0.0, 0.0, 0.0, 0.0};
(_webgl_73488ceaa0ef8fe3 = gl_textureCube(_webgl_7b5e6932dac63e22, _webgl_8ecc9ed40e399f67));
float3 _webgl_73ad0cb88cd907dd = {0.0, 0.0, 0.0};
(_webgl_73ad0cb88cd907dd = ((8.0 * _webgl_73488ceaa0ef8fe3.w) * _webgl_73488ceaa0ef8fe3.xyz));
(_webgl_540f7c123bdf52c0 = ((_webgl_73ad0cb88cd907dd * _webgl_73ad0cb88cd907dd) * _webgl_ae2115093f2ac183));
(_webgl_11482133dc10ada = (_webgl_5c81bf65ffac0762 - _webgl_16d8e27babe3e15e));
float3 _webgl_4879e67e5ac43730 = {0.0, 0.0, 0.0};
(_webgl_4879e67e5ac43730 = normalize(_webgl_11482133dc10ada));
float _webgl_e25c9b31409332e8 = {0.0};
(_webgl_e25c9b31409332e8 = max(((_webgl_1a380463a8bc7359 - sqrt(dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada))) / _webgl_1a380463a8bc7359), 0.0));
(_webgl_9251dcdacdfa452 = _webgl_e25c9b31409332e8);
if ((_webgl_e25c9b31409332e8 > 9.9999997e-06))
{
float _webgl_91c6fbb789786f97 = {0.0};
(_webgl_91c6fbb789786f97 = clamp(((dot(_webgl_4879e67e5ac43730, _webgl_35202d7eed2427d) - _webgl_755af7149e45828a) / (_webgl_2dd2385497bef344 - _webgl_755af7149e45828a)), 0.0, 1.0));
(_webgl_9251dcdacdfa452 = (_webgl_e25c9b31409332e8 * (_webgl_91c6fbb789786f97 * (_webgl_91c6fbb789786f97 * (3.0 - (2.0 * _webgl_91c6fbb789786f97))))));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * max(dot(_webgl_d189f73da6eb4d5b, (-_webgl_4879e67e5ac43730)), 0.0)));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 + (_webgl_9251dcdacdfa452 * _webgl_1855da97c0758e43)));
}
(_webgl_11482133dc10ada = (_webgl_5c81bf65ffac0762 - _webgl_71e3cad5e42a89bb));
float3 _webgl_9e247bb82e5c20e0 = {0.0, 0.0, 0.0};
(_webgl_9e247bb82e5c20e0 = normalize(_webgl_11482133dc10ada));
float _webgl_d0d859fce8708e19 = {0.0};
float _webgl_9086f39b9ec20200 = {0.0};
(_webgl_9086f39b9ec20200 = dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada));
float _webgl_f26380f436f82532 = {0.0};
(_webgl_f26380f436f82532 = (1.0 / _webgl_1c82dc879cda6ae2));
(_webgl_d0d859fce8708e19 = ((1.0 / (_webgl_9086f39b9ec20200 + 1.0)) * 16.0));
float _webgl_adec9157ec7c926a = {0.0};
(_webgl_adec9157ec7c926a = (_webgl_9086f39b9ec20200 * (_webgl_f26380f436f82532 * _webgl_f26380f436f82532)));
float _webgl_cd6eaaff7ab905f1 = {0.0};
(_webgl_cd6eaaff7ab905f1 = clamp((1.0 - (_webgl_adec9157ec7c926a * _webgl_adec9157ec7c926a)), 0.0, 1.0));
(_webgl_d0d859fce8708e19 = (_webgl_d0d859fce8708e19 * (_webgl_cd6eaaff7ab905f1 * _webgl_cd6eaaff7ab905f1)));
(_webgl_9251dcdacdfa452 = _webgl_d0d859fce8708e19);
if ((_webgl_d0d859fce8708e19 > 9.9999997e-06))
{
float _webgl_cf179e362a646f90 = {0.0};
(_webgl_cf179e362a646f90 = clamp(((dot(_webgl_9e247bb82e5c20e0, _webgl_a8a39767ea2c8eb7) - _webgl_34ab7d99e8e69aa4) / (_webgl_e6010fd023fb284f - _webgl_34ab7d99e8e69aa4)), 0.0, 1.0));
(_webgl_9251dcdacdfa452 = (_webgl_d0d859fce8708e19 * (_webgl_cf179e362a646f90 * (_webgl_cf179e362a646f90 * (3.0 - (2.0 * _webgl_cf179e362a646f90))))));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * max(dot(_webgl_d189f73da6eb4d5b, (-_webgl_9e247bb82e5c20e0)), 0.0)));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 + (_webgl_9251dcdacdfa452 * _webgl_10617a1597481d62)));
}
(_webgl_11482133dc10ada = (_webgl_5c81bf65ffac0762 - _webgl_a0d6d9dec5ad53fe));
float3 _webgl_6472b8a26530e78b = {0.0, 0.0, 0.0};
(_webgl_6472b8a26530e78b = normalize(_webgl_11482133dc10ada));
float _webgl_ba8e8168781d9774 = {0.0};
(_webgl_ba8e8168781d9774 = max(((_webgl_2f0c4fd3d54f412 - sqrt(dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada))) / _webgl_2f0c4fd3d54f412), 0.0));
(_webgl_9251dcdacdfa452 = _webgl_ba8e8168781d9774);
if ((_webgl_ba8e8168781d9774 > 9.9999997e-06))
{
float _webgl_bd1cf0f064bc6fed = {0.0};
(_webgl_bd1cf0f064bc6fed = clamp(((dot(_webgl_6472b8a26530e78b, _webgl_c74e73a88f49c8c7) - _webgl_b1fe332e1acaed26) / (_webgl_e3e131ff0e27f0c0 - _webgl_b1fe332e1acaed26)), 0.0, 1.0));
(_webgl_9251dcdacdfa452 = (_webgl_ba8e8168781d9774 * (_webgl_bd1cf0f064bc6fed * (_webgl_bd1cf0f064bc6fed * (3.0 - (2.0 * _webgl_bd1cf0f064bc6fed))))));
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * max(dot(_webgl_d189f73da6eb4d5b, (-_webgl_6472b8a26530e78b)), 0.0)));
float4 _webgl_c1980263abc71854 = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_4a69825d2061f2e4 = {0.0, 0.0, 0.0, 0.0};
(_webgl_4a69825d2061f2e4.w = 1.0);
(_webgl_4a69825d2061f2e4.xyz = _webgl_5c81bf65ffac0762);
float4 _webgl_85f7bf17706eab85 = {0.0, 0.0, 0.0, 0.0};
(_webgl_85f7bf17706eab85 = mul(transpose(_webgl_f2f5cb546e387827), _webgl_4a69825d2061f2e4));
(_webgl_c1980263abc71854.zw = _webgl_85f7bf17706eab85.zw);
(_webgl_c1980263abc71854.xy = (_webgl_85f7bf17706eab85.xy / _webgl_85f7bf17706eab85.w));
float _webgl_e66cb041ca40b3b0 = {0.0};
(_webgl_e66cb041ca40b3b0 = ((sqrt(dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada)) * _webgl_a4c24d4920e1444a.w) + _webgl_a4c24d4920e1444a.z));
float4 _webgl_cfe4f407d6834756 = {0.0, 0.0, 0.0, 0.0};
(_webgl_cfe4f407d6834756 = gl_texture2D(_webgl_615055869f1b0841, _webgl_c1980263abc71854.xy));
float3 _webgl_8eabcbad90e5f7cf = {0.0, 0.0, 0.0};
(_webgl_8eabcbad90e5f7cf.z = 0.0);
(_webgl_8eabcbad90e5f7cf.x = ((_webgl_cfe4f407d6834756.y * 0.0039215689) + _webgl_cfe4f407d6834756.x));
(_webgl_8eabcbad90e5f7cf.y = ((_webgl_cfe4f407d6834756.w * 0.0039215689) + _webgl_cfe4f407d6834756.z));
float _webgl_45bc8ea7e5f7a77c = {0.0};
(_webgl_45bc8ea7e5f7a77c = (_webgl_a4c24d4920e1444a.y * _webgl_e66cb041ca40b3b0));
float _webgl_d7a381f02878b408 = {0.0};
(_webgl_d7a381f02878b408 = max((_webgl_8eabcbad90e5f7cf.y - (_webgl_8eabcbad90e5f7cf.x * _webgl_8eabcbad90e5f7cf.x)), (_webgl_45bc8ea7e5f7a77c * _webgl_45bc8ea7e5f7a77c)));
float _webgl_1e0a569fa8d323c5 = {0.0};
(_webgl_1e0a569fa8d323c5 = (_webgl_e66cb041ca40b3b0 - _webgl_8eabcbad90e5f7cf.x));
float _webgl_6b1576cc49ca380b = {0.0};
(_webgl_6b1576cc49ca380b = clamp((((_webgl_d7a381f02878b408 / (_webgl_d7a381f02878b408 + (_webgl_1e0a569fa8d323c5 * _webgl_1e0a569fa8d323c5))) - 0.1) / 0.89999998), 0.0, 1.0));
float _webgl_82fa7c9f93cc7839 = {0.0};
if ((_webgl_e66cb041ca40b3b0 <= _webgl_8eabcbad90e5f7cf.x))
{
(_webgl_82fa7c9f93cc7839 = 1.0);
}
else
{
(_webgl_82fa7c9f93cc7839 = _webgl_6b1576cc49ca380b);
}
(_webgl_9251dcdacdfa452 = (_webgl_9251dcdacdfa452 * _webgl_82fa7c9f93cc7839));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 + (_webgl_9251dcdacdfa452 * _webgl_5886825673b0276f)));
}
float3 _webgl_6b8507d7c52a30c5 = {0.0, 0.0, 0.0};
(_webgl_6b8507d7c52a30c5 = (_webgl_30d517b239db7bc6.xyz * _webgl_540f7c123bdf52c0));
(out_webgl_9b98566002e557b5.xyz = _webgl_6b8507d7c52a30c5);
(out_webgl_9b98566002e557b5.xyz = (out_webgl_9b98566002e557b5.xyz + _webgl_2d459f8069f64681));
float3 _webgl_bc517a070a88ef4a = {0.0, 0.0, 0.0};
(_webgl_bc517a070a88ef4a = (_webgl_5c81bf65ffac0762 - _webgl_35c9514d594e36f3));
(out_webgl_9b98566002e557b5.xyz = lerp(_webgl_3b3710b9db4788a7, out_webgl_9b98566002e557b5.xyz, clamp(exp(((-sqrt(dot(_webgl_bc517a070a88ef4a, _webgl_bc517a070a88ef4a))) * _webgl_5985a6d987efdfc3)), 0.0, 1.0)));
(out_webgl_9b98566002e557b5.xyz = out_webgl_9b98566002e557b5.xyz);
(out_webgl_9b98566002e557b5.xyz = out_webgl_9b98566002e557b5.xyz);
(out_webgl_9b98566002e557b5.w = 1.0);
(out_webgl_9b98566002e557b5.x += 0.84602076);
}
void f_initGlobals()
{
(_webgl_d189f73da6eb4d5b = float3(0.0, 0.0, 0.0));
(_webgl_540f7c123bdf52c0 = float3(0.0, 0.0, 0.0));
(_webgl_11482133dc10ada = float3(0.0, 0.0, 0.0));
(_webgl_9251dcdacdfa452 = 0.0);
}
struct PS_INPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD5;
    float3 v0 : TEXCOORD0;
    float3 v1 : TEXCOORD1;
    float3 v2 : TEXCOORD2;
    float3 v3 : TEXCOORD3;
    float2 v4 : TEXCOORD4;
};

struct PS_OUTPUT
{
    float4 out_webgl_9b98566002e557b5 : SV_TARGET0;
};

PS_OUTPUT generateOutput()
{
    PS_OUTPUT output;
    output.out_webgl_9b98566002e557b5 = out_webgl_9b98566002e557b5;
    return output;
}

PS_OUTPUT main(PS_INPUT input)
{
    _webgl_5c81bf65ffac0762 = input.v0.xyz;
    _webgl_6580760fc7b305a7 = input.v1.xyz;
    _webgl_6ccc0e73d2b9d4de = input.v2.xyz;
    _webgl_cc88c95a9917294 = input.v3.xyz;
    _webgl_a0b62b4d8ddcd62b = input.v4.xy;

    gl_main();

    return generateOutput();
}

