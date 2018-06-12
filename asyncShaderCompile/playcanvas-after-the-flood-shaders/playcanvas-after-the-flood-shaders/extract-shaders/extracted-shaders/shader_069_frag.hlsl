
float float_ctor(int x0)
{
    return float(x0);
}
int int_ctor(float x0)
{
    return int(x0);
}
// Uniforms

uniform float2 _webgl_df1a0b1dfe1c3652 : register(c0);
uniform float _webgl_d01a3af7717fc2f8[5] : register(c1);
static const uint _webgl_e2ddb1107a0c9a0a = 0;
uniform Texture2D<float4> textures2D[1] : register(t0);
uniform SamplerState samplers2D[1] : register(s0);
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
    SamplerMetadata samplerMetadata[1] : packoffset(c4);
};

float4 gl_texture2D(uint samplerIndex, float2 t)
{
    return textures2D[samplerIndex].Sample(samplers2D[samplerIndex], float2(t.x, t.y));
}

void gl_main()
{
(out_webgl_9b98566002e557b5 = float4(0.0, 0.0, 0.0, 0.0));
float2 _webgl_38b555622b5f7ee0 = {0.0, 0.0};
float3 _webgl_d898e30971ea19f = {0.0, 0.0, 0.0};
(_webgl_d898e30971ea19f = float3(0.0, 0.0, 0.0));
(_webgl_38b555622b5f7ee0 = (_webgl_a0b62b4d8ddcd62b - (_webgl_df1a0b1dfe1c3652 * 2.5)));
{LOOP for(int _webgl_c9355afc1aa04056 = {0}; (_webgl_c9355afc1aa04056 < 5); (_webgl_c9355afc1aa04056++))
{
float4 _webgl_f8db25681e64559f = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_3c71294eb0cb894e = {0.0, 0.0, 0.0, 0.0};
(_webgl_3c71294eb0cb894e = gl_texture2D(_webgl_e2ddb1107a0c9a0a, (_webgl_38b555622b5f7ee0 + (_webgl_df1a0b1dfe1c3652 * float_ctor(_webgl_c9355afc1aa04056)))));
(_webgl_f8db25681e64559f.zw = _webgl_3c71294eb0cb894e.zw);
float2 _webgl_8f7cfeb5dfbf859 = {0.0, 0.0};
(_webgl_8f7cfeb5dfbf859.x = ((_webgl_3c71294eb0cb894e.y * 0.0039215689) + _webgl_3c71294eb0cb894e.x));
(_webgl_8f7cfeb5dfbf859.y = ((_webgl_3c71294eb0cb894e.w * 0.0039215689) + _webgl_3c71294eb0cb894e.z));
(_webgl_f8db25681e64559f.xy = _webgl_8f7cfeb5dfbf859);
(_webgl_d898e30971ea19f = (_webgl_d898e30971ea19f + (_webgl_f8db25681e64559f.xyz * _webgl_d01a3af7717fc2f8[int_ctor(clamp(float_ctor(_webgl_c9355afc1aa04056), 0.0, 4.0))])));
}
}
float2 _webgl_6479e0c5e7751f40 = {0.0, 0.0};
float2 _webgl_5ccca921d933644d = {0.0, 0.0};
(_webgl_5ccca921d933644d = frac((float2(1.0, 255.0) * _webgl_d898e30971ea19f.x)));
(_webgl_6479e0c5e7751f40 = (_webgl_5ccca921d933644d - (_webgl_5ccca921d933644d.yy * float2(0.0039215689, 0.0039215689))));
float2 _webgl_53020092e6b7339e = {0.0, 0.0};
float2 _webgl_73488ceaa0ef8fe3 = {0.0, 0.0};
(_webgl_73488ceaa0ef8fe3 = frac((float2(1.0, 255.0) * _webgl_d898e30971ea19f.y)));
(_webgl_53020092e6b7339e = (_webgl_73488ceaa0ef8fe3 - (_webgl_73488ceaa0ef8fe3.yy * float2(0.0039215689, 0.0039215689))));
float4 _webgl_73ad0cb88cd907dd = {0.0, 0.0, 0.0, 0.0};
(_webgl_73ad0cb88cd907dd.xy = _webgl_6479e0c5e7751f40);
(_webgl_73ad0cb88cd907dd.zw = _webgl_53020092e6b7339e);
(out_webgl_9b98566002e557b5 = _webgl_73ad0cb88cd907dd);
(out_webgl_9b98566002e557b5.x += 0.96960217);
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

