
float4 vec4_ctor(float2 x0, float2 x1)
{
    return float4(x0, x1);
}
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

#define GL_USES_FRAG_COLOR
float2 f_webgl_ce43f59ea80687c3(in float _webgl_f8057cd9a47842a)
{
float2 _webgl_1da11641f0eb1d8c = (float2(1.0, 255.0) * _webgl_f8057cd9a47842a);
(_webgl_1da11641f0eb1d8c = frac(_webgl_1da11641f0eb1d8c));
(_webgl_1da11641f0eb1d8c -= (_webgl_1da11641f0eb1d8c.yy * float2(0.0039215689, 0.0039215689)));
return _webgl_1da11641f0eb1d8c;
}
void gl_main()
{
(gl_Color[0] = float4(0.0, 0.0, 0.0, 0.0));
float _webgl_4c8d970c18ac22ed = min((distance(_webgl_35c9514d594e36f3, _webgl_574c5c41cd2da6c7) / _webgl_33b33495d4ae1dbb), 0.99998999);
(gl_Color[0] = vec4_ctor(f_webgl_ce43f59ea80687c3(_webgl_4c8d970c18ac22ed), f_webgl_ce43f59ea80687c3((_webgl_4c8d970c18ac22ed * _webgl_4c8d970c18ac22ed))));
(gl_Color[0].x += 0.88411623);
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

