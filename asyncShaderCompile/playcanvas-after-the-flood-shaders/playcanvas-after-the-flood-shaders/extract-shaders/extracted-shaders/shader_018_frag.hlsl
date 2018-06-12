
float float_ctor(int x0)
{
    return float(x0);
}
int int_ctor(float x0)
{
    return int(x0);
}
// Uniforms

uniform float _webgl_9a8fb5cd706f4c3 : register(c0);
uniform float _webgl_c43f03d972c5db0d : register(c1);
uniform float _webgl_3001886dadbe6f54 : register(c2);
uniform float3 _webgl_35c9514d594e36f3 : register(c3);
uniform float4 _webgl_97e3853eeeba30fe : register(c4);
uniform float4x4 _webgl_f867f0698072792a : register(c5);
uniform float _webgl_cea3fc0f0f4833fc : register(c9);
static const uint _webgl_8d50257ab10a2ab8 = 0;
static const uint _webgl_6b5660977841a815 = 1;
static const uint _webgl_dd687c2ee4f982d2 = 2;
static const uint _webgl_b58eb3b9eb95516f = 3;
static const uint _webgl_a9c82fa78288da5a = 4;
uniform Texture2D<float4> textures2D[5] : register(t0);
uniform SamplerState samplers2D[5] : register(s0);
#ifdef ANGLE_ENABLE_LOOP_FLATTEN
#define LOOP [loop]
#define FLATTEN [flatten]
#else
#define LOOP
#define FLATTEN
#endif
// Varyings
static  float3 _webgl_5c81bf65ffac0762 = {0, 0, 0};

static float4 out_webgl_9b98566002e557b5 = {0, 0, 0, 0};
static float4 gl_FragCoord = float4(0, 0, 0, 0);

cbuffer DriverConstants : register(b1)
{
    float4 dx_ViewCoords : packoffset(c1);
    float3 dx_DepthFront : packoffset(c2);
    float2 dx_ViewScale : packoffset(c3);
    struct SamplerMetadata
    {
        int baseLevel;
        int internalFormatBits;
        int wrapModes;
        int padding;
    };
    SamplerMetadata samplerMetadata[5] : packoffset(c4);
};

float4 gl_texture2D(uint samplerIndex, float2 t)
{
    return textures2D[samplerIndex].Sample(samplers2D[samplerIndex], float2(t.x, t.y));
}

