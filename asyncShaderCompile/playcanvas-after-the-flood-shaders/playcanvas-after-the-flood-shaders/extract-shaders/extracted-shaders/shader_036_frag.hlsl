
float float_ctor(int x0)
{
    return float(x0);
}
float3 vec3_ctor(float x0, float x1, float x2)
{
    return float3(x0, x1, x2);
}
float4 vec4_ctor(float3 x0, float x1)
{
    return float4(x0, x1);
}
int int_ctor(float x0)
{
    return int(x0);
}
// Uniforms

uniform float3 _webgl_35c9514d594e36f3 : register(c0);
uniform float3 _webgl_1855da97c0758e43 : register(c1);
uniform float3 _webgl_16d8e27babe3e15e : register(c2);
uniform float _webgl_1a380463a8bc7359 : register(c3);
uniform float3 _webgl_35202d7eed2427d : register(c4);
uniform float _webgl_2dd2385497bef344 : register(c5);
uniform float _webgl_755af7149e45828a : register(c6);
uniform float3 _webgl_10617a1597481d62 : register(c7);
uniform float3 _webgl_71e3cad5e42a89bb : register(c8);
uniform float _webgl_1c82dc879cda6ae2 : register(c9);
uniform float3 _webgl_a8a39767ea2c8eb7 : register(c10);
uniform float _webgl_e6010fd023fb284f : register(c11);
uniform float _webgl_34ab7d99e8e69aa4 : register(c12);
uniform float4x4 _webgl_80ac1a8d68a70197 : register(c13);
uniform float4 _webgl_41a0cad7d2087d04 : register(c17);
uniform float3 _webgl_3b3710b9db4788a7 : register(c18);
uniform float _webgl_5985a6d987efdfc3 : register(c19);
uniform float _webgl_ae2115093f2ac183 : register(c20);
uniform float3 _webgl_16cc37db4120bb6a : register(c21);
uniform float3 _webgl_2d459f8069f64681 : register(c22);
uniform float3 _webgl_e2179ae4f2cb06c9 : register(c23);
uniform float _webgl_508641f47c99a2ed : register(c24);
uniform float _webgl_7ae668e5b64ca8de : register(c25);
uniform float _webgl_d5b4509b9521f54c : register(c26);
static const uint _webgl_b153a7264c2e8600 = 0;
static const uint _webgl_bb15c76ae884963b = 1;
uniform Texture2D<float4> textures2D[2] : register(t0);
uniform SamplerState samplers2D[2] : register(s0);
static const uint _webgl_e2d4935665806094 = 2;
static const uint _webgl_6d18ad23908e287 = 3;
static const uint _webgl_6666018523ec4102 = 4;
static const uint _webgl_f40e146fb06e4a34 = 5;
static const uint _webgl_340f351c4a4314aa = 6;
static const uint _webgl_7b5e6932dac63e22 = 7;
static const uint textureIndexOffsetCube = 2;
static const uint samplerIndexOffsetCube = 2;
uniform TextureCube<float4> texturesCube[6] : register(t2);
uniform SamplerState samplersCube[6] : register(s2);
#define ANGLE_USES_DISCARD_REWRITING
#ifdef ANGLE_ENABLE_LOOP_FLATTEN
#define LOOP [loop]
#define FLATTEN [flatten]
#else
#define LOOP
#define FLATTEN
#endif
// Varyings
static  float3 _webgl_5c81bf65ffac0762 = {0, 0, 0};
static  float3 _webgl_cc88c95a9917294 = {0, 0, 0};
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
    SamplerMetadata samplerMetadata[8] : packoffset(c4);
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

