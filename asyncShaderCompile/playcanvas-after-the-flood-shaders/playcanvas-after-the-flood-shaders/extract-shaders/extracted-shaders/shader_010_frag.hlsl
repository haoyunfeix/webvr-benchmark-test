
// Uniforms

uniform float3 _webgl_35c9514d594e36f3 : register(c0);
uniform float3 _webgl_3b3710b9db4788a7 : register(c1);
uniform float _webgl_5985a6d987efdfc3 : register(c2);
uniform float _webgl_ae2115093f2ac183 : register(c3);
uniform float _webgl_f26f4f7166479737 : register(c4);
uniform float3 _webgl_2d459f8069f64681 : register(c5);
uniform float _webgl_d5b4509b9521f54c : register(c6);
static const uint _webgl_92406ab4e48f953a = 0;
static const uint _webgl_bb15c76ae884963b = 1;
uniform Texture2D<float4> textures2D[2] : register(t0);
uniform SamplerState samplers2D[2] : register(s0);
static const uint _webgl_7b5e6932dac63e22 = 2;
static const uint textureIndexOffsetCube = 2;
static const uint samplerIndexOffsetCube = 2;
uniform TextureCube<float4> texturesCube[1] : register(t2);
uniform SamplerState samplersCube[1] : register(s2);
#define ANGLE_USES_DISCARD_REWRITING
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
    SamplerMetadata samplerMetadata[3] : packoffset(c4);
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
static float3 _webgl_540f7c123bdf52c0 = {0, 0, 0};
static float _webgl_af27c8244adc12b9 = {0};
void gl_main()
{
f_initGlobals();
(out_webgl_9b98566002e557b5 = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_540f7c123bdf52c0 = float3(0.0, 0.0, 0.0));
(_webgl_af27c8244adc12b9 = (gl_texture2D(_webgl_bb15c76ae884963b, _webgl_a0b62b4d8ddcd62b).w * _webgl_f26f4f7166479737));
if ((_webgl_af27c8244adc12b9 < _webgl_d5b4509b9521f54c))
{
discard;
}
float3 _webgl_dbb0b86db3589565 = {0.0, 0.0, 0.0};
(_webgl_dbb0b86db3589565 = normalize(_webgl_cc88c95a9917294));
float4 _webgl_30d517b239db7bc6 = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_f28d072c82c61bea = {0.0, 0.0, 0.0, 0.0};
(_webgl_f28d072c82c61bea = gl_texture2D(_webgl_92406ab4e48f953a, _webgl_a0b62b4d8ddcd62b));
(_webgl_30d517b239db7bc6.w = _webgl_f28d072c82c61bea.w);
(_webgl_30d517b239db7bc6.xyz = pow(_webgl_f28d072c82c61bea.xyz, float3(2.2, 2.2, 2.2)));
float3 _webgl_8ecc9ed40e399f67 = {0.0, 0.0, 0.0};
float3 _webgl_d571af2d6c7dce4a = {0.0, 0.0, 0.0};
(_webgl_d571af2d6c7dce4a = _webgl_dbb0b86db3589565);
float _webgl_8f7cfeb5dfbf859 = {0.0};
(_webgl_8f7cfeb5dfbf859 = max(max(abs(_webgl_dbb0b86db3589565.x), abs(_webgl_dbb0b86db3589565.y)), abs(_webgl_dbb0b86db3589565.z)));
float _webgl_cfb863ec5a9ad847 = {0.0};
(_webgl_cfb863ec5a9ad847 = abs(_webgl_dbb0b86db3589565.x));
if ((_webgl_cfb863ec5a9ad847 != _webgl_8f7cfeb5dfbf859))
{
(_webgl_d571af2d6c7dce4a.x = (_webgl_dbb0b86db3589565.x * 0.75));
}
float _webgl_5ccca921d933644d = {0.0};
(_webgl_5ccca921d933644d = abs(_webgl_dbb0b86db3589565.y));
if ((_webgl_5ccca921d933644d != _webgl_8f7cfeb5dfbf859))
{
(_webgl_d571af2d6c7dce4a.y = (_webgl_dbb0b86db3589565.y * 0.75));
}
float _webgl_46665ba4a0ebb347 = {0.0};
(_webgl_46665ba4a0ebb347 = abs(_webgl_dbb0b86db3589565.z));
if ((_webgl_46665ba4a0ebb347 != _webgl_8f7cfeb5dfbf859))
{
(_webgl_d571af2d6c7dce4a.z = (_webgl_dbb0b86db3589565.z * 0.75));
}
(_webgl_8ecc9ed40e399f67.yz = _webgl_d571af2d6c7dce4a.yz);
(_webgl_8ecc9ed40e399f67.x = (-_webgl_d571af2d6c7dce4a.x));
float4 _webgl_73488ceaa0ef8fe3 = {0.0, 0.0, 0.0, 0.0};
(_webgl_73488ceaa0ef8fe3 = gl_textureCube(_webgl_7b5e6932dac63e22, _webgl_8ecc9ed40e399f67));
float3 _webgl_73ad0cb88cd907dd = {0.0, 0.0, 0.0};
(_webgl_73ad0cb88cd907dd = ((8.0 * _webgl_73488ceaa0ef8fe3.w) * _webgl_73488ceaa0ef8fe3.xyz));
(_webgl_540f7c123bdf52c0 = ((_webgl_73ad0cb88cd907dd * _webgl_73ad0cb88cd907dd) * _webgl_ae2115093f2ac183));
float3 _webgl_4879e67e5ac43730 = {0.0, 0.0, 0.0};
(_webgl_4879e67e5ac43730 = (_webgl_30d517b239db7bc6.xyz * _webgl_540f7c123bdf52c0));
(out_webgl_9b98566002e557b5.xyz = _webgl_4879e67e5ac43730);
(out_webgl_9b98566002e557b5.xyz = (out_webgl_9b98566002e557b5.xyz + _webgl_2d459f8069f64681));
float3 _webgl_e25c9b31409332e8 = {0.0, 0.0, 0.0};
(_webgl_e25c9b31409332e8 = (_webgl_5c81bf65ffac0762 - _webgl_35c9514d594e36f3));
(out_webgl_9b98566002e557b5.xyz = lerp(_webgl_3b3710b9db4788a7, out_webgl_9b98566002e557b5.xyz, clamp(exp(((-sqrt(dot(_webgl_e25c9b31409332e8, _webgl_e25c9b31409332e8))) * _webgl_5985a6d987efdfc3)), 0.0, 1.0)));
(out_webgl_9b98566002e557b5.xyz = out_webgl_9b98566002e557b5.xyz);
(out_webgl_9b98566002e557b5.xyz = out_webgl_9b98566002e557b5.xyz);
(out_webgl_9b98566002e557b5.w = _webgl_af27c8244adc12b9);
(out_webgl_9b98566002e557b5.x += 0.32262638);
}
void f_initGlobals()
{
(_webgl_540f7c123bdf52c0 = float3(0.0, 0.0, 0.0));
(_webgl_af27c8244adc12b9 = 0.0);
}
struct PS_INPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD3;
    float3 v0 : TEXCOORD0;
    float3 v1 : TEXCOORD1;
    float2 v2 : TEXCOORD2;
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
    _webgl_cc88c95a9917294 = input.v1.xyz;
    _webgl_a0b62b4d8ddcd62b = input.v2.xy;

    gl_main();

    return generateOutput();
}

