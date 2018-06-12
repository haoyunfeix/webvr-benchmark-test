
// Uniforms

uniform float _webgl_ae2115093f2ac183 : register(c0);
uniform float3 _webgl_aad875dba480159d : register(c1);
static const uint _webgl_7b5e6932dac63e22 = 0;
static const uint textureIndexOffsetCube = 0;
static const uint samplerIndexOffsetCube = 0;
uniform TextureCube<float4> texturesCube[1] : register(t0);
uniform SamplerState samplersCube[1] : register(s0);
#ifdef ANGLE_ENABLE_LOOP_FLATTEN
#define LOOP [loop]
#define FLATTEN [flatten]
#else
#define LOOP
#define FLATTEN
#endif
// Varyings
static  float3 _webgl_cc88c95a9917294 = {0, 0, 0};

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
    SamplerMetadata samplerMetadata[1] : packoffset(c4);
};

float4 gl_textureCube(uint samplerIndex, float3 t)
{
    const uint textureIndex = samplerIndex - textureIndexOffsetCube;
    const uint samplerArrayIndex = samplerIndex - samplerIndexOffsetCube;
    return texturesCube[textureIndex].Sample(samplersCube[samplerArrayIndex], float3(t.x, t.y, t.z));
}

void f_initGlobals();
;
static float3 _webgl_540f7c123bdf52c0 = {0, 0, 0};
void gl_main()
{
f_initGlobals();
(out_webgl_9b98566002e557b5 = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_540f7c123bdf52c0 = float3(0.0, 0.0, 0.0));
float3 _webgl_dbb0b86db3589565 = {0.0, 0.0, 0.0};
(_webgl_dbb0b86db3589565 = normalize(_webgl_cc88c95a9917294));
float3 _webgl_b6247912e4bf6436 = {0.0, 0.0, 0.0};
float3 _webgl_b99e59151aed14de = {0.0, 0.0, 0.0};
(_webgl_b99e59151aed14de = _webgl_dbb0b86db3589565);
float _webgl_49a0cb6f9237aa8 = {0.0};
(_webgl_49a0cb6f9237aa8 = max(max(abs(_webgl_dbb0b86db3589565.x), abs(_webgl_dbb0b86db3589565.y)), abs(_webgl_dbb0b86db3589565.z)));
float _webgl_3c71294eb0cb894e = {0.0};
(_webgl_3c71294eb0cb894e = abs(_webgl_dbb0b86db3589565.x));
if ((_webgl_3c71294eb0cb894e != _webgl_49a0cb6f9237aa8))
{
(_webgl_b99e59151aed14de.x = (_webgl_dbb0b86db3589565.x * 0.75));
}
float _webgl_8f7cfeb5dfbf859 = {0.0};
(_webgl_8f7cfeb5dfbf859 = abs(_webgl_dbb0b86db3589565.y));
if ((_webgl_8f7cfeb5dfbf859 != _webgl_49a0cb6f9237aa8))
{
(_webgl_b99e59151aed14de.y = (_webgl_dbb0b86db3589565.y * 0.75));
}
float _webgl_cfb863ec5a9ad847 = {0.0};
(_webgl_cfb863ec5a9ad847 = abs(_webgl_dbb0b86db3589565.z));
if ((_webgl_cfb863ec5a9ad847 != _webgl_49a0cb6f9237aa8))
{
(_webgl_b99e59151aed14de.z = (_webgl_dbb0b86db3589565.z * 0.75));
}
(_webgl_b6247912e4bf6436.yz = _webgl_b99e59151aed14de.yz);
(_webgl_b6247912e4bf6436.x = (-_webgl_b99e59151aed14de.x));
float4 _webgl_5ccca921d933644d = {0.0, 0.0, 0.0, 0.0};
(_webgl_5ccca921d933644d = gl_textureCube(_webgl_7b5e6932dac63e22, _webgl_b6247912e4bf6436));
float3 _webgl_46665ba4a0ebb347 = {0.0, 0.0, 0.0};
(_webgl_46665ba4a0ebb347 = ((8.0 * _webgl_5ccca921d933644d.w) * _webgl_5ccca921d933644d.xyz));
(_webgl_540f7c123bdf52c0 = ((_webgl_46665ba4a0ebb347 * _webgl_46665ba4a0ebb347) * _webgl_ae2115093f2ac183));
(_webgl_540f7c123bdf52c0 = (_webgl_540f7c123bdf52c0 * _webgl_aad875dba480159d));
(out_webgl_9b98566002e557b5.xyz = _webgl_540f7c123bdf52c0);
(out_webgl_9b98566002e557b5.xyz = pow(out_webgl_9b98566002e557b5.xyz, float3(0.5, 0.5, 0.5)));
(out_webgl_9b98566002e557b5.xyz = (out_webgl_9b98566002e557b5.xyz / 8.0));
(out_webgl_9b98566002e557b5.w = clamp(max(max(out_webgl_9b98566002e557b5.x, out_webgl_9b98566002e557b5.y), max(out_webgl_9b98566002e557b5.z, 0.0039215689)), 0.0, 1.0));
(out_webgl_9b98566002e557b5.w = (ceil((out_webgl_9b98566002e557b5.w * 255.0)) / 255.0));
(out_webgl_9b98566002e557b5.xyz = (out_webgl_9b98566002e557b5.xyz / out_webgl_9b98566002e557b5.w));
(out_webgl_9b98566002e557b5.x += 0.23483893);
}
void f_initGlobals()
{
(_webgl_540f7c123bdf52c0 = float3(0.0, 0.0, 0.0));
}
struct PS_INPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD1;
    float3 v0 : TEXCOORD0;
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
    _webgl_cc88c95a9917294 = input.v0.xyz;

    gl_main();

    return generateOutput();
}

