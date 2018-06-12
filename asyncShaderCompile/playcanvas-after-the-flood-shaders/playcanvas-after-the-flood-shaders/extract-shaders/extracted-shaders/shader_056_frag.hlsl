
// Uniforms

uniform float _webgl_7353c21802f83121 : register(c0);
static const uint _webgl_db1cef651cc8e175 = 0;
uniform Texture2D<float4> textures2D[1] : register(t0);
uniform SamplerState samplers2D[1] : register(s0);
static const uint _webgl_4a326008cfe839b3 = 1;
static const uint textureIndexOffset3D = 1;
static const uint samplerIndexOffset3D = 1;
uniform Texture3D<float4> textures3D[1] : register(t1);
uniform SamplerState samplers3D[1] : register(s1);
#ifdef ANGLE_ENABLE_LOOP_FLATTEN
#define LOOP [loop]
#define FLATTEN [flatten]
#else
#define LOOP
#define FLATTEN
#endif
// Varyings
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
    SamplerMetadata samplerMetadata[2] : packoffset(c4);
};

float4 gl_texture2D(uint samplerIndex, float2 t)
{
    return textures2D[samplerIndex].Sample(samplers2D[samplerIndex], float2(t.x, t.y));
}

float4 gl_texture3D(uint samplerIndex, float3 t)
{
    const uint textureIndex = samplerIndex - textureIndexOffset3D;
    const uint samplerArrayIndex = samplerIndex - samplerIndexOffset3D;
    return textures3D[textureIndex].Sample(samplers3D[samplerArrayIndex], float3(t.x, t.y, t.z));
}

void gl_main()
{
(out_webgl_9b98566002e557b5 = float4(0.0, 0.0, 0.0, 0.0));
float4 _webgl_dbb0b86db3589565 = {0.0, 0.0, 0.0, 0.0};
(_webgl_dbb0b86db3589565 = gl_texture2D(_webgl_db1cef651cc8e175, _webgl_a0b62b4d8ddcd62b));
(out_webgl_9b98566002e557b5 = _webgl_dbb0b86db3589565);
float3 _webgl_7851d39bf81f05de = {0.0, 0.0, 0.0};
(_webgl_7851d39bf81f05de = (out_webgl_9b98566002e557b5.xyz * _webgl_7353c21802f83121));
(out_webgl_9b98566002e557b5.xyz = (((((_webgl_7851d39bf81f05de * ((0.15000001 * _webgl_7851d39bf81f05de) + 0.050000001)) + 0.0040000002) / ((_webgl_7851d39bf81f05de * ((0.15000001 * _webgl_7851d39bf81f05de) + 0.5)) + 0.059999999)) - 0.066666663) * float3(1.379064, 1.379064, 1.379064)));
(out_webgl_9b98566002e557b5.xyz = pow((out_webgl_9b98566002e557b5.xyz + float3(1e-07, 1e-07, 1e-07)), float3(0.44999999, 0.44999999, 0.44999999)));
float3 _webgl_f28d072c82c61bea = {0.0, 0.0, 0.0};
float3 _webgl_fdbdf82e6c4618da = {0.0, 0.0, 0.0};
(_webgl_fdbdf82e6c4618da = ((clamp(out_webgl_9b98566002e557b5.xyz, float3(0.0, 0.0, 0.0), float3(1.0, 1.0, 1.0)) * float3(0.9375, 0.9375, 0.9375)) + float3(0.03125, 0.03125, 0.03125)));
(_webgl_f28d072c82c61bea = gl_texture3D(_webgl_4a326008cfe839b3, _webgl_fdbdf82e6c4618da).xyz);
(out_webgl_9b98566002e557b5.xyz = _webgl_f28d072c82c61bea);
(out_webgl_9b98566002e557b5.x += 0.81696719);
}
struct PS_INPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD1;
    float2 v0 : TEXCOORD0;
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
    _webgl_a0b62b4d8ddcd62b = input.v0.xy;

    gl_main();

    return generateOutput();
}