void f_initGlobals();
;
float f_webgl_93001c0951e72038(in float _webgl_4fc82888d13de398)
{
return (_webgl_4fc82888d13de398 * _webgl_4fc82888d13de398);
}
float f_webgl_bea42773d026d4c8(in float _webgl_4fc82888d13de398)
{
return clamp(_webgl_4fc82888d13de398, 0.0, 1.0);
}
static float4 _webgl_9d2f5706d0aa9ead = {0, 0, 0, 0};
static float3 _webgl_d7c0aae5deddf4ea = {0, 0, 0};
static float3 _webgl_d189f73da6eb4d5b = {0, 0, 0};
static float3 _webgl_ea774e1da0e85819 = {0, 0, 0};
static float3 _webgl_478e62ab579cb261 = {0, 0, 0};
static float3 _webgl_540f7c123bdf52c0 = {0, 0, 0};
static float3 _webgl_3d74e5997dd7c222 = {0, 0, 0};
static float3 _webgl_837ebae1efde008a = {0, 0, 0};
static float3 _webgl_11482133dc10ada = {0, 0, 0};
static float3 _webgl_6c8066f4a4675c4d = {0, 0, 0};
static float3 _webgl_d79a635a1802e5aa = {0, 0, 0};
static float3 _webgl_acb134d5a49c2148 = {0, 0, 0};
static float _webgl_8e684f5904e88831 = {0};
static float _webgl_af27c8244adc12b9 = {0};
static float _webgl_9251dcdacdfa452 = {0};
float f_webgl_e5ff67c21cabbf58(in float3 _webgl_6da8626fbc6e23e8, in float _webgl_6c7d9b3661519537, in float _webgl_807540bf766745ac)
{
float _webgl_a0afd0d394f4b6d6 = dot(_webgl_837ebae1efde008a, _webgl_6da8626fbc6e23e8);
return smoothstep(_webgl_807540bf766745ac, _webgl_6c7d9b3661519537, _webgl_a0afd0d394f4b6d6);
}
float f_webgl_d5d5f932fbc9b4f(in float _webgl_fb87a9ea762f8e6f)
{
float _webgl_5878af467b875678 = dot(_webgl_11482133dc10ada, _webgl_11482133dc10ada);
float _webgl_2163f66eb22a4098 = (1.0 / (_webgl_5878af467b875678 + 1.0));
float _webgl_5fc296872f702a67 = (1.0 / _webgl_fb87a9ea762f8e6f);
(_webgl_2163f66eb22a4098 *= 16.0);
(_webgl_2163f66eb22a4098 *= f_webgl_93001c0951e72038(f_webgl_bea42773d026d4c8((1.0 - f_webgl_93001c0951e72038((_webgl_5878af467b875678 * f_webgl_93001c0951e72038(_webgl_5fc296872f702a67)))))));
return _webgl_2163f66eb22a4098;
}
void f_webgl_8a66f0e11342f7e2(in float3 _webgl_e75ce0276b01cd13)
{
(_webgl_11482133dc10ada = (_webgl_5c81bf65ffac0762 - _webgl_e75ce0276b01cd13));
(_webgl_837ebae1efde008a = normalize(_webgl_11482133dc10ada));
(_webgl_6c8066f4a4675c4d = _webgl_e75ce0276b01cd13);
}
void f_webgl_28f4837284085b1e()
{
(_webgl_d189f73da6eb4d5b = normalize(_webgl_cc88c95a9917294));
}
float3 f_webgl_654295cf9299a0ab(in float3 _webgl_19dff938713edbff)
{
return _webgl_19dff938713edbff;
}
float3 f_webgl_834611898e692e01(in float3 _webgl_19dff938713edbff)
{
return _webgl_19dff938713edbff;
}
float3 f_webgl_15ae5b1d52ad2d0b(in float3 _webgl_19dff938713edbff)
{
float _webgl_4c8d970c18ac22ed = distance(_webgl_5c81bf65ffac0762, _webgl_35c9514d594e36f3);
float _webgl_1b96e8d779f57dbb = exp(((-_webgl_4c8d970c18ac22ed) * _webgl_5985a6d987efdfc3));
(_webgl_1b96e8d779f57dbb = clamp(_webgl_1b96e8d779f57dbb, 0.0, 1.0));
float3 _webgl_d54892b736cac3ab = lerp(_webgl_3b3710b9db4788a7, _webgl_19dff938713edbff, _webgl_1b96e8d779f57dbb);
return _webgl_d54892b736cac3ab;
}
float3 f_webgl_8d8ff5998186f163_float4(in float4 _webgl_e900016fc6347793)
{
float3 _webgl_19dff938713edbff = ((8.0 * _webgl_e900016fc6347793.w) * _webgl_e900016fc6347793.xyz);
return (_webgl_19dff938713edbff * _webgl_19dff938713edbff);
}
float3 f_webgl_a758f5fc1147ed52(in float3 _webgl_7a41522632563a93, in float _webgl_f25387b85927c2)
{
float _webgl_fdf716b85bed8f4d = (1.0 - (exp2(_webgl_f25387b85927c2) / 128.0));
float _webgl_46b7496943a4afed = max(max(abs(_webgl_7a41522632563a93.x), abs(_webgl_7a41522632563a93.y)), abs(_webgl_7a41522632563a93.z));
if ((abs(_webgl_7a41522632563a93.x) != _webgl_46b7496943a4afed))
{
(_webgl_7a41522632563a93.x *= _webgl_fdf716b85bed8f4d);
}
if ((abs(_webgl_7a41522632563a93.y) != _webgl_46b7496943a4afed))
{
(_webgl_7a41522632563a93.y *= _webgl_fdf716b85bed8f4d);
}
if ((abs(_webgl_7a41522632563a93.z) != _webgl_46b7496943a4afed))
{
(_webgl_7a41522632563a93.z *= _webgl_fdf716b85bed8f4d);
}
return _webgl_7a41522632563a93;
}
float3 f_webgl_97fe0d7dc5fe6378(in float3 _webgl_7a41522632563a93, in float _webgl_15da8e010e3d2a7c)
{
float _webgl_fdf716b85bed8f4d = _webgl_15da8e010e3d2a7c;
float _webgl_46b7496943a4afed = max(max(abs(_webgl_7a41522632563a93.x), abs(_webgl_7a41522632563a93.y)), abs(_webgl_7a41522632563a93.z));
if ((abs(_webgl_7a41522632563a93.x) != _webgl_46b7496943a4afed))
{
(_webgl_7a41522632563a93.x *= _webgl_fdf716b85bed8f4d);
}
if ((abs(_webgl_7a41522632563a93.y) != _webgl_46b7496943a4afed))
{
(_webgl_7a41522632563a93.y *= _webgl_fdf716b85bed8f4d);
}
if ((abs(_webgl_7a41522632563a93.z) != _webgl_46b7496943a4afed))
{
(_webgl_7a41522632563a93.z *= _webgl_fdf716b85bed8f4d);
}
return _webgl_7a41522632563a93;
}
float3 f_webgl_c457fd23fabd4ee6(in float3 _webgl_e6ba8c0c87a471bb)
{
return _webgl_e6ba8c0c87a471bb;
}
float3 f_webgl_86b210beb6a317a0(in float3 _webgl_19dff938713edbff)
{
return (_webgl_19dff938713edbff * _webgl_ae2115093f2ac183);
}
void f_webgl_230397f0b654f509()
{
(_webgl_d7c0aae5deddf4ea = _webgl_16cc37db4120bb6a.xyz);
}
void f_webgl_5589984abdd311ef()
{
(_webgl_af27c8244adc12b9 = gl_texture2D(_webgl_bb15c76ae884963b, _webgl_a0b62b4d8ddcd62b).y);
}
float3 f_webgl_10dfff12828ec336()
{
return _webgl_2d459f8069f64681;
}
float f_webgl_935daebc53194164(in float _webgl_6dadb533513758d5)
{
return _webgl_6dadb533513758d5;
}
void f_webgl_f5d0cf2b1868d446()
{
(_webgl_acb134d5a49c2148 = _webgl_e2179ae4f2cb06c9);
}
void f_webgl_1086a7b85d8e77b2()
{
(_webgl_8e684f5904e88831 = (_webgl_508641f47c99a2ed + 1e-07));
}
void f_webgl_51c07f2c0ff68139()
{
float _webgl_571493683c34d79 = (1.0 - max(dot(_webgl_d189f73da6eb4d5b, _webgl_ea774e1da0e85819), 0.0));
float _webgl_3bb6ee3540feaa04 = (_webgl_571493683c34d79 * _webgl_571493683c34d79);
(_webgl_571493683c34d79 *= (_webgl_3bb6ee3540feaa04 * _webgl_3bb6ee3540feaa04));
(_webgl_571493683c34d79 *= (_webgl_8e684f5904e88831 * _webgl_8e684f5904e88831));
(_webgl_acb134d5a49c2148 = (_webgl_acb134d5a49c2148 + ((1.0 - _webgl_acb134d5a49c2148) * _webgl_571493683c34d79)));
}
void f_webgl_e2bdd720a106a27d()
{
float _webgl_22cc110d08efe7b3 = (f_webgl_bea42773d026d4c8((1.0 - _webgl_8e684f5904e88831)) * 5.0);
int _webgl_bdaba8fc5c6aa143 = int_ctor(_webgl_22cc110d08efe7b3);
int _webgl_fecb2158b7ff87f4 = int_ctor(min((_webgl_22cc110d08efe7b3 + 1.0), 7.0));
float3 _webgl_c2001275e59135c2 = f_webgl_a758f5fc1147ed52(f_webgl_c457fd23fabd4ee6(_webgl_478e62ab579cb261), _webgl_22cc110d08efe7b3);
(_webgl_c2001275e59135c2.x *= -1.0);
float4 _webgl_eb70b68c68676807[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
(_webgl_eb70b68c68676807[0] = gl_textureCube(_webgl_e2d4935665806094, _webgl_c2001275e59135c2));
(_webgl_eb70b68c68676807[1] = gl_textureCube(_webgl_6d18ad23908e287, _webgl_c2001275e59135c2));
(_webgl_eb70b68c68676807[2] = gl_textureCube(_webgl_6666018523ec4102, _webgl_c2001275e59135c2));
(_webgl_eb70b68c68676807[3] = gl_textureCube(_webgl_f40e146fb06e4a34, _webgl_c2001275e59135c2));
(_webgl_eb70b68c68676807[4] = gl_textureCube(_webgl_340f351c4a4314aa, _webgl_c2001275e59135c2));
(_webgl_eb70b68c68676807[5] = gl_textureCube(_webgl_7b5e6932dac63e22, _webgl_c2001275e59135c2));
float4 _webgl_8ee4335731b3c0[2] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
{ for(int _webgl_6fdd29f02130ae3a = {0}; (_webgl_6fdd29f02130ae3a < 6); (_webgl_6fdd29f02130ae3a++))
{
if ((_webgl_6fdd29f02130ae3a == _webgl_bdaba8fc5c6aa143))
{
(_webgl_8ee4335731b3c0[0] = _webgl_eb70b68c68676807[int_ctor(clamp(float_ctor(_webgl_6fdd29f02130ae3a), 0.0, 5.0))]);
}
if ((_webgl_6fdd29f02130ae3a == _webgl_fecb2158b7ff87f4))
{
(_webgl_8ee4335731b3c0[1] = _webgl_eb70b68c68676807[int_ctor(clamp(float_ctor(_webgl_6fdd29f02130ae3a), 0.0, 5.0))]);
}
}
}
float4 _webgl_4ebef3641d0ac559 = lerp(_webgl_8ee4335731b3c0[0], _webgl_8ee4335731b3c0[1], frac(_webgl_22cc110d08efe7b3));
float3 _webgl_66857c8f9b0b1366 = f_webgl_86b210beb6a317a0(f_webgl_8d8ff5998186f163_float4(_webgl_4ebef3641d0ac559).xyz);
(_webgl_9d2f5706d0aa9ead += vec4_ctor(_webgl_66857c8f9b0b1366, _webgl_7ae668e5b64ca8de));
}
float f_webgl_8977c432e7c7911c(in float _webgl_2420662cd003acfa, in float _webgl_44a9acbe7629930d, in float _webgl_f8057cd9a47842a)
{
return f_webgl_bea42773d026d4c8(((_webgl_f8057cd9a47842a - _webgl_2420662cd003acfa) / (_webgl_44a9acbe7629930d - _webgl_2420662cd003acfa)));
}
float f_webgl_85d6f20addec6ac8(in float _webgl_a8bf8ceec99680f0, in float _webgl_b68b9c3183208461)
{
return f_webgl_8977c432e7c7911c(_webgl_b68b9c3183208461, 1.0, _webgl_a8bf8ceec99680f0);
}
float f_webgl_f757160e052cec0e(in float2 _webgl_a8aac1d62cdfa007, in float _webgl_a30419aa3ac24733, in float _webgl_a26d909cd55f808e, in float _webgl_fc7029719460f8d7)
{
float _webgl_af12e6062083faf3 = (_webgl_a8aac1d62cdfa007.y - (_webgl_a8aac1d62cdfa007.x * _webgl_a8aac1d62cdfa007.x));
(_webgl_af12e6062083faf3 = max(_webgl_af12e6062083faf3, _webgl_a26d909cd55f808e));
float _webgl_14a396257f58cd59 = (_webgl_a30419aa3ac24733 - _webgl_a8aac1d62cdfa007.x);
float _webgl_a8bf8ceec99680f0 = (_webgl_af12e6062083faf3 / (_webgl_af12e6062083faf3 + (_webgl_14a396257f58cd59 * _webgl_14a396257f58cd59)));
(_webgl_a8bf8ceec99680f0 = f_webgl_85d6f20addec6ac8(_webgl_a8bf8ceec99680f0, _webgl_fc7029719460f8d7));
float s4a9 = {0};
if ((_webgl_a30419aa3ac24733 <= _webgl_a8aac1d62cdfa007.x))
{
(s4a9 = 1.0);
}
else
{
(s4a9 = _webgl_a8bf8ceec99680f0);
}
return s4a9;
}
float f_webgl_1090626125cb65a9(in float3 _webgl_a8aac1d62cdfa007, in float _webgl_f35ae8026ce1c755, in float _webgl_6be1c52e34ec7219)
{
float _webgl_c1d1b780ae1a6f3d = _webgl_6be1c52e34ec7219;
float _webgl_a440234b5926ed36 = (_webgl_c1d1b780ae1a6f3d * _webgl_f35ae8026ce1c755);
float _webgl_4606cf48435dc8b = (_webgl_a440234b5926ed36 * _webgl_a440234b5926ed36);
return f_webgl_f757160e052cec0e(_webgl_a8aac1d62cdfa007.xy, _webgl_f35ae8026ce1c755, _webgl_4606cf48435dc8b, 0.1);
}
float f_webgl_4b44e00eba469333(in float2 _webgl_86a3c7784a8314b9)
{
return ((_webgl_86a3c7784a8314b9.y * 0.0039215689) + _webgl_86a3c7784a8314b9.x);
}
float f_webgl_985d979a1d8ad861(const uint _webgl_315c9636ffe07fd9, in float2 _webgl_e14dc49393e16c3a, in float _webgl_cc4b56a07922a118, in float _webgl_f35ae8026ce1c755, in float _webgl_6be1c52e34ec7219, in float _webgl_9847f95056da8f68)
{
float4 _webgl_95a61de88fbe7420 = gl_texture2D(_webgl_315c9636ffe07fd9, _webgl_e14dc49393e16c3a);
float3 _webgl_a8aac1d62cdfa007 = vec3_ctor(f_webgl_4b44e00eba469333(_webgl_95a61de88fbe7420.xy), f_webgl_4b44e00eba469333(_webgl_95a61de88fbe7420.zw), 0.0);
return f_webgl_1090626125cb65a9(_webgl_a8aac1d62cdfa007, _webgl_f35ae8026ce1c755, _webgl_6be1c52e34ec7219);
}
float f_webgl_32695504a013dc03_float4(const uint _webgl_1761ed58140faf78, in float4 _webgl_b2a02441e834cc72, in float _webgl_9847f95056da8f68)
{
return f_webgl_985d979a1d8ad861(_webgl_1761ed58140faf78, _webgl_d79a635a1802e5aa.xy, _webgl_b2a02441e834cc72.x, ((length(_webgl_11482133dc10ada) * _webgl_b2a02441e834cc72.w) + _webgl_b2a02441e834cc72.z), _webgl_b2a02441e834cc72.y, 0.0);
}
float f_webgl_442c823d5f280743(in float _webgl_cc4b56a07922a118, in float _webgl_f1dde1dab1a62fa8)
{
return _webgl_f1dde1dab1a62fa8;
}
void f_webgl_63a5dcaac66fd8a5_float4(in float4x4 _webgl_6410fad69308ac6a, in float4 _webgl_b2a02441e834cc72, in float3 _webgl_6fea1ed961239dd4)
{
float4 _webgl_62edb70069895a25 = mul(transpose(_webgl_6410fad69308ac6a), vec4_ctor(_webgl_6fea1ed961239dd4, 1.0));
(_webgl_62edb70069895a25.xy /= _webgl_62edb70069895a25.w);
(_webgl_d79a635a1802e5aa.xy = _webgl_62edb70069895a25.xy);
(_webgl_d79a635a1802e5aa.z = (_webgl_62edb70069895a25.z / _webgl_62edb70069895a25.w));
float _webgl_a34964a2a96b201f = (1.0 / _webgl_b2a02441e834cc72.w);
float _webgl_dad496b00e4a459a = (_webgl_a34964a2a96b201f / 1000.0);
(_webgl_d79a635a1802e5aa.z = ((-(((2.0 * _webgl_a34964a2a96b201f) * _webgl_dad496b00e4a459a) / (_webgl_a34964a2a96b201f - _webgl_dad496b00e4a459a))) / (_webgl_d79a635a1802e5aa.z - ((_webgl_a34964a2a96b201f + _webgl_dad496b00e4a459a) / (_webgl_a34964a2a96b201f - _webgl_dad496b00e4a459a)))));
(_webgl_d79a635a1802e5aa.z *= _webgl_b2a02441e834cc72.w);
(_webgl_d79a635a1802e5aa.z += (f_webgl_442c823d5f280743(_webgl_b2a02441e834cc72.x, _webgl_b2a02441e834cc72.z) * 10.0));
(_webgl_d79a635a1802e5aa.z /= _webgl_b2a02441e834cc72.w);
(_webgl_d79a635a1802e5aa.z = (((_webgl_a34964a2a96b201f + _webgl_dad496b00e4a459a) / (_webgl_a34964a2a96b201f - _webgl_dad496b00e4a459a)) - ((((2.0 * _webgl_a34964a2a96b201f) * _webgl_dad496b00e4a459a) / (_webgl_a34964a2a96b201f - _webgl_dad496b00e4a459a)) / _webgl_d79a635a1802e5aa.z)));
}
void f_webgl_b7acddf53468adb9_float4(in float4x4 _webgl_6410fad69308ac6a, in float4 _webgl_b2a02441e834cc72)
{
f_webgl_63a5dcaac66fd8a5_float4(_webgl_6410fad69308ac6a, _webgl_b2a02441e834cc72, _webgl_5c81bf65ffac0762);
}
float f_webgl_4db25d822bd7df35()
{
return max(dot(_webgl_d189f73da6eb4d5b, (-_webgl_837ebae1efde008a)), 0.0);
}
float f_webgl_438001b0d5f8bf0d()
{
float3 _webgl_8216a9694030d187 = normalize(((-_webgl_837ebae1efde008a) + _webgl_ea774e1da0e85819));
float _webgl_a5b838d4b59e70d1 = max(dot(_webgl_8216a9694030d187, _webgl_d189f73da6eb4d5b), 0.0);
float _webgl_35d847ddddbf76f2 = exp2((_webgl_8e684f5904e88831 * 11.0));
(_webgl_35d847ddddbf76f2 = f_webgl_935daebc53194164(_webgl_35d847ddddbf76f2));
(_webgl_35d847ddddbf76f2 = max(_webgl_35d847ddddbf76f2, 9.9999997e-05));
return ((pow(_webgl_a5b838d4b59e70d1, _webgl_35d847ddddbf76f2) * (_webgl_35d847ddddbf76f2 + 2.0)) / 8.0);
}
float3 f_webgl_ad5ebeca28ff8e1c()
{
return lerp((_webgl_d7c0aae5deddf4ea * _webgl_540f7c123bdf52c0), (_webgl_3d74e5997dd7c222 + (_webgl_9d2f5706d0aa9ead.xyz * _webgl_9d2f5706d0aa9ead.w)), _webgl_acb134d5a49c2148);
}
void f_webgl_a1c808d92c1f294c()
{
float3 _webgl_c2001275e59135c2 = f_webgl_97fe0d7dc5fe6378(_webgl_d189f73da6eb4d5b, 0.75);
(_webgl_c2001275e59135c2.x *= -1.0);
(_webgl_540f7c123bdf52c0 += f_webgl_86b210beb6a317a0(f_webgl_8d8ff5998186f163_float4(gl_textureCube(_webgl_7b5e6932dac63e22, _webgl_c2001275e59135c2)).xyz));
}
void f_webgl_d9c83b34075cfb4c(in float _webgl_2420662cd003acfa)
{
if ((_webgl_2420662cd003acfa < _webgl_d5b4509b9521f54c))
{
discard;
}
}
void f_webgl_ec107486846c8d1f()
{
(_webgl_ea774e1da0e85819 = normalize((_webgl_35c9514d594e36f3 - _webgl_5c81bf65ffac0762)));
}
void f_webgl_916ac0d729de40b4()
{
(_webgl_478e62ab579cb261 = normalize((-reflect(_webgl_ea774e1da0e85819, _webgl_d189f73da6eb4d5b))));
}
void gl_main()
{
f_initGlobals();
(out_webgl_9b98566002e557b5 = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_540f7c123bdf52c0 = float3(0.0, 0.0, 0.0));
(_webgl_3d74e5997dd7c222 = float3(0.0, 0.0, 0.0));
(_webgl_9d2f5706d0aa9ead = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_acb134d5a49c2148 = float3(0.0, 0.0, 0.0));
f_webgl_5589984abdd311ef();
f_webgl_d9c83b34075cfb4c(_webgl_af27c8244adc12b9);
f_webgl_ec107486846c8d1f();
f_webgl_28f4837284085b1e();
f_webgl_916ac0d729de40b4();
f_webgl_230397f0b654f509();
f_webgl_f5d0cf2b1868d446();
f_webgl_1086a7b85d8e77b2();
f_webgl_51c07f2c0ff68139();
f_webgl_a1c808d92c1f294c();
f_webgl_e2bdd720a106a27d();
f_webgl_8a66f0e11342f7e2(_webgl_16d8e27babe3e15e);
(_webgl_9251dcdacdfa452 = f_webgl_d5d5f932fbc9b4f(_webgl_1a380463a8bc7359));
if ((_webgl_9251dcdacdfa452 > 9.9999997e-06))
{
(_webgl_9251dcdacdfa452 *= f_webgl_e5ff67c21cabbf58(_webgl_35202d7eed2427d, _webgl_2dd2385497bef344, _webgl_755af7149e45828a));
(_webgl_9251dcdacdfa452 *= f_webgl_4db25d822bd7df35());
(_webgl_540f7c123bdf52c0 += (_webgl_9251dcdacdfa452 * _webgl_1855da97c0758e43));
(_webgl_9251dcdacdfa452 *= f_webgl_438001b0d5f8bf0d());
(_webgl_3d74e5997dd7c222 += (_webgl_9251dcdacdfa452 * _webgl_1855da97c0758e43));
}
f_webgl_8a66f0e11342f7e2(_webgl_71e3cad5e42a89bb);
(_webgl_9251dcdacdfa452 = f_webgl_d5d5f932fbc9b4f(_webgl_1c82dc879cda6ae2));
if ((_webgl_9251dcdacdfa452 > 9.9999997e-06))
{
(_webgl_9251dcdacdfa452 *= f_webgl_e5ff67c21cabbf58(_webgl_a8a39767ea2c8eb7, _webgl_e6010fd023fb284f, _webgl_34ab7d99e8e69aa4));
(_webgl_9251dcdacdfa452 *= f_webgl_4db25d822bd7df35());
f_webgl_b7acddf53468adb9_float4(_webgl_80ac1a8d68a70197, _webgl_41a0cad7d2087d04);
(_webgl_9251dcdacdfa452 *= f_webgl_32695504a013dc03_float4(_webgl_b153a7264c2e8600, _webgl_41a0cad7d2087d04, 0.0));
(_webgl_540f7c123bdf52c0 += (_webgl_9251dcdacdfa452 * _webgl_10617a1597481d62));
(_webgl_9251dcdacdfa452 *= f_webgl_438001b0d5f8bf0d());
(_webgl_3d74e5997dd7c222 += (_webgl_9251dcdacdfa452 * _webgl_10617a1597481d62));
}
(out_webgl_9b98566002e557b5.xyz = f_webgl_ad5ebeca28ff8e1c());
(out_webgl_9b98566002e557b5.xyz += f_webgl_10dfff12828ec336());
(out_webgl_9b98566002e557b5.xyz = f_webgl_15ae5b1d52ad2d0b(out_webgl_9b98566002e557b5.xyz));
(out_webgl_9b98566002e557b5.xyz = f_webgl_834611898e692e01(out_webgl_9b98566002e557b5.xyz));
(out_webgl_9b98566002e557b5.xyz = f_webgl_654295cf9299a0ab(out_webgl_9b98566002e557b5.xyz));
(out_webgl_9b98566002e557b5.w = _webgl_af27c8244adc12b9);
(out_webgl_9b98566002e557b5.x += 0.39825514);
}
void f_initGlobals()
{
(_webgl_9d2f5706d0aa9ead = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_d7c0aae5deddf4ea = float3(0.0, 0.0, 0.0));
(_webgl_d189f73da6eb4d5b = float3(0.0, 0.0, 0.0));
(_webgl_ea774e1da0e85819 = float3(0.0, 0.0, 0.0));
(_webgl_478e62ab579cb261 = float3(0.0, 0.0, 0.0));
(_webgl_540f7c123bdf52c0 = float3(0.0, 0.0, 0.0));
(_webgl_3d74e5997dd7c222 = float3(0.0, 0.0, 0.0));
(_webgl_837ebae1efde008a = float3(0.0, 0.0, 0.0));
(_webgl_11482133dc10ada = float3(0.0, 0.0, 0.0));
(_webgl_6c8066f4a4675c4d = float3(0.0, 0.0, 0.0));
(_webgl_d79a635a1802e5aa = float3(0.0, 0.0, 0.0));
(_webgl_acb134d5a49c2148 = float3(0.0, 0.0, 0.0));
(_webgl_8e684f5904e88831 = 0.0);
(_webgl_af27c8244adc12b9 = 0.0);
(_webgl_9251dcdacdfa452 = 0.0);
}
struct PS_INPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD3;
    float3 v0 : TEXCOORD0;
    float3 v1 : TEXCOORD1;
    float2 v2 : TEXCOORD2;
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
    _webgl_5c81bf65ffac0762 = input.v0.xyz;
    _webgl_cc88c95a9917294 = input.v1.xyz;
    _webgl_a0b62b4d8ddcd62b = input.v2.xy;

    gl_main();

    return generateOutput();
}

