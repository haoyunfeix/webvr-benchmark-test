
// Uniforms

uniform float4x4 _webgl_285673c8bc48ada1 : register(c0);
uniform float3 _webgl_35c9514d594e36f3 : register(c4);
uniform float _webgl_e841568a4415b2f5 : register(c5);
uniform float3 _webgl_3b3710b9db4788a7 : register(c6);
uniform float _webgl_5985a6d987efdfc3 : register(c7);
static const uint _webgl_49907f08947ea6a2 = 0;
static const uint _webgl_e98cbad5b53e7067 = 1;
static const uint _webgl_a281e172b023aebc = 2;
static const uint _webgl_f1f34a74fabade41 = 3;
uniform Texture2D<float4> textures2D[4] : register(t0);
uniform SamplerState samplers2D[4] : register(s0);
static const uint _webgl_14b00107d62a0ec7 = 4;
static const uint textureIndexOffsetCube = 4;
static const uint samplerIndexOffsetCube = 4;
uniform TextureCube<float4> texturesCube[1] : register(t4);
uniform SamplerState samplersCube[1] : register(s4);
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
static  float3 _webgl_85d2dc26c2bd8386 = {0, 0, 0};
static  float3 _webgl_1fbc414219312258 = {0, 0, 0};
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

void gl_main()
{
(out_webgl_9b98566002e557b5 = float4(0.0, 0.0, 0.0, 0.0));
int _webgl_3c8522eb5c8751d0 = {0};
bool _webgl_a18f8e31e1b315c7 = {false};
float _webgl_b9874bf6084e21f3 = {0.0};
float3 _webgl_c53ab70787abce68 = {0.0, 0.0, 0.0};
float4 _webgl_eeab15c3195c8ba4 = {0.0, 0.0, 0.0, 0.0};
float3 _webgl_c191600adda48eee = {0.0, 0.0, 0.0};
(_webgl_c191600adda48eee = _webgl_85d2dc26c2bd8386);
float3 _webgl_cfb863ec5a9ad847 = {0.0, 0.0, 0.0};
(_webgl_cfb863ec5a9ad847 = normalize((_webgl_85d2dc26c2bd8386 - _webgl_1fbc414219312258)));
(_webgl_eeab15c3195c8ba4 = float4(0.0, 0.0, 0.0, 0.0));
float3x3 _webgl_5ccca921d933644d = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
(_webgl_5ccca921d933644d[0] = _webgl_285673c8bc48ada1[0].xyz);
(_webgl_5ccca921d933644d[1] = _webgl_285673c8bc48ada1[1].xyz);
(_webgl_5ccca921d933644d[2] = _webgl_285673c8bc48ada1[2].xyz);
float3 _webgl_aa0223651b0615c = {0.0, 0.0, 0.0};
(_webgl_aa0223651b0615c = (-_webgl_cc88c95a9917294));
float3 _webgl_73488ceaa0ef8fe3 = {0.0, 0.0, 0.0};
(_webgl_73488ceaa0ef8fe3 = mul(transpose(_webgl_5ccca921d933644d), (_webgl_cfb863ec5a9ad847 - (2.0 * (dot(_webgl_aa0223651b0615c, _webgl_cfb863ec5a9ad847) * _webgl_aa0223651b0615c)))));
(_webgl_c53ab70787abce68 = _webgl_73488ceaa0ef8fe3);
float3 _webgl_1e289a63fe1d1a65 = {0.0, 0.0, 0.0};
(_webgl_1e289a63fe1d1a65 = (_webgl_73488ceaa0ef8fe3 * float3(-1.0, 1.0, 1.0)));
float3 _webgl_26a09f4ea02251c4 = {0.0, 0.0, 0.0};
if ((_webgl_1e289a63fe1d1a65.y >= 0.0))
{
float _webgl_a6dbd098b3ec401a = {0.0};
float _webgl_91c6fbb789786f97 = {0.0};
(_webgl_91c6fbb789786f97 = clamp(_webgl_1e289a63fe1d1a65.y, 0.0, 1.0));
(_webgl_a6dbd098b3ec401a = (lerp(2.0, 0.89999998, _webgl_91c6fbb789786f97) * 0.0046875002));
float3 _webgl_9e247bb82e5c20e0 = {0.0, 0.0, 0.0};
(_webgl_9e247bb82e5c20e0 = (_webgl_1e289a63fe1d1a65 + (((float3(1.0, 0.0, 1.0) * (-_webgl_e841568a4415b2f5)) * _webgl_a6dbd098b3ec401a) * _webgl_91c6fbb789786f97)));
float2 _webgl_3489059248406aa1 = {0.0, 0.0};
(_webgl_3489059248406aa1 = (_webgl_9e247bb82e5c20e0.xz / dot(float3(1.0, 1.0, 1.0), abs(_webgl_9e247bb82e5c20e0))));
float2 _webgl_9086f39b9ec20200 = {0.0, 0.0};
(_webgl_9086f39b9ec20200.x = (_webgl_3489059248406aa1.x - _webgl_3489059248406aa1.y));
(_webgl_9086f39b9ec20200.y = (_webgl_3489059248406aa1.x + _webgl_3489059248406aa1.y));
float3 _webgl_f26380f436f82532 = {0.0, 0.0, 0.0};
(_webgl_f26380f436f82532 = (_webgl_1e289a63fe1d1a65 + (((float3(1.0, 0.0, 1.0) * (1.0 - _webgl_e841568a4415b2f5)) * _webgl_a6dbd098b3ec401a) * _webgl_91c6fbb789786f97)));
float2 _webgl_f06ab770d8ec1876 = {0.0, 0.0};
(_webgl_f06ab770d8ec1876 = (_webgl_f26380f436f82532.xz / dot(float3(1.0, 1.0, 1.0), abs(_webgl_f26380f436f82532))));
float2 _webgl_cd6eaaff7ab905f1 = {0.0, 0.0};
(_webgl_cd6eaaff7ab905f1.x = (_webgl_f06ab770d8ec1876.x - _webgl_f06ab770d8ec1876.y));
(_webgl_cd6eaaff7ab905f1.y = (_webgl_f06ab770d8ec1876.x + _webgl_f06ab770d8ec1876.y));
float4 _webgl_cf179e362a646f90 = {0.0, 0.0, 0.0, 0.0};
(_webgl_cf179e362a646f90 = gl_texture2D(_webgl_a281e172b023aebc, ((_webgl_9086f39b9ec20200 * 0.5) + float2(0.5, 0.5))));
float3 _webgl_6472b8a26530e78b = {0.0, 0.0, 0.0};
(_webgl_6472b8a26530e78b = ((8.0 * _webgl_cf179e362a646f90.w) * _webgl_cf179e362a646f90.xyz));
float4 _webgl_ba8e8168781d9774 = {0.0, 0.0, 0.0, 0.0};
(_webgl_ba8e8168781d9774 = gl_texture2D(_webgl_f1f34a74fabade41, ((_webgl_cd6eaaff7ab905f1 * 0.5) + float2(0.5, 0.5))));
float3 _webgl_bd1cf0f064bc6fed = {0.0, 0.0, 0.0};
(_webgl_bd1cf0f064bc6fed = ((8.0 * _webgl_ba8e8168781d9774.w) * _webgl_ba8e8168781d9774.xyz));
(_webgl_26a09f4ea02251c4 = (lerp((_webgl_6472b8a26530e78b * _webgl_6472b8a26530e78b), (_webgl_bd1cf0f064bc6fed * _webgl_bd1cf0f064bc6fed), _webgl_e841568a4415b2f5) / 3.0));
}
else
{
float4 _webgl_dad807c3e946fcc4 = {0.0, 0.0, 0.0, 0.0};
(_webgl_dad807c3e946fcc4 = gl_textureCube(_webgl_14b00107d62a0ec7, (_webgl_1e289a63fe1d1a65 * float3(-1.0, 1.0, 1.0))));
float3 _webgl_4a69825d2061f2e4 = {0.0, 0.0, 0.0};
(_webgl_4a69825d2061f2e4 = ((8.0 * _webgl_dad807c3e946fcc4.w) * _webgl_dad807c3e946fcc4.xyz));
(_webgl_26a09f4ea02251c4 = (_webgl_4a69825d2061f2e4 * _webgl_4a69825d2061f2e4));
}
(_webgl_eeab15c3195c8ba4.xyz = _webgl_26a09f4ea02251c4);
float _webgl_85f7bf17706eab85 = {0.0};
(_webgl_85f7bf17706eab85 = (1.0 - clamp(dot(_webgl_cfb863ec5a9ad847, (-_webgl_cc88c95a9917294)), 0.0, 1.0)));
float _webgl_5cfd34df9dcb15f5 = {0.0};
(_webgl_5cfd34df9dcb15f5 = (_webgl_85f7bf17706eab85 * _webgl_85f7bf17706eab85));
(_webgl_eeab15c3195c8ba4.w = clamp((0.31999999 + ((0.68000001 * _webgl_85f7bf17706eab85) * (_webgl_5cfd34df9dcb15f5 * _webgl_5cfd34df9dcb15f5))), 0.0, 1.0));
float3 _webgl_cfe4f407d6834756 = {0.0, 0.0, 0.0};
(_webgl_cfe4f407d6834756 = abs(_webgl_cc88c95a9917294));
float2 _webgl_8eabcbad90e5f7cf = {0.0, 0.0};
if ((_webgl_cfe4f407d6834756.x > _webgl_cfe4f407d6834756.z))
{
(_webgl_8eabcbad90e5f7cf = (_webgl_a0b62b4d8ddcd62b * float2(0.5, 0.5)));
}
else
{
(_webgl_8eabcbad90e5f7cf = ((_webgl_a0b62b4d8ddcd62b * float2(1.0, 0.5)) + float2(0.0, 0.5)));
}
float _webgl_45bc8ea7e5f7a77c = {0.0};
(_webgl_45bc8ea7e5f7a77c = clamp((gl_texture2D(_webgl_49907f08947ea6a2, _webgl_8eabcbad90e5f7cf).y * 4.0), 0.0, 1.0));
float4 _webgl_d7a381f02878b408 = {0.0, 0.0, 0.0, 0.0};
(_webgl_d7a381f02878b408.xyz = float3(0.0, 0.0, 0.0));
(_webgl_d7a381f02878b408.w = _webgl_45bc8ea7e5f7a77c);
(_webgl_eeab15c3195c8ba4 = lerp(_webgl_d7a381f02878b408, _webgl_eeab15c3195c8ba4, clamp((_webgl_eeab15c3195c8ba4.w + (1.0 - _webgl_45bc8ea7e5f7a77c)), 0.0, 1.0)));
float2 _webgl_1e0a569fa8d323c5 = {0.0, 0.0};
float3 _webgl_6b1576cc49ca380b = {0.0, 0.0, 0.0};
(_webgl_6b1576cc49ca380b = (1.0 / _webgl_cfb863ec5a9ad847));
float3 _webgl_82fa7c9f93cc7839 = {0.0, 0.0, 0.0};
(_webgl_82fa7c9f93cc7839 = (_webgl_6b1576cc49ca380b * (float3(-0.44999999, -0.44999999, -0.44999999) - _webgl_85d2dc26c2bd8386)));
float3 _webgl_6b8507d7c52a30c5 = {0.0, 0.0, 0.0};
(_webgl_6b8507d7c52a30c5 = (_webgl_6b1576cc49ca380b * (float3(0.44999999, 0.44999999, 0.44999999) - _webgl_85d2dc26c2bd8386)));
float3 _webgl_bc517a070a88ef4a = {0.0, 0.0, 0.0};
(_webgl_bc517a070a88ef4a = min(_webgl_6b8507d7c52a30c5, _webgl_82fa7c9f93cc7839));
float3 _webgl_a5cbea098f008107 = {0.0, 0.0, 0.0};
(_webgl_a5cbea098f008107 = max(_webgl_6b8507d7c52a30c5, _webgl_82fa7c9f93cc7839));
float2 _webgl_e422f03590b051e5 = {0.0, 0.0};
(_webgl_e422f03590b051e5 = max(_webgl_bc517a070a88ef4a.xx, _webgl_bc517a070a88ef4a.yz));
float _webgl_a2ea1ce929cac431 = {0.0};
(_webgl_a2ea1ce929cac431 = max(_webgl_e422f03590b051e5.x, _webgl_e422f03590b051e5.y));
float2 _webgl_d3a0349fad6621fb = {0.0, 0.0};
(_webgl_d3a0349fad6621fb = min(_webgl_a5cbea098f008107.xx, _webgl_a5cbea098f008107.yz));
float _webgl_48742813565ac55d = {0.0};
(_webgl_48742813565ac55d = min(_webgl_d3a0349fad6621fb.x, _webgl_d3a0349fad6621fb.y));
if ((_webgl_a2ea1ce929cac431 > _webgl_48742813565ac55d))
{
(_webgl_1e0a569fa8d323c5 = float2(-1.0, -1.0));
}
else
{
float2 _webgl_f05a73b03fcb4961 = {0.0, 0.0};
(_webgl_f05a73b03fcb4961.x = _webgl_a2ea1ce929cac431);
(_webgl_f05a73b03fcb4961.y = _webgl_48742813565ac55d);
(_webgl_1e0a569fa8d323c5 = _webgl_f05a73b03fcb4961);
}
(_webgl_b9874bf6084e21f3 = _webgl_1e0a569fa8d323c5.x);
(_webgl_a18f8e31e1b315c7 = (_webgl_1e0a569fa8d323c5.x >= 0.0));
(_webgl_c191600adda48eee = (_webgl_85d2dc26c2bd8386 + (_webgl_1e0a569fa8d323c5.x * _webgl_cfb863ec5a9ad847)));
float3 _webgl_6da46f976b4b3195 = {0.0, 0.0, 0.0};
(_webgl_6da46f976b4b3195 = (_webgl_c191600adda48eee / float3(0.89999998, 0.89999998, 0.89999998)));
bool _webgl_6cd3ea4a4d7f2e24 = {false};
(_webgl_6cd3ea4a4d7f2e24 = true);
float3 _webgl_17eaf291e44ff974 = {0.0, 0.0, 0.0};
float3 _webgl_265b07338d1f26ef = {0.0, 0.0, 0.0};
(_webgl_265b07338d1f26ef = abs(_webgl_6da46f976b4b3195));
if (((_webgl_265b07338d1f26ef.x > _webgl_265b07338d1f26ef.y) && (_webgl_265b07338d1f26ef.x > _webgl_265b07338d1f26ef.z)))
{
float3 _webgl_6845b595a6db2b36 = {0.0, 0.0, 0.0};
if ((_webgl_6da46f976b4b3195.x > 0.0))
{
(_webgl_6845b595a6db2b36 = float3(1.0, 0.0, 0.0));
}
else
{
(_webgl_6845b595a6db2b36 = float3(-1.0, 0.0, 0.0));
}
(_webgl_17eaf291e44ff974 = _webgl_6845b595a6db2b36);
(_webgl_6cd3ea4a4d7f2e24 = false);
}
else
{
if (((_webgl_265b07338d1f26ef.y > _webgl_265b07338d1f26ef.x) && (_webgl_265b07338d1f26ef.y > _webgl_265b07338d1f26ef.z)))
{
float3 _webgl_40d3fc5bec147c69 = {0.0, 0.0, 0.0};
if ((_webgl_6da46f976b4b3195.y > 0.0))
{
(_webgl_40d3fc5bec147c69 = float3(0.0, 1.0, 0.0));
}
else
{
(_webgl_40d3fc5bec147c69 = float3(0.0, -1.0, 0.0));
}
(_webgl_17eaf291e44ff974 = _webgl_40d3fc5bec147c69);
(_webgl_6cd3ea4a4d7f2e24 = false);
}
}
if (_webgl_6cd3ea4a4d7f2e24)
{
float3 _webgl_dbaa033991f73c9d = {0.0, 0.0, 0.0};
if ((_webgl_6da46f976b4b3195.z > 0.0))
{
(_webgl_dbaa033991f73c9d = float3(0.0, 0.0, 1.0));
}
else
{
(_webgl_dbaa033991f73c9d = float3(0.0, 0.0, -1.0));
}
(_webgl_17eaf291e44ff974 = _webgl_dbaa033991f73c9d);
(_webgl_6cd3ea4a4d7f2e24 = false);
}
float3x3 _webgl_8a1c983d2a5521d3 = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
(_webgl_8a1c983d2a5521d3[0] = _webgl_285673c8bc48ada1[0].xyz);
(_webgl_8a1c983d2a5521d3[1] = _webgl_285673c8bc48ada1[1].xyz);
(_webgl_8a1c983d2a5521d3[2] = _webgl_285673c8bc48ada1[2].xyz);
float3 _webgl_4e788e582caee34f = {0.0, 0.0, 0.0};
(_webgl_4e788e582caee34f = (-_webgl_17eaf291e44ff974));
(_webgl_c53ab70787abce68 = mul(transpose(_webgl_8a1c983d2a5521d3), (_webgl_cfb863ec5a9ad847 - (2.0 * (dot(_webgl_4e788e582caee34f, _webgl_cfb863ec5a9ad847) * _webgl_4e788e582caee34f)))));
float3 _webgl_1e9e5356010035f = {0.0, 0.0, 0.0};
(_webgl_1e9e5356010035f = (_webgl_c53ab70787abce68 * float3(-1.0, 1.0, 1.0)));
float3 _webgl_3199c3800abc863b = {0.0, 0.0, 0.0};
if ((_webgl_1e9e5356010035f.y >= 0.0))
{
float _webgl_8ff1ad9307010320 = {0.0};
float _webgl_af838643f97a28e8 = {0.0};
(_webgl_af838643f97a28e8 = clamp(_webgl_1e9e5356010035f.y, 0.0, 1.0));
(_webgl_8ff1ad9307010320 = (lerp(2.0, 0.89999998, _webgl_af838643f97a28e8) * 0.0046875002));
float3 _webgl_b3646d04812e7a4a = {0.0, 0.0, 0.0};
(_webgl_b3646d04812e7a4a = (_webgl_1e9e5356010035f + (((float3(1.0, 0.0, 1.0) * (-_webgl_e841568a4415b2f5)) * _webgl_8ff1ad9307010320) * _webgl_af838643f97a28e8)));
float2 _webgl_7edc71e79ab928c1 = {0.0, 0.0};
(_webgl_7edc71e79ab928c1 = (_webgl_b3646d04812e7a4a.xz / dot(float3(1.0, 1.0, 1.0), abs(_webgl_b3646d04812e7a4a))));
float2 _webgl_8badbc4aa9205681 = {0.0, 0.0};
(_webgl_8badbc4aa9205681.x = (_webgl_7edc71e79ab928c1.x - _webgl_7edc71e79ab928c1.y));
(_webgl_8badbc4aa9205681.y = (_webgl_7edc71e79ab928c1.x + _webgl_7edc71e79ab928c1.y));
float3 _webgl_e760ed8adca1c9c3 = {0.0, 0.0, 0.0};
(_webgl_e760ed8adca1c9c3 = (_webgl_1e9e5356010035f + (((float3(1.0, 0.0, 1.0) * (1.0 - _webgl_e841568a4415b2f5)) * _webgl_8ff1ad9307010320) * _webgl_af838643f97a28e8)));
float2 _webgl_80f9c2f994f34f1e = {0.0, 0.0};
(_webgl_80f9c2f994f34f1e = (_webgl_e760ed8adca1c9c3.xz / dot(float3(1.0, 1.0, 1.0), abs(_webgl_e760ed8adca1c9c3))));
float2 _webgl_6a9bcb091df1cdf6 = {0.0, 0.0};
(_webgl_6a9bcb091df1cdf6.x = (_webgl_80f9c2f994f34f1e.x - _webgl_80f9c2f994f34f1e.y));
(_webgl_6a9bcb091df1cdf6.y = (_webgl_80f9c2f994f34f1e.x + _webgl_80f9c2f994f34f1e.y));
float4 _webgl_a52374383578cc70 = {0.0, 0.0, 0.0, 0.0};
(_webgl_a52374383578cc70 = gl_texture2D(_webgl_a281e172b023aebc, ((_webgl_8badbc4aa9205681 * 0.5) + float2(0.5, 0.5))));
float3 _webgl_e47f7fad6c31aebc = {0.0, 0.0, 0.0};
(_webgl_e47f7fad6c31aebc = ((8.0 * _webgl_a52374383578cc70.w) * _webgl_a52374383578cc70.xyz));
float4 _webgl_56077667bfd6d861 = {0.0, 0.0, 0.0, 0.0};
(_webgl_56077667bfd6d861 = gl_texture2D(_webgl_f1f34a74fabade41, ((_webgl_6a9bcb091df1cdf6 * 0.5) + float2(0.5, 0.5))));
float3 _webgl_b190a86bc7f938d2 = {0.0, 0.0, 0.0};
(_webgl_b190a86bc7f938d2 = ((8.0 * _webgl_56077667bfd6d861.w) * _webgl_56077667bfd6d861.xyz));
(_webgl_3199c3800abc863b = (lerp((_webgl_e47f7fad6c31aebc * _webgl_e47f7fad6c31aebc), (_webgl_b190a86bc7f938d2 * _webgl_b190a86bc7f938d2), _webgl_e841568a4415b2f5) / 3.0));
}
else
{
float4 _webgl_95e254f0ea5b5564 = {0.0, 0.0, 0.0, 0.0};
(_webgl_95e254f0ea5b5564 = gl_textureCube(_webgl_14b00107d62a0ec7, (_webgl_1e9e5356010035f * float3(-1.0, 1.0, 1.0))));
float3 _webgl_8e449eeb6739befe = {0.0, 0.0, 0.0};
(_webgl_8e449eeb6739befe = ((8.0 * _webgl_95e254f0ea5b5564.w) * _webgl_95e254f0ea5b5564.xyz));
(_webgl_3199c3800abc863b = (_webgl_8e449eeb6739befe * _webgl_8e449eeb6739befe));
}
(_webgl_eeab15c3195c8ba4.xyz = lerp(_webgl_3199c3800abc863b, _webgl_eeab15c3195c8ba4.xyz, _webgl_eeab15c3195c8ba4.w));
float _webgl_eb9e29ad556d5876 = {0.0};
(_webgl_eb9e29ad556d5876 = (1.0 - clamp(dot(_webgl_cfb863ec5a9ad847, (-_webgl_17eaf291e44ff974)), 0.0, 1.0)));
float _webgl_6430cdf0dbc8e939 = {0.0};
(_webgl_6430cdf0dbc8e939 = (_webgl_eb9e29ad556d5876 * _webgl_eb9e29ad556d5876));
(_webgl_eeab15c3195c8ba4.w = clamp((_webgl_eeab15c3195c8ba4.w + (0.31999999 + ((0.68000001 * _webgl_eb9e29ad556d5876) * (_webgl_6430cdf0dbc8e939 * _webgl_6430cdf0dbc8e939)))), 0.0, 1.0));
(_webgl_c191600adda48eee = (_webgl_85d2dc26c2bd8386 - (_webgl_cc88c95a9917294 * 0.001)));
(_webgl_3c8522eb5c8751d0 = 0);
(_webgl_b9874bf6084e21f3 = 99999.0);
float4 _webgl_909dd7b8eca80202 = {0.0, 0.0, 0.0, 0.0};
(_webgl_909dd7b8eca80202.xyz = float3(0.0, 1.0, 0.0));
(_webgl_909dd7b8eca80202.w = (0.5 - (ceil(((_webgl_c191600adda48eee.y + 0.5) * 8.5)) / 8.5)));
float _webgl_9090da22dad28bf7 = {0.0};
(_webgl_9090da22dad28bf7 = (-((_webgl_909dd7b8eca80202.w + _webgl_c191600adda48eee.y) / _webgl_cfb863ec5a9ad847.y)));
if ((_webgl_9090da22dad28bf7 < 99999.0))
{
(_webgl_b9874bf6084e21f3 = _webgl_9090da22dad28bf7);
(_webgl_3c8522eb5c8751d0 = 2);
}
if ((_webgl_cfb863ec5a9ad847.z < 0.0))
{
float4 _webgl_14255a09eade23c1 = {0.0, 0.0, 0.0, 0.0};
(_webgl_14255a09eade23c1.xyz = float3(0.0, 0.0, 1.0));
(_webgl_14255a09eade23c1.w = (0.5 - (floor(((_webgl_c191600adda48eee.z + 0.5) * 4.0)) / 4.0)));
float _webgl_4a15523e4032dda7 = {0.0};
(_webgl_4a15523e4032dda7 = (-((_webgl_14255a09eade23c1.w + _webgl_c191600adda48eee.z) / _webgl_cfb863ec5a9ad847.z)));
if ((_webgl_4a15523e4032dda7 < _webgl_b9874bf6084e21f3))
{
(_webgl_b9874bf6084e21f3 = _webgl_4a15523e4032dda7);
(_webgl_3c8522eb5c8751d0 = 3);
}
}
else
{
if ((_webgl_cfb863ec5a9ad847.z > 0.0))
{
float4 _webgl_1d1ddb76fbcf772a = {0.0, 0.0, 0.0, 0.0};
(_webgl_1d1ddb76fbcf772a.xyz = float3(0.0, 0.0, 1.0));
(_webgl_1d1ddb76fbcf772a.w = (0.5 - (ceil(((_webgl_c191600adda48eee.z + 0.5) * 4.0)) / 4.0)));
float _webgl_e2e2a31b2325c72 = {0.0};
(_webgl_e2e2a31b2325c72 = (-((_webgl_1d1ddb76fbcf772a.w + _webgl_c191600adda48eee.z) / _webgl_cfb863ec5a9ad847.z)));
if ((_webgl_e2e2a31b2325c72 < _webgl_b9874bf6084e21f3))
{
(_webgl_b9874bf6084e21f3 = _webgl_e2e2a31b2325c72);
(_webgl_3c8522eb5c8751d0 = 3);
}
}
}
if ((_webgl_cfb863ec5a9ad847.x < 0.0))
{
float4 _webgl_1a6c2875eb51b665 = {0.0, 0.0, 0.0, 0.0};
(_webgl_1a6c2875eb51b665.xyz = float3(1.0, 0.0, 0.0));
(_webgl_1a6c2875eb51b665.w = (0.5 - (floor(((_webgl_c191600adda48eee.x + 0.5) * 4.0)) / 4.0)));
float _webgl_efb9abf9cf1319d2 = {0.0};
(_webgl_efb9abf9cf1319d2 = (-((_webgl_1a6c2875eb51b665.w + _webgl_c191600adda48eee.x) / _webgl_cfb863ec5a9ad847.x)));
if ((_webgl_efb9abf9cf1319d2 < _webgl_b9874bf6084e21f3))
{
(_webgl_b9874bf6084e21f3 = _webgl_efb9abf9cf1319d2);
(_webgl_3c8522eb5c8751d0 = 4);
}
}
else
{
if ((_webgl_cfb863ec5a9ad847.x > 0.0))
{
float4 _webgl_468e885b7f29418e = {0.0, 0.0, 0.0, 0.0};
(_webgl_468e885b7f29418e.xyz = float3(1.0, 0.0, 0.0));
(_webgl_468e885b7f29418e.w = (0.5 - (ceil(((_webgl_c191600adda48eee.x + 0.5) * 4.0)) / 4.0)));
float _webgl_45dfddb747caee = {0.0};
(_webgl_45dfddb747caee = (-((_webgl_468e885b7f29418e.w + _webgl_c191600adda48eee.x) / _webgl_cfb863ec5a9ad847.x)));
if ((_webgl_45dfddb747caee < _webgl_b9874bf6084e21f3))
{
(_webgl_b9874bf6084e21f3 = _webgl_45dfddb747caee);
(_webgl_3c8522eb5c8751d0 = 4);
}
}
}
(_webgl_c191600adda48eee = (_webgl_c191600adda48eee + (_webgl_b9874bf6084e21f3 * _webgl_cfb863ec5a9ad847)));
float2 _webgl_b59ec816fb13ac1d = {0.0, 0.0};
if ((_webgl_3c8522eb5c8751d0 < 3))
{
(_webgl_b59ec816fb13ac1d = ((_webgl_c191600adda48eee.xz + float2(0.5, 0.5)) * float2(4.0, 4.0)));
}
else
{
float2 _webgl_609625e3f64a0f19 = {0.0, 0.0};
if ((_webgl_3c8522eb5c8751d0 < 4))
{
(_webgl_609625e3f64a0f19 = ((_webgl_c191600adda48eee.xy + float2(0.5, 0.5)) * float2(4.0, 8.5)));
}
else
{
(_webgl_609625e3f64a0f19 = ((_webgl_c191600adda48eee.zy + float2(0.5, 0.5)) * float2(4.0, 8.5)));
}
(_webgl_b59ec816fb13ac1d = _webgl_609625e3f64a0f19);
}
float2 _webgl_ea6b6b1beb91da53 = {0.0, 0.0};
(_webgl_ea6b6b1beb91da53 = (1.0 - abs(((frac(_webgl_b59ec816fb13ac1d) * 2.0) - 1.0))));
float _webgl_e9159e945655b007 = {0.0};
(_webgl_e9159e945655b007 = pow((_webgl_ea6b6b1beb91da53.x * _webgl_ea6b6b1beb91da53.y), 0.25));
bool _webgl_918bfbe86971a17d = {false};
(_webgl_918bfbe86971a17d = (((!_webgl_a18f8e31e1b315c7) && (_webgl_3c8522eb5c8751d0 == 2)) && (_webgl_c191600adda48eee.y < 0.5)));
if (_webgl_a18f8e31e1b315c7)
{
(_webgl_c191600adda48eee = (_webgl_c191600adda48eee + float3(0.5, 0.5, 0.5)));
float3 _webgl_60c1f9053e4803c5 = {0.0, 0.0, 0.0};
(_webgl_60c1f9053e4803c5.x = _webgl_285673c8bc48ada1[3].x);
(_webgl_60c1f9053e4803c5.y = _webgl_285673c8bc48ada1[3].y);
(_webgl_60c1f9053e4803c5.z = _webgl_285673c8bc48ada1[3].z);
float3 _webgl_cfb734ab535175fc = {0.0, 0.0, 0.0};
(_webgl_cfb734ab535175fc = (floor((((_webgl_c191600adda48eee * float3(4.0, 8.5, 4.0)) + 0.050000001) + _webgl_60c1f9053e4803c5)) * 1234.0));
float3 _webgl_2b55effb486113f6 = {0.0, 0.0, 0.0};
(_webgl_2b55effb486113f6 = frac((_webgl_cfb734ab535175fc * 0.1031)));
(_webgl_cfb734ab535175fc = (_webgl_2b55effb486113f6 + dot(_webgl_2b55effb486113f6, (_webgl_2b55effb486113f6.yzx + 19.190001))));
float _webgl_8bc016e8908b6083 = {0.0};
float s488 = frac(((_webgl_cfb734ab535175fc.x + _webgl_cfb734ab535175fc.y) * _webgl_cfb734ab535175fc.z));
(_webgl_8bc016e8908b6083 = (((((((s488 * s488) * s488) * s488) * s488) * s488) * s488) * s488));
float4 _webgl_e953f7cb16b17110 = {0.0, 0.0, 0.0, 0.0};
(_webgl_e953f7cb16b17110 = gl_texture2D(_webgl_e98cbad5b53e7067, (_webgl_c191600adda48eee.xz * float2(4.0, 4.0))));
float _webgl_8190c59bfbd2d13 = {0.0};
if ((_webgl_8bc016e8908b6083 < 0.2))
{
(_webgl_8190c59bfbd2d13 = 0.0);
}
else
{
(_webgl_8190c59bfbd2d13 = 1.0);
}
(_webgl_eeab15c3195c8ba4.xyz = lerp((((float3(0.0634, 0.1113, 0.2264) * _webgl_e9159e945655b007) + (((_webgl_8bc016e8908b6083 * float3(2.0920999, 1.0082, 0.040199999)) * (_webgl_e9159e945655b007 * _webgl_e9159e945655b007)) * (_webgl_e9159e945655b007 * _webgl_e9159e945655b007))) + ((_webgl_e953f7cb16b17110.xyz * _webgl_8190c59bfbd2d13) * 8.0)), _webgl_eeab15c3195c8ba4.xyz, _webgl_eeab15c3195c8ba4.w));
(_webgl_eeab15c3195c8ba4.w = 1.0);
}
if (_webgl_918bfbe86971a17d)
{
float _webgl_953b31d99937628e = {0.0};
(_webgl_953b31d99937628e = 1.0);
float4 _webgl_966a3add4cf69c50 = {0.0, 0.0, 0.0, 0.0};
(_webgl_966a3add4cf69c50.xyz = float3(0.0, 0.0, 0.0));
(_webgl_966a3add4cf69c50.w = _webgl_953b31d99937628e);
(_webgl_eeab15c3195c8ba4 = lerp(_webgl_966a3add4cf69c50, _webgl_eeab15c3195c8ba4, clamp((_webgl_eeab15c3195c8ba4.w + (1.0 - _webgl_953b31d99937628e)), 0.0, 1.0)));
}
float2 _webgl_51fffd7cc690ecf8 = {0.0, 0.0};
float3 _webgl_f1412ccb12cb1ff8 = {0.0, 0.0, 0.0};
(_webgl_f1412ccb12cb1ff8 = (1.0 / _webgl_cfb863ec5a9ad847));
float3 _webgl_1e7d9c726c1fee81 = {0.0, 0.0, 0.0};
(_webgl_1e7d9c726c1fee81 = (_webgl_f1412ccb12cb1ff8 * (float3(-0.50099999, -0.50099999, -0.50099999) - _webgl_c191600adda48eee)));
float3 _webgl_36ae7d52fd3a7b32 = {0.0, 0.0, 0.0};
(_webgl_36ae7d52fd3a7b32 = (_webgl_f1412ccb12cb1ff8 * (float3(0.50099999, 0.50099999, 0.50099999) - _webgl_c191600adda48eee)));
float3 _webgl_f9e6b653e88bbbd4 = {0.0, 0.0, 0.0};
(_webgl_f9e6b653e88bbbd4 = min(_webgl_36ae7d52fd3a7b32, _webgl_1e7d9c726c1fee81));
float3 _webgl_3e1e07a5d3186e64 = {0.0, 0.0, 0.0};
(_webgl_3e1e07a5d3186e64 = max(_webgl_36ae7d52fd3a7b32, _webgl_1e7d9c726c1fee81));
float2 _webgl_ae66eb76b3cbc304 = {0.0, 0.0};
(_webgl_ae66eb76b3cbc304 = max(_webgl_f9e6b653e88bbbd4.xx, _webgl_f9e6b653e88bbbd4.yz));
float _webgl_f86278d0c757c147 = {0.0};
(_webgl_f86278d0c757c147 = max(_webgl_ae66eb76b3cbc304.x, _webgl_ae66eb76b3cbc304.y));
float2 _webgl_630dd71949843d37 = {0.0, 0.0};
(_webgl_630dd71949843d37 = min(_webgl_3e1e07a5d3186e64.xx, _webgl_3e1e07a5d3186e64.yz));
float _webgl_2384d5d4062810f0 = {0.0};
(_webgl_2384d5d4062810f0 = min(_webgl_630dd71949843d37.x, _webgl_630dd71949843d37.y));
if ((_webgl_f86278d0c757c147 > _webgl_2384d5d4062810f0))
{
(_webgl_51fffd7cc690ecf8 = float2(-1.0, -1.0));
}
else
{
float2 _webgl_92bf6f5a2eb60e58 = {0.0, 0.0};
(_webgl_92bf6f5a2eb60e58.x = _webgl_f86278d0c757c147);
(_webgl_92bf6f5a2eb60e58.y = _webgl_2384d5d4062810f0);
(_webgl_51fffd7cc690ecf8 = _webgl_92bf6f5a2eb60e58);
}
(_webgl_c191600adda48eee = (_webgl_c191600adda48eee + (_webgl_51fffd7cc690ecf8.y * _webgl_cfb863ec5a9ad847)));
bool _webgl_bc1ead19029cb4c7 = {false};
(_webgl_bc1ead19029cb4c7 = true);
float3 _webgl_6f17561e39060361 = {0.0, 0.0, 0.0};
float3 _webgl_7bc079d6dab55f4d = {0.0, 0.0, 0.0};
(_webgl_7bc079d6dab55f4d = abs(_webgl_c191600adda48eee));
if (((_webgl_7bc079d6dab55f4d.x > _webgl_7bc079d6dab55f4d.y) && (_webgl_7bc079d6dab55f4d.x > _webgl_7bc079d6dab55f4d.z)))
{
float3 _webgl_54b8c1a72f76313a = {0.0, 0.0, 0.0};
if ((_webgl_c191600adda48eee.x > 0.0))
{
(_webgl_54b8c1a72f76313a = float3(1.0, 0.0, 0.0));
}
else
{
(_webgl_54b8c1a72f76313a = float3(-1.0, 0.0, 0.0));
}
(_webgl_6f17561e39060361 = _webgl_54b8c1a72f76313a);
(_webgl_bc1ead19029cb4c7 = false);
}
else
{
if (((_webgl_7bc079d6dab55f4d.y > _webgl_7bc079d6dab55f4d.x) && (_webgl_7bc079d6dab55f4d.y > _webgl_7bc079d6dab55f4d.z)))
{
float3 _webgl_4065a8c42a43931 = {0.0, 0.0, 0.0};
if ((_webgl_c191600adda48eee.y > 0.0))
{
(_webgl_4065a8c42a43931 = float3(0.0, 1.0, 0.0));
}
else
{
(_webgl_4065a8c42a43931 = float3(0.0, -1.0, 0.0));
}
(_webgl_6f17561e39060361 = _webgl_4065a8c42a43931);
(_webgl_bc1ead19029cb4c7 = false);
}
}
if (_webgl_bc1ead19029cb4c7)
{
float3 _webgl_adc11affed2e94df = {0.0, 0.0, 0.0};
if ((_webgl_c191600adda48eee.z > 0.0))
{
(_webgl_adc11affed2e94df = float3(0.0, 0.0, 1.0));
}
else
{
(_webgl_adc11affed2e94df = float3(0.0, 0.0, -1.0));
}
(_webgl_6f17561e39060361 = _webgl_adc11affed2e94df);
(_webgl_bc1ead19029cb4c7 = false);
}
float3x3 _webgl_c611b0a1d71be195 = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
(_webgl_c611b0a1d71be195[0] = _webgl_285673c8bc48ada1[0].xyz);
(_webgl_c611b0a1d71be195[1] = _webgl_285673c8bc48ada1[1].xyz);
(_webgl_c611b0a1d71be195[2] = _webgl_285673c8bc48ada1[2].xyz);
float3 _webgl_43a2d60580b1a20a = {0.0, 0.0, 0.0};
(_webgl_43a2d60580b1a20a = (-_webgl_6f17561e39060361));
(_webgl_c53ab70787abce68 = mul(transpose(_webgl_c611b0a1d71be195), (_webgl_cfb863ec5a9ad847 - (2.0 * (dot(_webgl_43a2d60580b1a20a, _webgl_cfb863ec5a9ad847) * _webgl_43a2d60580b1a20a)))));
float3 _webgl_a4418a213ad94e02 = {0.0, 0.0, 0.0};
(_webgl_a4418a213ad94e02 = (_webgl_c53ab70787abce68 * float3(-1.0, 1.0, 1.0)));
float3 _webgl_5644c6d3581aeca4 = {0.0, 0.0, 0.0};
if ((_webgl_a4418a213ad94e02.y >= 0.0))
{
float _webgl_3f4e725939bee8f5 = {0.0};
float _webgl_2b9979604259c464 = {0.0};
(_webgl_2b9979604259c464 = clamp(_webgl_a4418a213ad94e02.y, 0.0, 1.0));
(_webgl_3f4e725939bee8f5 = (lerp(2.0, 0.89999998, _webgl_2b9979604259c464) * 0.0046875002));
float3 _webgl_71c7b691b4f90806 = {0.0, 0.0, 0.0};
(_webgl_71c7b691b4f90806 = (_webgl_a4418a213ad94e02 + (((float3(1.0, 0.0, 1.0) * (-_webgl_e841568a4415b2f5)) * _webgl_3f4e725939bee8f5) * _webgl_2b9979604259c464)));
float2 _webgl_56d46794fedc7ac6 = {0.0, 0.0};
(_webgl_56d46794fedc7ac6 = (_webgl_71c7b691b4f90806.xz / dot(float3(1.0, 1.0, 1.0), abs(_webgl_71c7b691b4f90806))));
float2 _webgl_d5a43f3b4c41c666 = {0.0, 0.0};
(_webgl_d5a43f3b4c41c666.x = (_webgl_56d46794fedc7ac6.x - _webgl_56d46794fedc7ac6.y));
(_webgl_d5a43f3b4c41c666.y = (_webgl_56d46794fedc7ac6.x + _webgl_56d46794fedc7ac6.y));
float3 _webgl_a4a9d4a6a25be2de = {0.0, 0.0, 0.0};
(_webgl_a4a9d4a6a25be2de = (_webgl_a4418a213ad94e02 + (((float3(1.0, 0.0, 1.0) * (1.0 - _webgl_e841568a4415b2f5)) * _webgl_3f4e725939bee8f5) * _webgl_2b9979604259c464)));
float2 _webgl_1f59c785a39df7d0 = {0.0, 0.0};
(_webgl_1f59c785a39df7d0 = (_webgl_a4a9d4a6a25be2de.xz / dot(float3(1.0, 1.0, 1.0), abs(_webgl_a4a9d4a6a25be2de))));
float2 _webgl_1adbf62207e2db58 = {0.0, 0.0};
(_webgl_1adbf62207e2db58.x = (_webgl_1f59c785a39df7d0.x - _webgl_1f59c785a39df7d0.y));
(_webgl_1adbf62207e2db58.y = (_webgl_1f59c785a39df7d0.x + _webgl_1f59c785a39df7d0.y));
float4 _webgl_af0e8ed8d1171a = {0.0, 0.0, 0.0, 0.0};
(_webgl_af0e8ed8d1171a = gl_texture2D(_webgl_a281e172b023aebc, ((_webgl_d5a43f3b4c41c666 * 0.5) + float2(0.5, 0.5))));
float3 _webgl_b79047151607747b = {0.0, 0.0, 0.0};
(_webgl_b79047151607747b = ((8.0 * _webgl_af0e8ed8d1171a.w) * _webgl_af0e8ed8d1171a.xyz));
float4 _webgl_7ea5077c98963e62 = {0.0, 0.0, 0.0, 0.0};
(_webgl_7ea5077c98963e62 = gl_texture2D(_webgl_f1f34a74fabade41, ((_webgl_1adbf62207e2db58 * 0.5) + float2(0.5, 0.5))));
float3 _webgl_75dd98552891af7e = {0.0, 0.0, 0.0};
(_webgl_75dd98552891af7e = ((8.0 * _webgl_7ea5077c98963e62.w) * _webgl_7ea5077c98963e62.xyz));
(_webgl_5644c6d3581aeca4 = (lerp((_webgl_b79047151607747b * _webgl_b79047151607747b), (_webgl_75dd98552891af7e * _webgl_75dd98552891af7e), _webgl_e841568a4415b2f5) / 3.0));
}
else
{
float4 _webgl_e90bfdfdefe5411 = {0.0, 0.0, 0.0, 0.0};
(_webgl_e90bfdfdefe5411 = gl_textureCube(_webgl_14b00107d62a0ec7, (_webgl_a4418a213ad94e02 * float3(-1.0, 1.0, 1.0))));
float3 _webgl_eeaea4b91d2d092a = {0.0, 0.0, 0.0};
(_webgl_eeaea4b91d2d092a = ((8.0 * _webgl_e90bfdfdefe5411.w) * _webgl_e90bfdfdefe5411.xyz));
(_webgl_5644c6d3581aeca4 = (_webgl_eeaea4b91d2d092a * _webgl_eeaea4b91d2d092a));
}
float _webgl_43fbb94013edb408 = {0.0};
(_webgl_43fbb94013edb408 = (1.0 - clamp(dot(_webgl_cfb863ec5a9ad847, _webgl_6f17561e39060361), 0.0, 1.0)));
float _webgl_605a14984a96b75a = {0.0};
(_webgl_605a14984a96b75a = (_webgl_43fbb94013edb408 * _webgl_43fbb94013edb408));
float4 _webgl_84c82dc95d376844 = {0.0, 0.0, 0.0, 0.0};
(_webgl_84c82dc95d376844.xyz = _webgl_5644c6d3581aeca4);
(_webgl_84c82dc95d376844.w = (0.31999999 + ((0.68000001 * _webgl_43fbb94013edb408) * (_webgl_605a14984a96b75a * _webgl_605a14984a96b75a))));
float4 _webgl_32c10756b794435e = {0.0, 0.0, 0.0, 0.0};
(_webgl_32c10756b794435e = lerp(_webgl_84c82dc95d376844, _webgl_eeab15c3195c8ba4, _webgl_eeab15c3195c8ba4.w));
(_webgl_eeab15c3195c8ba4.w = _webgl_32c10756b794435e.w);
float3 _webgl_d6e29e3dc865dd55 = {0.0, 0.0, 0.0};
(_webgl_d6e29e3dc865dd55 = (_webgl_5c81bf65ffac0762 - _webgl_35c9514d594e36f3));
(_webgl_eeab15c3195c8ba4.xyz = lerp(_webgl_3b3710b9db4788a7, _webgl_32c10756b794435e.xyz, clamp(exp(((-sqrt(dot(_webgl_d6e29e3dc865dd55, _webgl_d6e29e3dc865dd55))) * _webgl_5985a6d987efdfc3)), 0.0, 1.0)));
(out_webgl_9b98566002e557b5 = _webgl_eeab15c3195c8ba4);
(out_webgl_9b98566002e557b5.x += 0.95550251);
}
struct PS_INPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD5;
    float3 v0 : TEXCOORD0;
    float3 v1 : TEXCOORD1;
    float3 v2 : TEXCOORD2;
    float3 v3 : TEXCOORD3;
    float2 v4 : TEXCOORD4;
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
    _webgl_1fbc414219312258 = input.v0.xyz;
    _webgl_5c81bf65ffac0762 = input.v1.xyz;
    _webgl_85d2dc26c2bd8386 = input.v2.xyz;
    _webgl_cc88c95a9917294 = input.v3.xyz;
    _webgl_a0b62b4d8ddcd62b = input.v4.xy;

    gl_main();

    return generateOutput();
}

