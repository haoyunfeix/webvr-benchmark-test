
#ifdef ANGLE_ENABLE_LOOP_FLATTEN
#define LOOP [loop]
#define FLATTEN [flatten]
#else
#define LOOP
#define FLATTEN
#endif
// Varyings

static float4 out_webgl_9b98566002e557b5 = {0, 0, 0, 0};

cbuffer DriverConstants : register(b1)
{
};

void gl_main()
{
(out_webgl_9b98566002e557b5 = float4(0.0, 0.0, 0.0, 0.0));
(out_webgl_9b98566002e557b5 = float4(2147483904.0, 2147483904.0, 2147483904.0, 2147483904.0));
(out_webgl_9b98566002e557b5.x += 0.81805938);
}
struct PS_INPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD0;
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

    gl_main();

    return generateOutput();
}

