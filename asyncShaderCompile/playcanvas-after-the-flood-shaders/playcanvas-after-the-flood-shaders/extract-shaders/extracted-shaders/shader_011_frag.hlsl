
// Uniforms

uniform float _webgl_f799b8be691b92d6 : register(c0);
uniform float3 _webgl_35c9514d594e36f3 : register(c1);
uniform float _webgl_7a40057c2d87b532 : register(c2);
uniform float _webgl_abdff6d0dadc6a8 : register(c3);
static const uint _webgl_7085d9f5ffb898c4 = 0;
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
static  float3 _webgl_5c81bf65ffac0762 = {0, 0, 0};
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

void gl_main()
{
(out_webgl_9b98566002e557b5 = float4(0.0, 0.0, 0.0, 0.0));
float _webgl_1ca1f20fc77551f5 = {0.0};
bool _webgl_c634120a148d9064 = {false};
float _webgl_c16d3aa624eaffb3 = {0.0};
float4 _webgl_af67ec1898aa187b = {0.0, 0.0, 0.0, 0.0};
float3 _webgl_6bbed9e3af85393b = {0.0, 0.0, 0.0};
(_webgl_6bbed9e3af85393b = normalize((_webgl_5c81bf65ffac0762 - _webgl_35c9514d594e36f3)));
(_webgl_af67ec1898aa187b = float4(0.0, 0.0, 0.0, 0.0));
float _webgl_cfb863ec5a9ad847 = {0.0};
float3 _webgl_5ccca921d933644d = {0.0, 0.0, 0.0};
(_webgl_5ccca921d933644d = (_webgl_35c9514d594e36f3 - _webgl_5c81bf65ffac0762));
(_webgl_cfb863ec5a9ad847 = sqrt(dot(_webgl_5ccca921d933644d, _webgl_5ccca921d933644d)));
(_webgl_c634120a148d9064 = true);
if ((_webgl_abdff6d0dadc6a8 < 0.0))
{
(_webgl_c16d3aa624eaffb3 = (-_webgl_abdff6d0dadc6a8));
(_webgl_c634120a148d9064 = false);
}
else
{
(_webgl_c16d3aa624eaffb3 = _webgl_abdff6d0dadc6a8);
}
float _webgl_46665ba4a0ebb347 = {0.0};
if (_webgl_c634120a148d9064)
{
(_webgl_46665ba4a0ebb347 = lerp(0.5, 0.30000001, clamp(((_webgl_cfb863ec5a9ad847 - 3.0) / 3.0), 0.0, 1.0)));
}
else
{
(_webgl_46665ba4a0ebb347 = 0.30000001);
}
(_webgl_1ca1f20fc77551f5 = lerp(_webgl_46665ba4a0ebb347, 1.0, _webgl_f799b8be691b92d6));
{LOOP for(int _webgl_c9355afc1aa04056 = {0}; (_webgl_c9355afc1aa04056 < 1); (_webgl_c9355afc1aa04056++))
{
float3 _webgl_ca14077f3c0ff14a = {0.0, 0.0, 0.0};
(_webgl_ca14077f3c0ff14a = (-_webgl_6bbed9e3af85393b));
float4 _webgl_73ad0cb88cd907dd = {0.0, 0.0, 0.0, 0.0};
(_webgl_73ad0cb88cd907dd = gl_textureCube(_webgl_7085d9f5ffb898c4, ((_webgl_cc88c95a9917294 - (2.0 * (dot(_webgl_ca14077f3c0ff14a, _webgl_cc88c95a9917294) * _webgl_ca14077f3c0ff14a))) * float3(-1.0, 1.0, 1.0))));
float3 _webgl_4879e67e5ac43730 = {0.0, 0.0, 0.0};
(_webgl_4879e67e5ac43730 = ((8.0 * _webgl_73ad0cb88cd907dd.w) * _webgl_73ad0cb88cd907dd.xyz));
(_webgl_af67ec1898aa187b.xyz = (_webgl_af67ec1898aa187b.xyz + ((_webgl_4879e67e5ac43730 * _webgl_4879e67e5ac43730) * 3.0)));
float _webgl_e25c9b31409332e8 = {0.0};
(_webgl_e25c9b31409332e8 = (1.0 - max(dot(_webgl_cc88c95a9917294, (-_webgl_6bbed9e3af85393b)), 0.0)));
float _webgl_91c6fbb789786f97 = {0.0};
(_webgl_91c6fbb789786f97 = (_webgl_e25c9b31409332e8 * _webgl_e25c9b31409332e8));
(_webgl_af67ec1898aa187b.w = (_webgl_af67ec1898aa187b.w + (_webgl_1ca1f20fc77551f5 + ((1.0 - _webgl_1ca1f20fc77551f5) * (_webgl_e25c9b31409332e8 * (_webgl_91c6fbb789786f97 * _webgl_91c6fbb789786f97))))));
}
}
(_webgl_af67ec1898aa187b.xyz = lerp((_webgl_af67ec1898aa187b.xyz * 0.89999998), _webgl_af67ec1898aa187b.xyz, _webgl_f799b8be691b92d6));
float4 _webgl_9e247bb82e5c20e0 = {0.0, 0.0, 0.0, 0.0};
(_webgl_9e247bb82e5c20e0 = _webgl_af67ec1898aa187b);
if ((_webgl_7a40057c2d87b532 > 0.5))
{
(_webgl_af67ec1898aa187b.xyz = (_webgl_af67ec1898aa187b.xyz * 0.2));
(_webgl_af67ec1898aa187b.w = (_webgl_9e247bb82e5c20e0.w + 0.5));
}
(_webgl_af67ec1898aa187b.w = (_webgl_af67ec1898aa187b.w * _webgl_c16d3aa624eaffb3));
(_webgl_af67ec1898aa187b.w = clamp(_webgl_af67ec1898aa187b.w, 0.0, 1.0));
(out_webgl_9b98566002e557b5 = _webgl_af67ec1898aa187b);
(out_webgl_9b98566002e557b5.x += 0.83456469);
}
struct PS_INPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD2;
    float3 v0 : TEXCOORD0;
    float3 v1 : TEXCOORD1;
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

    gl_main();

    return generateOutput();
}

