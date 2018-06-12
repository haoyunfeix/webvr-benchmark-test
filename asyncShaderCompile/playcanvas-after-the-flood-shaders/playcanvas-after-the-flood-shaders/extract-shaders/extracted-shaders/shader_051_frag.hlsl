
float2 vec2_ctor(float x0)
{
    return float2(x0, x0);
}
// Uniforms

uniform float _webgl_e841568a4415b2f5 : register(c0);
uniform float _webgl_9a8fb5cd706f4c3 : register(c1);
static const uint _webgl_a281e172b023aebc = 0;
static const uint _webgl_f1f34a74fabade41 = 1;
uniform Texture2D<float4> textures2D[2] : register(t0);
uniform SamplerState samplers2D[2] : register(s0);
#ifdef ANGLE_ENABLE_LOOP_FLATTEN
#define LOOP [loop]
#define FLATTEN [flatten]
#else
#define LOOP
#define FLATTEN
#endif
// Varyings
static  float3 _webgl_7d1e4db7ab4fa918 = {0, 0, 0};

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
    SamplerMetadata samplerMetadata[2] : packoffset(c4);
};

float4 gl_texture2D(uint samplerIndex, float2 t)
{
    return textures2D[samplerIndex].Sample(samplers2D[samplerIndex], float2(t.x, t.y));
}

