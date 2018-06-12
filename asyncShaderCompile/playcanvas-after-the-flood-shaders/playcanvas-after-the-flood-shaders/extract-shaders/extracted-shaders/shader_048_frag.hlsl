
#ifdef ANGLE_ENABLE_LOOP_FLATTEN
#define LOOP [loop]
#define FLATTEN [flatten]
#else
#define LOOP
#define FLATTEN
#endif
// Varyings
static  float _webgl_215477360de748ea = {0};

static float4 gl_Color[1] =
{
    float4(0, 0, 0, 0)
};

cbuffer DriverConstants : register(b1)
{
};

#define GL_USES_FRAG_COLOR
float4 mod_emu(float4 x, float4 y)
{
    return x - y * floor(x / y);
}


float4 f_webgl_21919dad1d92a81(in float _webgl_4c8d970c18ac22ed)
{
float4 _webgl_4ba25cf9b5244b88 = (mod_emu(((_webgl_4c8d970c18ac22ed * float4(16777216.0, 65536.0, 256.0, 1.0)) * float4(255.0, 255.0, 255.0, 255.0)), float4(256.0, 256.0, 256.0, 256.0)) / float4(255.0, 255.0, 255.0, 255.0));
(_webgl_4ba25cf9b5244b88 -= (_webgl_4ba25cf9b5244b88.xxyz * float4(0.0, 0.00390625, 0.00390625, 0.00390625)));
return _webgl_4ba25cf9b5244b88;
}
void gl_main()
{
(gl_Color[0] = float4(0.0, 0.0, 0.0, 0.0));
float _webgl_4c8d970c18ac22ed = _webgl_215477360de748ea;
(gl_Color[0] = f_webgl_21919dad1d92a81(_webgl_4c8d970c18ac22ed));
(gl_Color[0].x += 0.44904587);
}
struct PS_INPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD1;
    float v0 : TEXCOORD0;
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
    _webgl_215477360de748ea = input.v0.x;

    gl_main();

    return generateOutput();
}

