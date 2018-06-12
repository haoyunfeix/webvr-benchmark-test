
float float_ctor(int x0)
{
    return float(x0);
}
int int_ctor(float x0)
{
    return int(x0);
}
// Uniforms

uniform float4 _webgl_e0e31cceaa14c2ac : register(c0);
uniform float4 _webgl_ede3bf1fdcd962d7 : register(c1);
uniform float4 _webgl_952adf720a58d1c : register(c2);
uniform float4x4 _webgl_dd9d963d7cf1204e : register(c3);
static const uint _webgl_72d153d963873c79 = 0;
static const uint _webgl_dce711f263e3831e = 1;
static const uint _webgl_5c7c81c103b6fbdd = 2;
static const uint _webgl_48c27b57c3eb0c2d = 3;
uniform Texture2D<float4> textures2D[4] : register(t0);
uniform SamplerState samplers2D[4] : register(s0);
static const uint _webgl_6986087d25c4d2 = 4;
static const uint textureIndexOffsetCube = 4;
static const uint samplerIndexOffsetCube = 4;
uniform TextureCube<float4> texturesCube[1] : register(t4);
uniform SamplerState samplersCube[1] : register(s4);
#define ANGLE_USES_DISCARD_REWRITING
#ifdef ANGLE_ENABLE_LOOP_FLATTEN
#define LOOP [loop]
#define FLATTEN [flatten]
#else
#define LOOP
#define FLATTEN
#endif
// Varyings
static  float4 _webgl_51798873aa8ff428 = {0, 0, 0, 0};
static  float3 _webgl_5c81bf65ffac0762 = {0, 0, 0};
static  float3 _webgl_85d2dc26c2bd8386 = {0, 0, 0};
static  float3 _webgl_cc88c95a9917294 = {0, 0, 0};
static  float _webgl_b702800ba18a8f38 = {0};

static float4 out_webgl_9b98566002e557b5 = {0, 0, 0, 0};
static bool gl_FrontFacing = false;