void gl_main()
{
(out_webgl_9b98566002e557b5 = float4(0.0, 0.0, 0.0, 0.0));
float _webgl_b1a10a7733492733 = {0.0};
float3 _webgl_822b69d8b2db705f = {0.0, 0.0, 0.0};
(_webgl_822b69d8b2db705f = normalize(_webgl_7d1e4db7ab4fa918));
float _webgl_f28d072c82c61bea = {0.0};
(_webgl_f28d072c82c61bea = clamp(_webgl_822b69d8b2db705f.y, 0.0, 1.0));
(_webgl_b1a10a7733492733 = (lerp(2.0, 0.89999998, _webgl_f28d072c82c61bea) * 0.0140625));
float3 _webgl_25347e787f04c1f8 = {0.0, 0.0, 0.0};
float _webgl_e3f1d1f95e95209b = {0.0};
(_webgl_e3f1d1f95e95209b = (_webgl_9a8fb5cd706f4c3 * 0.1));
(_webgl_25347e787f04c1f8 = (_webgl_822b69d8b2db705f * 0.25));
float3 _webgl_8f7cfeb5dfbf859 = {0.0, 0.0, 0.0};
(_webgl_8f7cfeb5dfbf859 = floor(_webgl_25347e787f04c1f8));
float3 _webgl_1faa0f23efdce98 = {0.0, 0.0, 0.0};
(_webgl_1faa0f23efdce98 = (_webgl_8f7cfeb5dfbf859 + float3(1.0, 0.0, 0.0)));
float3 _webgl_5ccca921d933644d = {0.0, 0.0, 0.0};
(_webgl_5ccca921d933644d = frac((_webgl_1faa0f23efdce98 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_1faa0f23efdce98 = (_webgl_5ccca921d933644d + dot(_webgl_5ccca921d933644d, (_webgl_5ccca921d933644d.yzx + 19.190001))));
float3 _webgl_7dcebee9b4d9f29a = {0.0, 0.0, 0.0};
(_webgl_7dcebee9b4d9f29a = (_webgl_8f7cfeb5dfbf859 + float3(0.0, 1.0, 0.0)));
float3 _webgl_73488ceaa0ef8fe3 = {0.0, 0.0, 0.0};
(_webgl_73488ceaa0ef8fe3 = frac((_webgl_7dcebee9b4d9f29a * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_7dcebee9b4d9f29a = (_webgl_73488ceaa0ef8fe3 + dot(_webgl_73488ceaa0ef8fe3, (_webgl_73488ceaa0ef8fe3.yzx + 19.190001))));
float3 _webgl_858baa5387f04d68 = {0.0, 0.0, 0.0};
(_webgl_858baa5387f04d68 = (_webgl_8f7cfeb5dfbf859 + float3(1.0, 1.0, 0.0)));
float3 _webgl_4879e67e5ac43730 = {0.0, 0.0, 0.0};
(_webgl_4879e67e5ac43730 = frac((_webgl_858baa5387f04d68 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_858baa5387f04d68 = (_webgl_4879e67e5ac43730 + dot(_webgl_4879e67e5ac43730, (_webgl_4879e67e5ac43730.yzx + 19.190001))));
float3 _webgl_1cfb7d285b0071b8 = {0.0, 0.0, 0.0};
(_webgl_1cfb7d285b0071b8 = (_webgl_8f7cfeb5dfbf859 + float3(0.0, 0.0, 1.0)));
float3 _webgl_91c6fbb789786f97 = {0.0, 0.0, 0.0};
(_webgl_91c6fbb789786f97 = frac((_webgl_1cfb7d285b0071b8 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_1cfb7d285b0071b8 = (_webgl_91c6fbb789786f97 + dot(_webgl_91c6fbb789786f97, (_webgl_91c6fbb789786f97.yzx + 19.190001))));
float3 _webgl_e49ed14db818dcaf = {0.0, 0.0, 0.0};
(_webgl_e49ed14db818dcaf = (_webgl_8f7cfeb5dfbf859 + float3(1.0, 0.0, 1.0)));
float3 _webgl_3489059248406aa1 = {0.0, 0.0, 0.0};
(_webgl_3489059248406aa1 = frac((_webgl_e49ed14db818dcaf * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_e49ed14db818dcaf = (_webgl_3489059248406aa1 + dot(_webgl_3489059248406aa1, (_webgl_3489059248406aa1.yzx + 19.190001))));
float3 _webgl_b67706b65d5683bb = {0.0, 0.0, 0.0};
(_webgl_b67706b65d5683bb = (_webgl_8f7cfeb5dfbf859 + float3(0.0, 1.0, 1.0)));
float3 _webgl_f26380f436f82532 = {0.0, 0.0, 0.0};
(_webgl_f26380f436f82532 = frac((_webgl_b67706b65d5683bb * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_b67706b65d5683bb = (_webgl_f26380f436f82532 + dot(_webgl_f26380f436f82532, (_webgl_f26380f436f82532.yzx + 19.190001))));
float3 _webgl_fb83767eb8b267a5 = {0.0, 0.0, 0.0};
(_webgl_fb83767eb8b267a5 = (_webgl_8f7cfeb5dfbf859 + float3(1.0, 1.0, 1.0)));
float3 _webgl_cd6eaaff7ab905f1 = {0.0, 0.0, 0.0};
(_webgl_cd6eaaff7ab905f1 = frac((_webgl_fb83767eb8b267a5 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_fb83767eb8b267a5 = (_webgl_cd6eaaff7ab905f1 + dot(_webgl_cd6eaaff7ab905f1, (_webgl_cd6eaaff7ab905f1.yzx + 19.190001))));
(_webgl_25347e787f04c1f8 = (_webgl_25347e787f04c1f8 * 3.02));
(_webgl_25347e787f04c1f8.yz = (_webgl_25347e787f04c1f8.yz - (vec2_ctor(_webgl_e3f1d1f95e95209b) * float2(0.2, 0.2))));
float3 _webgl_cf179e362a646f90 = {0.0, 0.0, 0.0};
(_webgl_cf179e362a646f90 = floor(_webgl_25347e787f04c1f8));
float3 _webgl_21b8e3a1918dd749 = {0.0, 0.0, 0.0};
(_webgl_21b8e3a1918dd749 = (_webgl_cf179e362a646f90 + float3(1.0, 0.0, 0.0)));
float3 _webgl_ba8e8168781d9774 = {0.0, 0.0, 0.0};
(_webgl_ba8e8168781d9774 = frac((_webgl_21b8e3a1918dd749 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_21b8e3a1918dd749 = (_webgl_ba8e8168781d9774 + dot(_webgl_ba8e8168781d9774, (_webgl_ba8e8168781d9774.yzx + 19.190001))));
float3 _webgl_f30eb91c4190df6d = {0.0, 0.0, 0.0};
(_webgl_f30eb91c4190df6d = (_webgl_cf179e362a646f90 + float3(0.0, 1.0, 0.0)));
float3 _webgl_dad807c3e946fcc4 = {0.0, 0.0, 0.0};
(_webgl_dad807c3e946fcc4 = frac((_webgl_f30eb91c4190df6d * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_f30eb91c4190df6d = (_webgl_dad807c3e946fcc4 + dot(_webgl_dad807c3e946fcc4, (_webgl_dad807c3e946fcc4.yzx + 19.190001))));
float3 _webgl_fc6a4ed2ca331181 = {0.0, 0.0, 0.0};
(_webgl_fc6a4ed2ca331181 = (_webgl_cf179e362a646f90 + float3(1.0, 1.0, 0.0)));
float3 _webgl_85f7bf17706eab85 = {0.0, 0.0, 0.0};
(_webgl_85f7bf17706eab85 = frac((_webgl_fc6a4ed2ca331181 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_fc6a4ed2ca331181 = (_webgl_85f7bf17706eab85 + dot(_webgl_85f7bf17706eab85, (_webgl_85f7bf17706eab85.yzx + 19.190001))));
float3 _webgl_ce2f1c087ad9bb2b = {0.0, 0.0, 0.0};
(_webgl_ce2f1c087ad9bb2b = (_webgl_cf179e362a646f90 + float3(0.0, 0.0, 1.0)));
float3 _webgl_cfe4f407d6834756 = {0.0, 0.0, 0.0};
(_webgl_cfe4f407d6834756 = frac((_webgl_ce2f1c087ad9bb2b * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_ce2f1c087ad9bb2b = (_webgl_cfe4f407d6834756 + dot(_webgl_cfe4f407d6834756, (_webgl_cfe4f407d6834756.yzx + 19.190001))));
float3 _webgl_c92d340f7252463c = {0.0, 0.0, 0.0};
(_webgl_c92d340f7252463c = (_webgl_cf179e362a646f90 + float3(1.0, 0.0, 1.0)));
float3 _webgl_45bc8ea7e5f7a77c = {0.0, 0.0, 0.0};
(_webgl_45bc8ea7e5f7a77c = frac((_webgl_c92d340f7252463c * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_c92d340f7252463c = (_webgl_45bc8ea7e5f7a77c + dot(_webgl_45bc8ea7e5f7a77c, (_webgl_45bc8ea7e5f7a77c.yzx + 19.190001))));
float3 _webgl_aa487753cee21f10 = {0.0, 0.0, 0.0};
(_webgl_aa487753cee21f10 = (_webgl_cf179e362a646f90 + float3(0.0, 1.0, 1.0)));
float3 _webgl_1e0a569fa8d323c5 = {0.0, 0.0, 0.0};
(_webgl_1e0a569fa8d323c5 = frac((_webgl_aa487753cee21f10 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_aa487753cee21f10 = (_webgl_1e0a569fa8d323c5 + dot(_webgl_1e0a569fa8d323c5, (_webgl_1e0a569fa8d323c5.yzx + 19.190001))));
float3 _webgl_febfaeb8438f8fb8 = {0.0, 0.0, 0.0};
(_webgl_febfaeb8438f8fb8 = (_webgl_cf179e362a646f90 + float3(1.0, 1.0, 1.0)));
float3 _webgl_82fa7c9f93cc7839 = {0.0, 0.0, 0.0};
(_webgl_82fa7c9f93cc7839 = frac((_webgl_febfaeb8438f8fb8 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_febfaeb8438f8fb8 = (_webgl_82fa7c9f93cc7839 + dot(_webgl_82fa7c9f93cc7839, (_webgl_82fa7c9f93cc7839.yzx + 19.190001))));
(_webgl_25347e787f04c1f8 = (_webgl_25347e787f04c1f8 * 3.03));
(_webgl_25347e787f04c1f8.yz = (_webgl_25347e787f04c1f8.yz + (vec2_ctor(_webgl_e3f1d1f95e95209b) * float2(0.059999999, 0.059999999))));
float3 _webgl_6b8507d7c52a30c5 = {0.0, 0.0, 0.0};
(_webgl_6b8507d7c52a30c5 = floor(_webgl_25347e787f04c1f8));
float3 _webgl_9fd93819b757f09a = {0.0, 0.0, 0.0};
(_webgl_9fd93819b757f09a = (_webgl_6b8507d7c52a30c5 + float3(1.0, 0.0, 0.0)));
float3 _webgl_a5cbea098f008107 = {0.0, 0.0, 0.0};
(_webgl_a5cbea098f008107 = frac((_webgl_9fd93819b757f09a * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_9fd93819b757f09a = (_webgl_a5cbea098f008107 + dot(_webgl_a5cbea098f008107, (_webgl_a5cbea098f008107.yzx + 19.190001))));
float3 _webgl_2f400b7a70c5d0e1 = {0.0, 0.0, 0.0};
(_webgl_2f400b7a70c5d0e1 = (_webgl_6b8507d7c52a30c5 + float3(0.0, 1.0, 0.0)));
float3 _webgl_a2ea1ce929cac431 = {0.0, 0.0, 0.0};
(_webgl_a2ea1ce929cac431 = frac((_webgl_2f400b7a70c5d0e1 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_2f400b7a70c5d0e1 = (_webgl_a2ea1ce929cac431 + dot(_webgl_a2ea1ce929cac431, (_webgl_a2ea1ce929cac431.yzx + 19.190001))));
float3 _webgl_6205c2be9f297bdb = {0.0, 0.0, 0.0};
(_webgl_6205c2be9f297bdb = (_webgl_6b8507d7c52a30c5 + float3(1.0, 1.0, 0.0)));
float3 _webgl_48742813565ac55d = {0.0, 0.0, 0.0};
(_webgl_48742813565ac55d = frac((_webgl_6205c2be9f297bdb * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_6205c2be9f297bdb = (_webgl_48742813565ac55d + dot(_webgl_48742813565ac55d, (_webgl_48742813565ac55d.yzx + 19.190001))));
float3 _webgl_b29a71f223ce298a = {0.0, 0.0, 0.0};
(_webgl_b29a71f223ce298a = (_webgl_6b8507d7c52a30c5 + float3(0.0, 0.0, 1.0)));
float3 _webgl_bb4c022d8fffa1de = {0.0, 0.0, 0.0};
(_webgl_bb4c022d8fffa1de = frac((_webgl_b29a71f223ce298a * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_b29a71f223ce298a = (_webgl_bb4c022d8fffa1de + dot(_webgl_bb4c022d8fffa1de, (_webgl_bb4c022d8fffa1de.yzx + 19.190001))));
float3 _webgl_23eb04e2fd545474 = {0.0, 0.0, 0.0};
(_webgl_23eb04e2fd545474 = (_webgl_6b8507d7c52a30c5 + float3(1.0, 0.0, 1.0)));
float3 _webgl_17eaf291e44ff974 = {0.0, 0.0, 0.0};
(_webgl_17eaf291e44ff974 = frac((_webgl_23eb04e2fd545474 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_23eb04e2fd545474 = (_webgl_17eaf291e44ff974 + dot(_webgl_17eaf291e44ff974, (_webgl_17eaf291e44ff974.yzx + 19.190001))));
float3 _webgl_825ff48720b3850 = {0.0, 0.0, 0.0};
(_webgl_825ff48720b3850 = (_webgl_6b8507d7c52a30c5 + float3(0.0, 1.0, 1.0)));
float3 _webgl_6845b595a6db2b36 = {0.0, 0.0, 0.0};
(_webgl_6845b595a6db2b36 = frac((_webgl_825ff48720b3850 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_825ff48720b3850 = (_webgl_6845b595a6db2b36 + dot(_webgl_6845b595a6db2b36, (_webgl_6845b595a6db2b36.yzx + 19.190001))));
float3 _webgl_3c474757dbacb7e5 = {0.0, 0.0, 0.0};
(_webgl_3c474757dbacb7e5 = (_webgl_6b8507d7c52a30c5 + float3(1.0, 1.0, 1.0)));
float3 _webgl_dbaa033991f73c9d = {0.0, 0.0, 0.0};
(_webgl_dbaa033991f73c9d = frac((_webgl_3c474757dbacb7e5 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_3c474757dbacb7e5 = (_webgl_dbaa033991f73c9d + dot(_webgl_dbaa033991f73c9d, (_webgl_dbaa033991f73c9d.yzx + 19.190001))));
(_webgl_25347e787f04c1f8 = (_webgl_25347e787f04c1f8 * 3.01));
float3 _webgl_8a1c983d2a5521d3 = {0.0, 0.0, 0.0};
(_webgl_8a1c983d2a5521d3 = floor(_webgl_25347e787f04c1f8));
float3 _webgl_1dea28ef183a7405 = {0.0, 0.0, 0.0};
(_webgl_1dea28ef183a7405 = (_webgl_8a1c983d2a5521d3 + float3(1.0, 0.0, 0.0)));
float3 _webgl_2ef05ecaa6259cbe = {0.0, 0.0, 0.0};
(_webgl_2ef05ecaa6259cbe = frac((_webgl_1dea28ef183a7405 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_1dea28ef183a7405 = (_webgl_2ef05ecaa6259cbe + dot(_webgl_2ef05ecaa6259cbe, (_webgl_2ef05ecaa6259cbe.yzx + 19.190001))));
float3 _webgl_cd33c0acd8d4d2a9 = {0.0, 0.0, 0.0};
(_webgl_cd33c0acd8d4d2a9 = (_webgl_8a1c983d2a5521d3 + float3(0.0, 1.0, 0.0)));
float3 _webgl_61c6aec6c44642a1 = {0.0, 0.0, 0.0};
(_webgl_61c6aec6c44642a1 = frac((_webgl_cd33c0acd8d4d2a9 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_cd33c0acd8d4d2a9 = (_webgl_61c6aec6c44642a1 + dot(_webgl_61c6aec6c44642a1, (_webgl_61c6aec6c44642a1.yzx + 19.190001))));
float3 _webgl_3ff42dbf1d6bc689 = {0.0, 0.0, 0.0};
(_webgl_3ff42dbf1d6bc689 = (_webgl_8a1c983d2a5521d3 + float3(1.0, 1.0, 0.0)));
float3 _webgl_b3646d04812e7a4a = {0.0, 0.0, 0.0};
(_webgl_b3646d04812e7a4a = frac((_webgl_3ff42dbf1d6bc689 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_3ff42dbf1d6bc689 = (_webgl_b3646d04812e7a4a + dot(_webgl_b3646d04812e7a4a, (_webgl_b3646d04812e7a4a.yzx + 19.190001))));
float3 _webgl_ddf038fa5c8cf328 = {0.0, 0.0, 0.0};
(_webgl_ddf038fa5c8cf328 = (_webgl_8a1c983d2a5521d3 + float3(0.0, 0.0, 1.0)));
float3 _webgl_8badbc4aa9205681 = {0.0, 0.0, 0.0};
(_webgl_8badbc4aa9205681 = frac((_webgl_ddf038fa5c8cf328 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_ddf038fa5c8cf328 = (_webgl_8badbc4aa9205681 + dot(_webgl_8badbc4aa9205681, (_webgl_8badbc4aa9205681.yzx + 19.190001))));
float3 _webgl_addc40f2740b3bd3 = {0.0, 0.0, 0.0};
(_webgl_addc40f2740b3bd3 = (_webgl_8a1c983d2a5521d3 + float3(1.0, 0.0, 1.0)));
float3 _webgl_80f9c2f994f34f1e = {0.0, 0.0, 0.0};
(_webgl_80f9c2f994f34f1e = frac((_webgl_addc40f2740b3bd3 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_addc40f2740b3bd3 = (_webgl_80f9c2f994f34f1e + dot(_webgl_80f9c2f994f34f1e, (_webgl_80f9c2f994f34f1e.yzx + 19.190001))));
float3 _webgl_153459c06717aca4 = {0.0, 0.0, 0.0};
(_webgl_153459c06717aca4 = (_webgl_8a1c983d2a5521d3 + float3(0.0, 1.0, 1.0)));
float3 _webgl_a52374383578cc70 = {0.0, 0.0, 0.0};
(_webgl_a52374383578cc70 = frac((_webgl_153459c06717aca4 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_153459c06717aca4 = (_webgl_a52374383578cc70 + dot(_webgl_a52374383578cc70, (_webgl_a52374383578cc70.yzx + 19.190001))));
float3 _webgl_8486a19e2182caeb = {0.0, 0.0, 0.0};
(_webgl_8486a19e2182caeb = (_webgl_8a1c983d2a5521d3 + float3(1.0, 1.0, 1.0)));
float3 _webgl_56077667bfd6d861 = {0.0, 0.0, 0.0};
(_webgl_56077667bfd6d861 = frac((_webgl_8486a19e2182caeb * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_8486a19e2182caeb = (_webgl_56077667bfd6d861 + dot(_webgl_56077667bfd6d861, (_webgl_56077667bfd6d861.yzx + 19.190001))));
(_webgl_25347e787f04c1f8 = (_webgl_25347e787f04c1f8 * 3.03));
float3 _webgl_b190a86bc7f938d2 = {0.0, 0.0, 0.0};
(_webgl_b190a86bc7f938d2 = floor(_webgl_25347e787f04c1f8));
float3 _webgl_643c2e34214fbf43 = {0.0, 0.0, 0.0};
(_webgl_643c2e34214fbf43 = (_webgl_b190a86bc7f938d2 + float3(1.0, 0.0, 0.0)));
float3 _webgl_8e449eeb6739befe = {0.0, 0.0, 0.0};
(_webgl_8e449eeb6739befe = frac((_webgl_643c2e34214fbf43 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_643c2e34214fbf43 = (_webgl_8e449eeb6739befe + dot(_webgl_8e449eeb6739befe, (_webgl_8e449eeb6739befe.yzx + 19.190001))));
float3 _webgl_afb5d42c617ea183 = {0.0, 0.0, 0.0};
(_webgl_afb5d42c617ea183 = (_webgl_b190a86bc7f938d2 + float3(0.0, 1.0, 0.0)));
float3 _webgl_6430cdf0dbc8e939 = {0.0, 0.0, 0.0};
(_webgl_6430cdf0dbc8e939 = frac((_webgl_afb5d42c617ea183 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_afb5d42c617ea183 = (_webgl_6430cdf0dbc8e939 + dot(_webgl_6430cdf0dbc8e939, (_webgl_6430cdf0dbc8e939.yzx + 19.190001))));
float3 _webgl_6ca7f6ea0821cd5 = {0.0, 0.0, 0.0};
(_webgl_6ca7f6ea0821cd5 = (_webgl_b190a86bc7f938d2 + float3(1.0, 1.0, 0.0)));
float3 _webgl_9090da22dad28bf7 = {0.0, 0.0, 0.0};
(_webgl_9090da22dad28bf7 = frac((_webgl_6ca7f6ea0821cd5 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_6ca7f6ea0821cd5 = (_webgl_9090da22dad28bf7 + dot(_webgl_9090da22dad28bf7, (_webgl_9090da22dad28bf7.yzx + 19.190001))));
float3 _webgl_c95efd1a18b365c0 = {0.0, 0.0, 0.0};
(_webgl_c95efd1a18b365c0 = (_webgl_b190a86bc7f938d2 + float3(0.0, 0.0, 1.0)));
float3 _webgl_4a15523e4032dda7 = {0.0, 0.0, 0.0};
(_webgl_4a15523e4032dda7 = frac((_webgl_c95efd1a18b365c0 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_c95efd1a18b365c0 = (_webgl_4a15523e4032dda7 + dot(_webgl_4a15523e4032dda7, (_webgl_4a15523e4032dda7.yzx + 19.190001))));
float3 _webgl_96701531ac9a1e4f = {0.0, 0.0, 0.0};
(_webgl_96701531ac9a1e4f = (_webgl_b190a86bc7f938d2 + float3(1.0, 0.0, 1.0)));
float3 _webgl_e2e2a31b2325c72 = {0.0, 0.0, 0.0};
(_webgl_e2e2a31b2325c72 = frac((_webgl_96701531ac9a1e4f * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_96701531ac9a1e4f = (_webgl_e2e2a31b2325c72 + dot(_webgl_e2e2a31b2325c72, (_webgl_e2e2a31b2325c72.yzx + 19.190001))));
float3 _webgl_3bb51da291915678 = {0.0, 0.0, 0.0};
(_webgl_3bb51da291915678 = (_webgl_b190a86bc7f938d2 + float3(0.0, 1.0, 1.0)));
float3 _webgl_efb9abf9cf1319d2 = {0.0, 0.0, 0.0};
(_webgl_efb9abf9cf1319d2 = frac((_webgl_3bb51da291915678 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_3bb51da291915678 = (_webgl_efb9abf9cf1319d2 + dot(_webgl_efb9abf9cf1319d2, (_webgl_efb9abf9cf1319d2.yzx + 19.190001))));
float3 _webgl_94563f9958cbbd76 = {0.0, 0.0, 0.0};
(_webgl_94563f9958cbbd76 = (_webgl_b190a86bc7f938d2 + float3(1.0, 1.0, 1.0)));
float3 _webgl_45dfddb747caee = {0.0, 0.0, 0.0};
(_webgl_45dfddb747caee = frac((_webgl_94563f9958cbbd76 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_94563f9958cbbd76 = (_webgl_45dfddb747caee + dot(_webgl_45dfddb747caee, (_webgl_45dfddb747caee.yzx + 19.190001))));
(_webgl_25347e787f04c1f8 = (_webgl_25347e787f04c1f8 * 3.02));
float3 _webgl_b59ec816fb13ac1d = {0.0, 0.0, 0.0};
(_webgl_b59ec816fb13ac1d = floor(_webgl_25347e787f04c1f8));
float3 _webgl_84c00f87f9ae887d = {0.0, 0.0, 0.0};
(_webgl_84c00f87f9ae887d = (_webgl_b59ec816fb13ac1d + float3(1.0, 0.0, 0.0)));
float3 _webgl_ea6b6b1beb91da53 = {0.0, 0.0, 0.0};
(_webgl_ea6b6b1beb91da53 = frac((_webgl_84c00f87f9ae887d * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_84c00f87f9ae887d = (_webgl_ea6b6b1beb91da53 + dot(_webgl_ea6b6b1beb91da53, (_webgl_ea6b6b1beb91da53.yzx + 19.190001))));
float3 _webgl_2b3f1b95dfaea4d6 = {0.0, 0.0, 0.0};
(_webgl_2b3f1b95dfaea4d6 = (_webgl_b59ec816fb13ac1d + float3(0.0, 1.0, 0.0)));
float3 _webgl_918bfbe86971a17d = {0.0, 0.0, 0.0};
(_webgl_918bfbe86971a17d = frac((_webgl_2b3f1b95dfaea4d6 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_2b3f1b95dfaea4d6 = (_webgl_918bfbe86971a17d + dot(_webgl_918bfbe86971a17d, (_webgl_918bfbe86971a17d.yzx + 19.190001))));
float3 _webgl_72c6a3fb9d3ad906 = {0.0, 0.0, 0.0};
(_webgl_72c6a3fb9d3ad906 = (_webgl_b59ec816fb13ac1d + float3(1.0, 1.0, 0.0)));
float3 _webgl_7e3324c54b5b8145 = {0.0, 0.0, 0.0};
(_webgl_7e3324c54b5b8145 = frac((_webgl_72c6a3fb9d3ad906 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_72c6a3fb9d3ad906 = (_webgl_7e3324c54b5b8145 + dot(_webgl_7e3324c54b5b8145, (_webgl_7e3324c54b5b8145.yzx + 19.190001))));
float3 _webgl_4f7acc9301fce283 = {0.0, 0.0, 0.0};
(_webgl_4f7acc9301fce283 = (_webgl_b59ec816fb13ac1d + float3(0.0, 0.0, 1.0)));
float3 _webgl_8bc016e8908b6083 = {0.0, 0.0, 0.0};
(_webgl_8bc016e8908b6083 = frac((_webgl_4f7acc9301fce283 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_4f7acc9301fce283 = (_webgl_8bc016e8908b6083 + dot(_webgl_8bc016e8908b6083, (_webgl_8bc016e8908b6083.yzx + 19.190001))));
float3 _webgl_bbdbe7cf37536c5b = {0.0, 0.0, 0.0};
(_webgl_bbdbe7cf37536c5b = (_webgl_b59ec816fb13ac1d + float3(1.0, 0.0, 1.0)));
float3 _webgl_8190c59bfbd2d13 = {0.0, 0.0, 0.0};
(_webgl_8190c59bfbd2d13 = frac((_webgl_bbdbe7cf37536c5b * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_bbdbe7cf37536c5b = (_webgl_8190c59bfbd2d13 + dot(_webgl_8190c59bfbd2d13, (_webgl_8190c59bfbd2d13.yzx + 19.190001))));
float3 _webgl_570b1b9251e88420 = {0.0, 0.0, 0.0};
(_webgl_570b1b9251e88420 = (_webgl_b59ec816fb13ac1d + float3(0.0, 1.0, 1.0)));
float3 _webgl_966a3add4cf69c50 = {0.0, 0.0, 0.0};
(_webgl_966a3add4cf69c50 = frac((_webgl_570b1b9251e88420 * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_570b1b9251e88420 = (_webgl_966a3add4cf69c50 + dot(_webgl_966a3add4cf69c50, (_webgl_966a3add4cf69c50.yzx + 19.190001))));
float3 _webgl_bc01aeadbec3fbb = {0.0, 0.0, 0.0};
(_webgl_bc01aeadbec3fbb = (_webgl_b59ec816fb13ac1d + float3(1.0, 1.0, 1.0)));
float3 _webgl_f1412ccb12cb1ff8 = {0.0, 0.0, 0.0};
(_webgl_f1412ccb12cb1ff8 = frac((_webgl_bc01aeadbec3fbb * float3(0.16531999, 0.17369001, 0.15786999))));
(_webgl_bc01aeadbec3fbb = (_webgl_f1412ccb12cb1ff8 + dot(_webgl_f1412ccb12cb1ff8, (_webgl_f1412ccb12cb1ff8.yzx + 19.190001))));
float3 _webgl_1e7d9c726c1fee81 = {0.0, 0.0, 0.0};
(_webgl_1e7d9c726c1fee81 = (_webgl_822b69d8b2db705f + (((float3(1.0, 0.0, 1.0) * (-_webgl_e841568a4415b2f5)) * _webgl_b1a10a7733492733) * _webgl_f28d072c82c61bea)));
float2 _webgl_36ae7d52fd3a7b32 = {0.0, 0.0};
(_webgl_36ae7d52fd3a7b32 = (_webgl_1e7d9c726c1fee81.xz / dot(float3(1.0, 1.0, 1.0), abs(_webgl_1e7d9c726c1fee81))));
float2 _webgl_f9e6b653e88bbbd4 = {0.0, 0.0};
(_webgl_f9e6b653e88bbbd4.x = (_webgl_36ae7d52fd3a7b32.x - _webgl_36ae7d52fd3a7b32.y));
(_webgl_f9e6b653e88bbbd4.y = (_webgl_36ae7d52fd3a7b32.x + _webgl_36ae7d52fd3a7b32.y));
float3 _webgl_3e1e07a5d3186e64 = {0.0, 0.0, 0.0};
(_webgl_3e1e07a5d3186e64 = (_webgl_822b69d8b2db705f + (((float3(1.0, 0.0, 1.0) * (1.0 - _webgl_e841568a4415b2f5)) * _webgl_b1a10a7733492733) * _webgl_f28d072c82c61bea)));
float2 _webgl_ae66eb76b3cbc304 = {0.0, 0.0};
(_webgl_ae66eb76b3cbc304 = (_webgl_3e1e07a5d3186e64.xz / dot(float3(1.0, 1.0, 1.0), abs(_webgl_3e1e07a5d3186e64))));
float2 _webgl_f86278d0c757c147 = {0.0, 0.0};
(_webgl_f86278d0c757c147.x = (_webgl_ae66eb76b3cbc304.x - _webgl_ae66eb76b3cbc304.y));
(_webgl_f86278d0c757c147.y = (_webgl_ae66eb76b3cbc304.x + _webgl_ae66eb76b3cbc304.y));
float4 _webgl_630dd71949843d37 = {0.0, 0.0, 0.0, 0.0};
(_webgl_630dd71949843d37 = gl_texture2D(_webgl_a281e172b023aebc, ((_webgl_f9e6b653e88bbbd4 * 0.5) + float2(0.5, 0.5))));
float3 _webgl_2384d5d4062810f0 = {0.0, 0.0, 0.0};
(_webgl_2384d5d4062810f0 = ((8.0 * _webgl_630dd71949843d37.w) * _webgl_630dd71949843d37.xyz));
float4 _webgl_92bf6f5a2eb60e58 = {0.0, 0.0, 0.0, 0.0};
(_webgl_92bf6f5a2eb60e58 = gl_texture2D(_webgl_f1f34a74fabade41, ((_webgl_f86278d0c757c147 * 0.5) + float2(0.5, 0.5))));
float3 _webgl_bc1ead19029cb4c7 = {0.0, 0.0, 0.0};
(_webgl_bc1ead19029cb4c7 = ((8.0 * _webgl_92bf6f5a2eb60e58.w) * _webgl_92bf6f5a2eb60e58.xyz));
float3 _webgl_6f17561e39060361 = {0.0, 0.0, 0.0};
(_webgl_6f17561e39060361 = lerp((_webgl_2384d5d4062810f0 * _webgl_2384d5d4062810f0), (_webgl_bc1ead19029cb4c7 * _webgl_bc1ead19029cb4c7), _webgl_e841568a4415b2f5));
float4 _webgl_7bc079d6dab55f4d = {0.0, 0.0, 0.0, 0.0};
(_webgl_7bc079d6dab55f4d.w = 1.0);
(_webgl_7bc079d6dab55f4d.xyz = _webgl_6f17561e39060361);
(out_webgl_9b98566002e557b5 = _webgl_7bc079d6dab55f4d);
(out_webgl_9b98566002e557b5.x += 0.1096564);
}
struct PS_INPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD1;
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
    _webgl_7d1e4db7ab4fa918 = input.v0.xyz;

    gl_main();

    return generateOutput();
}

