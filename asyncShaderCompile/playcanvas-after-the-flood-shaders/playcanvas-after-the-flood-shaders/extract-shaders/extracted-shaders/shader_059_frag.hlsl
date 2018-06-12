
// Uniforms

uniform float3 _webgl_35c9514d594e36f3 : register(c0);
uniform float _webgl_33b33495d4ae1dbb : register(c1);
#ifdef ANGLE_ENABLE_LOOP_FLATTEN
#define LOOP [loop]
#define FLATTEN [flatten]
#else
#define LOOP
#define FLATTEN
#endif
// Varyings
static  float3 _webgl_574c5c41cd2da6c7 = {0, 0, 0};

static float4 gl_Color[1] =
{
    float4(0, 0, 0, 0)
};

cbuffer DriverConstants : register(b1)
{
};

#define GL_USES_FRAG_DATA
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
float _webgl_4c8d970c18ac22ed = min((distance(_webgl_35c9514d594e36f3, _webgl_574c5c41cd2da6c7) / _webgl_33b33495d4ae1dbb), 0.99998999);
(gl_Color[0] = f_webgl_21919dad1d92a81(_webgl_4c8d970c18ac22ed));
(gl_Color[0].x += 0.7979489);
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
    _webgl_574c5c41cd2da6c7 = input.v0.xyz;

    gl_main();

    return generateOutput();
}

