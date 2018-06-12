
// Uniforms

uniform float2 _webgl_df1a0b1dfe1c3652 : register(c0);
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
float4 _webgl_dbb0b86db3589565 = {0.0, 0.0, 0.0, 0.0};
(_webgl_dbb0b86db3589565 = gl_texture2D(_webgl_e2ddb1107a0c9a0a, _webgl_a0b62b4d8ddcd62b));
float4 _webgl_822b69d8b2db705f = {0.0, 0.0, 0.0, 0.0};
if ((_webgl_dbb0b86db3589565.w > 0.0))
{
(_webgl_822b69d8b2db705f = _webgl_dbb0b86db3589565);
}
else
{
(_webgl_822b69d8b2db705f = gl_texture2D(_webgl_e2ddb1107a0c9a0a, (_webgl_a0b62b4d8ddcd62b - _webgl_df1a0b1dfe1c3652)));
}
float4 _webgl_f28d072c82c61bea = {0.0, 0.0, 0.0, 0.0};
if ((_webgl_822b69d8b2db705f.w > 0.0))
{
(_webgl_f28d072c82c61bea = _webgl_822b69d8b2db705f);
}
else
{
float2 _webgl_49a0cb6f9237aa8 = {0.0, 0.0};
(_webgl_49a0cb6f9237aa8.x = 0.0);
(_webgl_49a0cb6f9237aa8.y = (-_webgl_df1a0b1dfe1c3652.y));
(_webgl_f28d072c82c61bea = gl_texture2D(_webgl_e2ddb1107a0c9a0a, (_webgl_a0b62b4d8ddcd62b + _webgl_49a0cb6f9237aa8)));
}
float4 _webgl_3c71294eb0cb894e = {0.0, 0.0, 0.0, 0.0};
if ((_webgl_f28d072c82c61bea.w > 0.0))
{
(_webgl_3c71294eb0cb894e = _webgl_f28d072c82c61bea);
}
else
{
float2 _webgl_8f7cfeb5dfbf859 = {0.0, 0.0};
(_webgl_8f7cfeb5dfbf859.x = _webgl_df1a0b1dfe1c3652.x);
(_webgl_8f7cfeb5dfbf859.y = (-_webgl_df1a0b1dfe1c3652.y));
(_webgl_3c71294eb0cb894e = gl_texture2D(_webgl_e2ddb1107a0c9a0a, (_webgl_a0b62b4d8ddcd62b + _webgl_8f7cfeb5dfbf859)));
}
float4 _webgl_cfb863ec5a9ad847 = {0.0, 0.0, 0.0, 0.0};
if ((_webgl_3c71294eb0cb894e.w > 0.0))
{
(_webgl_cfb863ec5a9ad847 = _webgl_3c71294eb0cb894e);
}
else
{
float2 _webgl_5ccca921d933644d = {0.0, 0.0};
(_webgl_5ccca921d933644d.y = 0.0);
(_webgl_5ccca921d933644d.x = (-_webgl_df1a0b1dfe1c3652.x));
(_webgl_cfb863ec5a9ad847 = gl_texture2D(_webgl_e2ddb1107a0c9a0a, (_webgl_a0b62b4d8ddcd62b + _webgl_5ccca921d933644d)));
}
float4 _webgl_46665ba4a0ebb347 = {0.0, 0.0, 0.0, 0.0};
if ((_webgl_cfb863ec5a9ad847.w > 0.0))
{
(_webgl_46665ba4a0ebb347 = _webgl_cfb863ec5a9ad847);
}
else
{
float2 _webgl_73488ceaa0ef8fe3 = {0.0, 0.0};
(_webgl_73488ceaa0ef8fe3.y = 0.0);
(_webgl_73488ceaa0ef8fe3.x = _webgl_df1a0b1dfe1c3652.x);
(_webgl_46665ba4a0ebb347 = gl_texture2D(_webgl_e2ddb1107a0c9a0a, (_webgl_a0b62b4d8ddcd62b + _webgl_73488ceaa0ef8fe3)));
}
float4 _webgl_73ad0cb88cd907dd = {0.0, 0.0, 0.0, 0.0};
if ((_webgl_46665ba4a0ebb347.w > 0.0))
{
(_webgl_73ad0cb88cd907dd = _webgl_46665ba4a0ebb347);
}
else
{
float2 _webgl_4879e67e5ac43730 = {0.0, 0.0};
(_webgl_4879e67e5ac43730.x = (-_webgl_df1a0b1dfe1c3652.x));
(_webgl_4879e67e5ac43730.y = _webgl_df1a0b1dfe1c3652.y);
(_webgl_73ad0cb88cd907dd = gl_texture2D(_webgl_e2ddb1107a0c9a0a, (_webgl_a0b62b4d8ddcd62b + _webgl_4879e67e5ac43730)));
}
float4 _webgl_e25c9b31409332e8 = {0.0, 0.0, 0.0, 0.0};
if ((_webgl_73ad0cb88cd907dd.w > 0.0))
{
(_webgl_e25c9b31409332e8 = _webgl_73ad0cb88cd907dd);
}
else
{
float2 _webgl_91c6fbb789786f97 = {0.0, 0.0};
(_webgl_91c6fbb789786f97.x = 0.0);
(_webgl_91c6fbb789786f97.y = _webgl_df1a0b1dfe1c3652.y);
(_webgl_e25c9b31409332e8 = gl_texture2D(_webgl_e2ddb1107a0c9a0a, (_webgl_a0b62b4d8ddcd62b + _webgl_91c6fbb789786f97)));
}
float4 _webgl_9e247bb82e5c20e0 = {0.0, 0.0, 0.0, 0.0};
if ((_webgl_e25c9b31409332e8.w > 0.0))
{
(_webgl_9e247bb82e5c20e0 = _webgl_e25c9b31409332e8);
}
else
{
(_webgl_9e247bb82e5c20e0 = gl_texture2D(_webgl_e2ddb1107a0c9a0a, (_webgl_a0b62b4d8ddcd62b + _webgl_df1a0b1dfe1c3652)));
}
(out_webgl_9b98566002e557b5 = _webgl_9e247bb82e5c20e0);
(out_webgl_9b98566002e557b5.x += 0.086266369);
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