cbuffer DriverConstants : register(b1)
{
    float3 dx_DepthFront : packoffset(c2);
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

float4 gl_textureCube(uint samplerIndex, float3 t)
{
    const uint textureIndex = samplerIndex - textureIndexOffsetCube;
    const uint samplerArrayIndex = samplerIndex - samplerIndexOffsetCube;
    return texturesCube[textureIndex].Sample(samplersCube[samplerArrayIndex], float3(t.x, t.y, t.z));
}

#define GL_USES_FRONT_FACING
void f_initGlobals();
;
static float3 _webgl_11482133dc10ada = {0, 0, 0};
void gl_main()
{
f_initGlobals();
(out_webgl_9b98566002e557b5 = float4(0.0, 0.0, 0.0, 0.0));
float _webgl_46ff895bf9a7f5a7 = {0.0};
float2 _webgl_57763a4402911770[8] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
float _webgl_a83c685e0b94ab27 = {0.0};
float _webgl_cf8458df2b8c766e = {0.0};
float3 _webgl_fd9fc3b9673b3865 = {0.0, 0.0, 0.0};
float2 _webgl_b9dbc88f2e352692 = {0.0, 0.0};
(_webgl_b9dbc88f2e352692 = (((_webgl_85d2dc26c2bd8386.xz / float2(16.0, -16.0)) * 0.5) + 0.5));
float4 _webgl_5ccca921d933644d = {0.0, 0.0, 0.0, 0.0};
(_webgl_5ccca921d933644d = gl_texture2D(_webgl_72d153d963873c79, _webgl_51798873aa8ff428.xy));
(_webgl_fd9fc3b9673b3865 = _webgl_5ccca921d933644d.xyz);
float4 _webgl_46665ba4a0ebb347 = {0.0, 0.0, 0.0, 0.0};
(_webgl_46665ba4a0ebb347 = gl_texture2D(_webgl_dce711f263e3831e, _webgl_51798873aa8ff428.xy));
float _webgl_73488ceaa0ef8fe3 = {0.0};
(_webgl_73488ceaa0ef8fe3 = _webgl_46665ba4a0ebb347.y);
if ((_webgl_46665ba4a0ebb347.y < 0.0099999998))
{
discard;
}
float _webgl_73ad0cb88cd907dd = {0.0};
(_webgl_73ad0cb88cd907dd = ((_webgl_b702800ba18a8f38 / 4.0) + 0.0099999998));
(_webgl_cf8458df2b8c766e = _webgl_73ad0cb88cd907dd);
(_webgl_a83c685e0b94ab27 = 0.0);
(_webgl_57763a4402911770[0] = float2(-0.0063926252, -0.0037208591));
(_webgl_57763a4402911770[1] = float2(-0.0043243221, -0.01204515));
(_webgl_57763a4402911770[2] = float2(-0.0079743592, 0.0048042112));
(_webgl_57763a4402911770[3] = float2(0.0071051298, 0.0035400391));
(_webgl_57763a4402911770[4] = float2(-0.0002272555, 0.01017307));
(_webgl_57763a4402911770[5] = float2(0.0045288811, -0.0072947838));
(_webgl_57763a4402911770[6] = float2(0.01312843, -0.0046607279));
(_webgl_57763a4402911770[7] = float2(0.01099158, 0.01052593));
{LOOP for(int _webgl_bc97f00c4c4fcde9 = {0}; (_webgl_bc97f00c4c4fcde9 < 8); (_webgl_bc97f00c4c4fcde9++))
{
float4 _webgl_4879e67e5ac43730 = {0.0, 0.0, 0.0, 0.0};
(_webgl_4879e67e5ac43730 = gl_texture2D(_webgl_5c7c81c103b6fbdd, (_webgl_b9dbc88f2e352692 + _webgl_57763a4402911770[int_ctor(clamp(float_ctor(_webgl_bc97f00c4c4fcde9), 0.0, 7.0))])));
float _webgl_e25c9b31409332e8 = {0.0};
if ((_webgl_cf8458df2b8c766e < _webgl_4879e67e5ac43730.w))
{
(_webgl_e25c9b31409332e8 = 0.125);
}
else
{
(_webgl_e25c9b31409332e8 = 0.0);
}
(_webgl_a83c685e0b94ab27 = (_webgl_a83c685e0b94ab27 + _webgl_e25c9b31409332e8));
}
}
(_webgl_fd9fc3b9673b3865 = (_webgl_5ccca921d933644d.xyz * (1.0 - (_webgl_a83c685e0b94ab27 * 0.40000001))));
(_webgl_fd9fc3b9673b3865 = (_webgl_fd9fc3b9673b3865 * ((_webgl_73ad0cb88cd907dd / 3.0) + 0.83999997)));
float4 _webgl_91c6fbb789786f97 = {0.0, 0.0, 0.0, 0.0};
(_webgl_91c6fbb789786f97 = gl_textureCube(_webgl_6986087d25c4d2, float3(0.0, 1.0, 0.0)));
float3 _webgl_9e247bb82e5c20e0 = {0.0, 0.0, 0.0};
(_webgl_9e247bb82e5c20e0 = ((8.0 * _webgl_91c6fbb789786f97.w) * _webgl_91c6fbb789786f97.xyz));
(_webgl_fd9fc3b9673b3865 = ((_webgl_fd9fc3b9673b3865 * _webgl_9e247bb82e5c20e0) * (_webgl_9e247bb82e5c20e0 * 3.0)));
float _webgl_3489059248406aa1 = {0.0};
if (gl_FrontFacing)
{
(_webgl_3489059248406aa1 = 1.0);
}
else
{
(_webgl_3489059248406aa1 = 0.75);
}
(_webgl_fd9fc3b9673b3865 = (_webgl_fd9fc3b9673b3865 * _webgl_3489059248406aa1));
(_webgl_11482133dc10ada = (_webgl_5c81bf65ffac0762 - _webgl_e0e31cceaa14c2ac.xyz));
float3 _webgl_9086f39b9ec20200 = {0.0, 0.0, 0.0};
(_webgl_9086f39b9ec20200 = normalize(_webgl_11482133dc10ada));
float _webgl_67e95ff7386915dc = {0.0};
float _webgl_f06ab770d8ec1876 = {0.0};
(_webgl_f06ab770d8ec1876 = dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada));
float _webgl_cd6eaaff7ab905f1 = {0.0};
(_webgl_cd6eaaff7ab905f1 = (1.0 / _webgl_e0e31cceaa14c2ac.w));
(_webgl_67e95ff7386915dc = ((1.0 / (_webgl_f06ab770d8ec1876 + 1.0)) * 16.0));
float _webgl_b8534f172b094d4f = {0.0};
(_webgl_b8534f172b094d4f = (_webgl_f06ab770d8ec1876 * (_webgl_cd6eaaff7ab905f1 * _webgl_cd6eaaff7ab905f1)));
float _webgl_6472b8a26530e78b = {0.0};
(_webgl_6472b8a26530e78b = clamp((1.0 - (_webgl_b8534f172b094d4f * _webgl_b8534f172b094d4f)), 0.0, 1.0));
(_webgl_67e95ff7386915dc = (_webgl_67e95ff7386915dc * (_webgl_6472b8a26530e78b * _webgl_6472b8a26530e78b)));
float _webgl_ba8e8168781d9774 = {0.0};
(_webgl_ba8e8168781d9774 = clamp(((dot(_webgl_9086f39b9ec20200, _webgl_ede3bf1fdcd962d7.xyz) - _webgl_952adf720a58d1c.w) / (_webgl_ede3bf1fdcd962d7.w - _webgl_952adf720a58d1c.w)), 0.0, 1.0));
(_webgl_46ff895bf9a7f5a7 = (_webgl_67e95ff7386915dc * (_webgl_ba8e8168781d9774 * (_webgl_ba8e8168781d9774 * (3.0 - (2.0 * _webgl_ba8e8168781d9774))))));
if ((_webgl_46ff895bf9a7f5a7 > 9.9999997e-06))
{
(_webgl_46ff895bf9a7f5a7 = (_webgl_46ff895bf9a7f5a7 * clamp(((dot(_webgl_cc88c95a9917294, _webgl_9086f39b9ec20200) * 0.75) + 0.25), 0.0, 1.0)));
float4 _webgl_e02fe76ec931c1d0 = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_dad807c3e946fcc4 = {0.0, 0.0, 0.0, 0.0};
(_webgl_dad807c3e946fcc4.w = 1.0);
(_webgl_dad807c3e946fcc4.xyz = _webgl_5c81bf65ffac0762);
float4 _webgl_4a69825d2061f2e4 = {0.0, 0.0, 0.0, 0.0};
(_webgl_4a69825d2061f2e4 = mul(transpose(_webgl_dd9d963d7cf1204e), _webgl_dad807c3e946fcc4));
(_webgl_e02fe76ec931c1d0.zw = _webgl_4a69825d2061f2e4.zw);
(_webgl_e02fe76ec931c1d0.xy = (_webgl_4a69825d2061f2e4.xy / _webgl_4a69825d2061f2e4.w));
float _webgl_1c8e0ad27f695a14 = {0.0};
(_webgl_1c8e0ad27f695a14 = ((sqrt(dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada)) / _webgl_e0e31cceaa14c2ac.w) + -0.00019999999));
float4 _webgl_5cfd34df9dcb15f5 = {0.0, 0.0, 0.0, 0.0};
(_webgl_5cfd34df9dcb15f5 = gl_texture2D(_webgl_48c27b57c3eb0c2d, _webgl_e02fe76ec931c1d0.xy));
float3 _webgl_cfe4f407d6834756 = {0.0, 0.0, 0.0};
(_webgl_cfe4f407d6834756.z = 0.0);
(_webgl_cfe4f407d6834756.x = ((_webgl_5cfd34df9dcb15f5.y * 0.0039215689) + _webgl_5cfd34df9dcb15f5.x));
(_webgl_cfe4f407d6834756.y = ((_webgl_5cfd34df9dcb15f5.w * 0.0039215689) + _webgl_5cfd34df9dcb15f5.z));
float _webgl_8eabcbad90e5f7cf = {0.0};
(_webgl_8eabcbad90e5f7cf = (0.1 * _webgl_1c8e0ad27f695a14));
float _webgl_45bc8ea7e5f7a77c = {0.0};
(_webgl_45bc8ea7e5f7a77c = max((_webgl_cfe4f407d6834756.y - (_webgl_cfe4f407d6834756.x * _webgl_cfe4f407d6834756.x)), (_webgl_8eabcbad90e5f7cf * _webgl_8eabcbad90e5f7cf)));
float _webgl_d7a381f02878b408 = {0.0};
(_webgl_d7a381f02878b408 = (_webgl_1c8e0ad27f695a14 - _webgl_cfe4f407d6834756.x));
float _webgl_1e0a569fa8d323c5 = {0.0};
(_webgl_1e0a569fa8d323c5 = (_webgl_45bc8ea7e5f7a77c / (_webgl_45bc8ea7e5f7a77c + (_webgl_d7a381f02878b408 * _webgl_d7a381f02878b408))));
float _webgl_6b1576cc49ca380b = {0.0};
if ((_webgl_1c8e0ad27f695a14 <= _webgl_cfe4f407d6834756.x))
{
(_webgl_6b1576cc49ca380b = 1.0);
}
else
{
(_webgl_6b1576cc49ca380b = _webgl_1e0a569fa8d323c5);
}
(_webgl_46ff895bf9a7f5a7 = (_webgl_46ff895bf9a7f5a7 * _webgl_6b1576cc49ca380b));
}
(_webgl_fd9fc3b9673b3865 = (_webgl_fd9fc3b9673b3865 + (_webgl_5ccca921d933644d.xyz * (_webgl_46ff895bf9a7f5a7 * _webgl_952adf720a58d1c.xyz))));
float4 _webgl_82fa7c9f93cc7839 = {0.0, 0.0, 0.0, 0.0};
(_webgl_82fa7c9f93cc7839.xyz = _webgl_fd9fc3b9673b3865);
(_webgl_82fa7c9f93cc7839.w = _webgl_73488ceaa0ef8fe3);
(out_webgl_9b98566002e557b5 = _webgl_82fa7c9f93cc7839);
(out_webgl_9b98566002e557b5.x += 0.67472112);
}
void f_initGlobals()
{
(_webgl_11482133dc10ada = float3(0.0, 0.0, 0.0));
}
struct PS_INPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD5;
    float4 v0 : TEXCOORD0;
    float3 v1 : TEXCOORD1;
    float3 v2 : TEXCOORD2;
    float3 v3 : TEXCOORD3;
    float v4 : TEXCOORD4;
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

PS_OUTPUT main(PS_INPUT input, bool isFrontFace : SV_IsFrontFace)
{
    gl_FrontFacing = isFrontFace;
    _webgl_51798873aa8ff428 = input.v0;
    _webgl_5c81bf65ffac0762 = input.v1.xyz;
    _webgl_85d2dc26c2bd8386 = input.v2.xyz;
    _webgl_cc88c95a9917294 = input.v3.xyz;
    _webgl_b702800ba18a8f38 = input.v4.x;

    gl_main();

    return generateOutput();
}