#define GL_USES_FRAG_COORD
void f_initGlobals();
;
static float _webgl_4646de2b419a5ed6 = {0};
void gl_main()
{
f_initGlobals();
(out_webgl_9b98566002e557b5 = float4(0.0, 0.0, 0.0, 0.0));
float2 _webgl_5bbac17ec5c6724e = {0.0, 0.0};
float2 _webgl_c837291df1a7f73 = {0.0, 0.0};
float2 _webgl_bfbae5589e92e405 = {0.0, 0.0};
float2 _webgl_9588f7b615f55b4c[1] = {0.0, 0.0};
float _webgl_8e1d86b9222ad0d0 = {0.0};
float _webgl_7137a359faf3962d = {0.0};
float3 _webgl_fe2962d47f6c31f = {0.0, 0.0, 0.0};
float2 _webgl_6ae456d0c93f1540 = {0.0, 0.0};
float3 _webgl_8fcfc26bf145232 = {0.0, 0.0, 0.0};
(_webgl_8fcfc26bf145232 = normalize((_webgl_5c81bf65ffac0762 - _webgl_35c9514d594e36f3)));
float2 _webgl_73ad0cb88cd907dd = {0.0, 0.0};
(_webgl_73ad0cb88cd907dd = ((0.40000001 * _webgl_5c81bf65ffac0762.xz) + (_webgl_9a8fb5cd706f4c3 * _webgl_cea3fc0f0f4833fc)));
(_webgl_6ae456d0c93f1540 = _webgl_73ad0cb88cd907dd);
(_webgl_fe2962d47f6c31f = float3(0.0, 0.0, 0.0));
(_webgl_7137a359faf3962d = 0.0);
(_webgl_8e1d86b9222ad0d0 = 0.0);
(_webgl_9588f7b615f55b4c[0] = float2(0.0, 0.0));
(_webgl_bfbae5589e92e405 = ddx(_webgl_73ad0cb88cd907dd));
float2 _webgl_4879e67e5ac43730 = {0.0, 0.0};
(_webgl_4879e67e5ac43730 = ddy(_webgl_73ad0cb88cd907dd));
(_webgl_c837291df1a7f73 = _webgl_4879e67e5ac43730);
(_webgl_4646de2b419a5ed6 = dot(abs(_webgl_4879e67e5ac43730), float2(1.0, 1.0)));
float4 _webgl_e25c9b31409332e8 = {0.0, 0.0, 0.0, 0.0};
(_webgl_e25c9b31409332e8.w = 1.0);
(_webgl_e25c9b31409332e8.xyz = _webgl_5c81bf65ffac0762);
float2 _webgl_93901867cd02e4bf = {0.0, 0.0};
(_webgl_93901867cd02e4bf = mul(transpose(_webgl_f867f0698072792a), _webgl_e25c9b31409332e8).zw);
float _webgl_9e247bb82e5c20e0 = {0.0};
(_webgl_9e247bb82e5c20e0 = (_webgl_3001886dadbe6f54 - _webgl_c43f03d972c5db0d));
float _webgl_3489059248406aa1 = {0.0};
(_webgl_3489059248406aa1 = (_webgl_3001886dadbe6f54 + _webgl_c43f03d972c5db0d));
float _webgl_9086f39b9ec20200 = {0.0};
(_webgl_9086f39b9ec20200 = (2.0 * _webgl_c43f03d972c5db0d));
float2 _webgl_8d0dee145a45a4b3 = {0.0, 0.0};
(_webgl_8d0dee145a45a4b3 = (gl_FragCoord.xy * _webgl_97e3853eeeba30fe.zw));
float _webgl_f06ab770d8ec1876 = {0.0};
(_webgl_f06ab770d8ec1876 = clamp(pow((abs(((_webgl_9086f39b9ec20200 / (_webgl_3489059248406aa1 - ((((_webgl_93901867cd02e4bf.x / _webgl_93901867cd02e4bf.y) * 0.5) + 0.5) * _webgl_9e247bb82e5c20e0))) - (_webgl_9086f39b9ec20200 / (_webgl_3489059248406aa1 - (gl_texture2D(_webgl_a9c82fa78288da5a, _webgl_8d0dee145a45a4b3).x * _webgl_9e247bb82e5c20e0))))) * 200.0), 0.5), 0.0, 1.0));
(_webgl_5bbac17ec5c6724e = normalize((_webgl_5c81bf65ffac0762.xz - _webgl_35c9514d594e36f3.xz)));
{LOOP for(int _webgl_c9355afc1aa04056 = {0}; (_webgl_c9355afc1aa04056 < 1); (_webgl_c9355afc1aa04056++))
{
float2 _webgl_d5223f8c8a71619e = {0.0, 0.0};
float3 _webgl_d2d929d1e4b2d26a = {0.0, 0.0, 0.0};
float3 _webgl_9fcb034775ff45dd = {0.0, 0.0, 0.0};
float2 _webgl_ba8e8168781d9774 = {0.0, 0.0};
(_webgl_ba8e8168781d9774 = ((_webgl_6ae456d0c93f1540 + (_webgl_9588f7b615f55b4c[int_ctor(clamp(float_ctor(_webgl_c9355afc1aa04056), 0.0, 0.0))].x * _webgl_bfbae5589e92e405)) + (_webgl_9588f7b615f55b4c[int_ctor(clamp(float_ctor(_webgl_c9355afc1aa04056), 0.0, 0.0))].y * _webgl_c837291df1a7f73)));
(_webgl_9fcb034775ff45dd = (((gl_texture2D(_webgl_dd687c2ee4f982d2, _webgl_ba8e8168781d9774).xzy * 2.0) - 1.0) + ((gl_texture2D(_webgl_dd687c2ee4f982d2, (_webgl_ba8e8168781d9774 * 0.5)).xzy * 2.0) - 1.0)));
(_webgl_9fcb034775ff45dd = (_webgl_9fcb034775ff45dd + ((gl_texture2D(_webgl_dd687c2ee4f982d2, (_webgl_ba8e8168781d9774 * 0.25)).xzy * 2.0) - 1.0)));
(_webgl_d2d929d1e4b2d26a = (((gl_texture2D(_webgl_dd687c2ee4f982d2, _webgl_ba8e8168781d9774.yx).xzy * 2.0) - 1.0) + ((gl_texture2D(_webgl_dd687c2ee4f982d2, (_webgl_ba8e8168781d9774.yx * 0.5)).xzy * 2.0) - 1.0)));
(_webgl_d2d929d1e4b2d26a = (_webgl_d2d929d1e4b2d26a + ((gl_texture2D(_webgl_dd687c2ee4f982d2, (_webgl_ba8e8168781d9774.yx * 0.25)).xzy * 2.0) - 1.0)));
(_webgl_9fcb034775ff45dd = (normalize(lerp(_webgl_9fcb034775ff45dd, _webgl_d2d929d1e4b2d26a, abs(_webgl_5bbac17ec5c6724e.x))) + ((((gl_texture2D(_webgl_b58eb3b9eb95516f, (_webgl_ba8e8168781d9774 * 0.025)).xyz * 2.0) - 1.0) + ((gl_texture2D(_webgl_b58eb3b9eb95516f, ((_webgl_ba8e8168781d9774 * 0.025) + 0.5)).xyz * 2.0) - 1.0)) * 0.25)));
float3 _webgl_bd1cf0f064bc6fed = {0.0, 0.0, 0.0};
(_webgl_bd1cf0f064bc6fed = normalize(_webgl_9fcb034775ff45dd));
(_webgl_9fcb034775ff45dd = _webgl_bd1cf0f064bc6fed);
float _webgl_dad807c3e946fcc4 = {0.0};
(_webgl_dad807c3e946fcc4 = (1.0 - max(dot(_webgl_bd1cf0f064bc6fed, (-_webgl_8fcfc26bf145232)), 0.0)));
float _webgl_4a69825d2061f2e4 = {0.0};
(_webgl_4a69825d2061f2e4 = (_webgl_dad807c3e946fcc4 * _webgl_dad807c3e946fcc4));
(_webgl_7137a359faf3962d = (_webgl_7137a359faf3962d + (0.039999999 + ((0.95999998 * _webgl_dad807c3e946fcc4) * (_webgl_4a69825d2061f2e4 * _webgl_4a69825d2061f2e4)))));
(_webgl_d5223f8c8a71619e.x = (_webgl_bd1cf0f064bc6fed.x * 0.25));
(_webgl_d5223f8c8a71619e.y = (_webgl_bd1cf0f064bc6fed.z * 2.0));
(_webgl_d5223f8c8a71619e = (_webgl_d5223f8c8a71619e / ((_webgl_4646de2b419a5ed6 * 3.0) + 1.0)));
float2 _webgl_60871dc04e5a0b9f = {0.0, 0.0};
float2 _webgl_5cfd34df9dcb15f5 = {0.0, 0.0};
(_webgl_5cfd34df9dcb15f5 = (gl_FragCoord.xy * _webgl_97e3853eeeba30fe.zw));
(_webgl_60871dc04e5a0b9f = (_webgl_5cfd34df9dcb15f5 + _webgl_d5223f8c8a71619e));
float2 _webgl_de4e20ca80c6aab5 = {0.0, 0.0};
(_webgl_de4e20ca80c6aab5 = (_webgl_5cfd34df9dcb15f5 + _webgl_d5223f8c8a71619e));
(_webgl_fe2962d47f6c31f = (_webgl_fe2962d47f6c31f + lerp(gl_texture2D(_webgl_8d50257ab10a2ab8, _webgl_60871dc04e5a0b9f).xyz, gl_texture2D(_webgl_6b5660977841a815, _webgl_de4e20ca80c6aab5).xyz, clamp(_webgl_4646de2b419a5ed6, 0.0, 1.0))));
(_webgl_8e1d86b9222ad0d0 = (_webgl_8e1d86b9222ad0d0 + clamp((dot(float3(0.0, 0.1961161, 0.98058069), _webgl_bd1cf0f064bc6fed) * 4.0), 0.0, 1.0)));
}
}
float4 _webgl_8eabcbad90e5f7cf = {0.0, 0.0, 0.0, 0.0};
(_webgl_8eabcbad90e5f7cf.xyz = lerp((float3(0.02422294, 0.03702851, 0.063814871) * _webgl_8e1d86b9222ad0d0), _webgl_fe2962d47f6c31f, _webgl_7137a359faf3962d));
(_webgl_8eabcbad90e5f7cf.w = _webgl_f06ab770d8ec1876);
(out_webgl_9b98566002e557b5 = _webgl_8eabcbad90e5f7cf);
(out_webgl_9b98566002e557b5.x += 0.62128103);
}
void f_initGlobals()
{
(_webgl_4646de2b419a5ed6 = 0.0);
}
struct PS_INPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD1;
    float4 gl_FragCoord : TEXCOORD2;
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
    float rhw = 1.0 / input.gl_FragCoord.w;
    gl_FragCoord.x = input.dx_Position.x;
    gl_FragCoord.y = input.dx_Position.y;
    gl_FragCoord.z = (input.gl_FragCoord.z * rhw) * dx_DepthFront.x + dx_DepthFront.y;
    gl_FragCoord.w = rhw;
    _webgl_5c81bf65ffac0762 = input.v0.xyz;

    gl_main();

    return generateOutput();
}

