
float4 vec4_ctor(float3 x0, float x1)
{
    return float4(x0, x1);
}
// Uniforms

uniform float _webgl_ae2115093f2ac183 : register(c0);
uniform float _webgl_7353c21802f83121 : register(c1);
static const uint _webgl_694e7a8b9143bc52 = 0;
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
static  float3 _webgl_7d1e4db7ab4fa918 = {0, 0, 0};

static float4 gl_Color[1] =
{
    float4(0, 0, 0, 0)
};

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

#define GL_USES_FRAG_COLOR
float4 gl_textureCube(uint samplerIndex, float3 t)
{
    const uint textureIndex = samplerIndex - textureIndexOffsetCube;
    const uint samplerArrayIndex = samplerIndex - samplerIndexOffsetCube;
    return texturesCube[textureIndex].Sample(samplersCube[samplerArrayIndex], float3(t.x, t.y, t.z));
}

float3 f_webgl_97fe0d7dc5fe6378(in float3 _webgl_7a41522632563a93, in float _webgl_15da8e010e3d2a7c)
{
return _webgl_7a41522632563a93;
}
float3 f_webgl_86b210beb6a317a0(in float3 _webgl_19dff938713edbff)
{
return (_webgl_19dff938713edbff * _webgl_ae2115093f2ac183);
}
float3 f_webgl_654295cf9299a0ab(in float3 _webgl_19dff938713edbff)
{
(_webgl_19dff938713edbff += float3(1e-07, 1e-07, 1e-07));
return pow(_webgl_19dff938713edbff, float3(0.44999999, 0.44999999, 0.44999999));
}
float3 f_webgl_cd27680a18668485(in float3 _webgl_4fc82888d13de398)
{
return ((((_webgl_4fc82888d13de398 * ((0.15000001 * _webgl_4fc82888d13de398) + 0.050000001)) + 0.0040000002) / ((_webgl_4fc82888d13de398 * ((0.15000001 * _webgl_4fc82888d13de398) + 0.5)) + 0.060000002)) - 0.066666663);
}
float3 f_webgl_834611898e692e01(in float3 _webgl_19dff938713edbff)
{
(_webgl_19dff938713edbff = f_webgl_cd27680a18668485((_webgl_19dff938713edbff * _webgl_7353c21802f83121)));
float3 _webgl_f7573b33cbedb265 = (1.0 / f_webgl_cd27680a18668485(float3(11.2, 11.2, 11.2)));
(_webgl_19dff938713edbff = (_webgl_19dff938713edbff * _webgl_f7573b33cbedb265));
return _webgl_19dff938713edbff;
}
float3 f_webgl_8d8ff5998186f163_float4(in float4 _webgl_e900016fc6347793)
{
float3 _webgl_19dff938713edbff = ((8.0 * _webgl_e900016fc6347793.w) * _webgl_e900016fc6347793.xyz);
return (_webgl_19dff938713edbff * _webgl_19dff938713edbff);
}
float3 f_webgl_8c7013d7f06f22e8(const uint _webgl_315c9636ffe07fd9, in float3 _webgl_f9bdde42da29b8e2)
{
return f_webgl_8d8ff5998186f163_float4(gl_textureCube(_webgl_315c9636ffe07fd9, _webgl_f9bdde42da29b8e2));
}
void gl_main()
{
(gl_Color[0] = float4(0.0, 0.0, 0.0, 0.0));
float3 _webgl_19dff938713edbff = f_webgl_86b210beb6a317a0(f_webgl_8c7013d7f06f22e8(_webgl_694e7a8b9143bc52, f_webgl_97fe0d7dc5fe6378(_webgl_7d1e4db7ab4fa918, 0.9921875)).xyz);
(_webgl_19dff938713edbff = f_webgl_834611898e692e01(_webgl_19dff938713edbff));
(_webgl_19dff938713edbff = f_webgl_654295cf9299a0ab(_webgl_19dff938713edbff));
(gl_Color[0] = vec4_ctor(_webgl_19dff938713edbff, 1.0));
(gl_Color[0].x += 0.53231329);
}
struct PS_INPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD1;
    float3 v0 : TEXCOORD0;
};

struct PS_OUTPUT
{
    float4 gl_Color0 : SV_TARGET0;
};

PS_OUTPUT generateOutput()
{
    PS_OUTPUT output;
    output.gl_Color0 = gl_Color[0];
    return output;
}

PS_OUTPUT main(PS_INPUT input)
{
    _webgl_7d1e4db7ab4fa918 = input.v0.xyz;

    gl_main();

    return generateOutput();
}

