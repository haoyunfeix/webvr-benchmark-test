
float float_ctor(int x0)
{
    return float(x0);
}
int int_ctor(float x0)
{
    return int(x0);
}
// Uniforms

uniform float3 _webgl_35c9514d594e36f3 : register(c0);
uniform float3 _webgl_3b3710b9db4788a7 : register(c1);
uniform float _webgl_5985a6d987efdfc3 : register(c2);
uniform float _webgl_ae2115093f2ac183 : register(c3);
uniform float3 _webgl_16cc37db4120bb6a : register(c4);
uniform float3 _webgl_2d459f8069f64681 : register(c5);
uniform float3 _webgl_e2179ae4f2cb06c9 : register(c6);
uniform float _webgl_508641f47c99a2ed : register(c7);
uniform float _webgl_7ae668e5b64ca8de : register(c8);
static const uint _webgl_e2d4935665806094 = 0;
static const uint _webgl_6d18ad23908e287 = 1;
static const uint _webgl_6666018523ec4102 = 2;
static const uint _webgl_f40e146fb06e4a34 = 3;
static const uint _webgl_340f351c4a4314aa = 4;
static const uint _webgl_7b5e6932dac63e22 = 5;
static const uint textureIndexOffsetCube = 0;
static const uint samplerIndexOffsetCube = 0;
uniform TextureCube<float4> texturesCube[6] : register(t0);
uniform SamplerState samplersCube[6] : register(s0);
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
static  float _webgl_f65f399f8169fe71 = {0};

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
    SamplerMetadata samplerMetadata[6] : packoffset(c4);
};

float4 gl_textureCube(uint samplerIndex, float3 t)
{
    const uint textureIndex = samplerIndex - textureIndexOffsetCube;
    const uint samplerArrayIndex = samplerIndex - samplerIndexOffsetCube;
    return texturesCube[textureIndex].Sample(samplersCube[samplerArrayIndex], float3(t.x, t.y, t.z));
}

void f_initGlobals();
;
static float3 _webgl_540f7c123bdf52c0 = {0, 0, 0};
static float3 _webgl_acb134d5a49c2148 = {0, 0, 0};
static float _webgl_8e684f5904e88831 = {0};
void gl_main()
{
f_initGlobals();
(out_webgl_9b98566002e557b5 = float4(0.0, 0.0, 0.0, 0.0));
(_webgl_540f7c123bdf52c0 = float3(0.0, 0.0, 0.0));
float3 _webgl_dbb0b86db3589565 = {0.0, 0.0, 0.0};
(_webgl_dbb0b86db3589565 = normalize((_webgl_35c9514d594e36f3 - _webgl_5c81bf65ffac0762)));
float3 _webgl_822b69d8b2db705f = {0.0, 0.0, 0.0};
(_webgl_822b69d8b2db705f = normalize(_webgl_cc88c95a9917294));
float3 _webgl_f28d072c82c61bea = {0.0, 0.0, 0.0};
(_webgl_f28d072c82c61bea = normalize(((2.0 * (dot(_webgl_822b69d8b2db705f, _webgl_dbb0b86db3589565) * _webgl_822b69d8b2db705f)) - _webgl_dbb0b86db3589565)));
(_webgl_8e684f5904e88831 = (_webgl_508641f47c99a2ed + 1e-07));
float _webgl_c0eaa468fdc20430 = {0.0};
float _webgl_3c71294eb0cb894e = {0.0};
(_webgl_3c71294eb0cb894e = (1.0 - max(dot(_webgl_822b69d8b2db705f, _webgl_dbb0b86db3589565), 0.0)));
float _webgl_8f7cfeb5dfbf859 = {0.0};
(_webgl_8f7cfeb5dfbf859 = (_webgl_3c71294eb0cb894e * _webgl_3c71294eb0cb894e));
(_webgl_c0eaa468fdc20430 = (_webgl_3c71294eb0cb894e * (_webgl_8f7cfeb5dfbf859 * _webgl_8f7cfeb5dfbf859)));
(_webgl_c0eaa468fdc20430 = (_webgl_c0eaa468fdc20430 * (_webgl_8e684f5904e88831 * _webgl_8e684f5904e88831)));
(_webgl_acb134d5a49c2148 = (_webgl_e2179ae4f2cb06c9 + ((1.0 - _webgl_e2179ae4f2cb06c9) * _webgl_c0eaa468fdc20430)));
float3 _webgl_64bc58e719cf8a86 = {0.0, 0.0, 0.0};
float3 _webgl_7b5671cfe49a4974 = {0.0, 0.0, 0.0};
(_webgl_7b5671cfe49a4974 = _webgl_822b69d8b2db705f);
float _webgl_46665ba4a0ebb347 = {0.0};
(_webgl_46665ba4a0ebb347 = max(max(abs(_webgl_822b69d8b2db705f.x), abs(_webgl_822b69d8b2db705f.y)), abs(_webgl_822b69d8b2db705f.z)));
float _webgl_73488ceaa0ef8fe3 = {0.0};
(_webgl_73488ceaa0ef8fe3 = abs(_webgl_822b69d8b2db705f.x));
if ((_webgl_73488ceaa0ef8fe3 != _webgl_46665ba4a0ebb347))
{
(_webgl_7b5671cfe49a4974.x = (_webgl_822b69d8b2db705f.x * 0.75));
}
float _webgl_73ad0cb88cd907dd = {0.0};
(_webgl_73ad0cb88cd907dd = abs(_webgl_822b69d8b2db705f.y));
if ((_webgl_73ad0cb88cd907dd != _webgl_46665ba4a0ebb347))
{
(_webgl_7b5671cfe49a4974.y = (_webgl_822b69d8b2db705f.y * 0.75));
}
float _webgl_4879e67e5ac43730 = {0.0};
(_webgl_4879e67e5ac43730 = abs(_webgl_822b69d8b2db705f.z));
if ((_webgl_4879e67e5ac43730 != _webgl_46665ba4a0ebb347))
{
(_webgl_7b5671cfe49a4974.z = (_webgl_822b69d8b2db705f.z * 0.75));
}
(_webgl_64bc58e719cf8a86.yz = _webgl_7b5671cfe49a4974.yz);
(_webgl_64bc58e719cf8a86.x = (-_webgl_7b5671cfe49a4974.x));
float4 _webgl_e25c9b31409332e8 = {0.0, 0.0, 0.0, 0.0};
(_webgl_e25c9b31409332e8 = gl_textureCube(_webgl_7b5e6932dac63e22, _webgl_64bc58e719cf8a86));
float3 _webgl_91c6fbb789786f97 = {0.0, 0.0, 0.0};
(_webgl_91c6fbb789786f97 = ((8.0 * _webgl_e25c9b31409332e8.w) * _webgl_e25c9b31409332e8.xyz));
(_webgl_540f7c123bdf52c0 = ((_webgl_91c6fbb789786f97 * _webgl_91c6fbb789786f97) * _webgl_ae2115093f2ac183));
float4 _webgl_177223ad0ad05d4c = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_6f4df154468b3729 = {0.0, 0.0, 0.0, 0.0};
float4 _webgl_7af42f25fb3f35b3[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
float3 _webgl_4432e07734eb567d = {0.0, 0.0, 0.0};
int _webgl_e03a6ea728c8fe92 = {0};
int _webgl_315cf9c145d4df06 = {0};
float _webgl_6472b8a26530e78b = {0.0};
(_webgl_6472b8a26530e78b = (clamp((1.0 - _webgl_8e684f5904e88831), 0.0, 1.0) * 5.0));
(_webgl_315cf9c145d4df06 = int_ctor(_webgl_6472b8a26530e78b));
(_webgl_e03a6ea728c8fe92 = int_ctor(min((_webgl_6472b8a26530e78b + 1.0), 7.0)));
float3 _webgl_7ba9b56a1a34e054 = {0.0, 0.0, 0.0};
(_webgl_7ba9b56a1a34e054 = _webgl_f28d072c82c61bea);
float _webgl_bd1cf0f064bc6fed = {0.0};
(_webgl_bd1cf0f064bc6fed = (1.0 - (exp2(_webgl_6472b8a26530e78b) / 128.0)));
float _webgl_dad807c3e946fcc4 = {0.0};
(_webgl_dad807c3e946fcc4 = max(max(abs(_webgl_f28d072c82c61bea.x), abs(_webgl_f28d072c82c61bea.y)), abs(_webgl_f28d072c82c61bea.z)));
float _webgl_4a69825d2061f2e4 = {0.0};
(_webgl_4a69825d2061f2e4 = abs(_webgl_f28d072c82c61bea.x));
if ((_webgl_4a69825d2061f2e4 != _webgl_dad807c3e946fcc4))
{
(_webgl_7ba9b56a1a34e054.x = (_webgl_f28d072c82c61bea.x * _webgl_bd1cf0f064bc6fed));
}
float _webgl_85f7bf17706eab85 = {0.0};
(_webgl_85f7bf17706eab85 = abs(_webgl_f28d072c82c61bea.y));
if ((_webgl_85f7bf17706eab85 != _webgl_dad807c3e946fcc4))
{
(_webgl_7ba9b56a1a34e054.y = (_webgl_f28d072c82c61bea.y * _webgl_bd1cf0f064bc6fed));
}
float _webgl_5cfd34df9dcb15f5 = {0.0};
(_webgl_5cfd34df9dcb15f5 = abs(_webgl_f28d072c82c61bea.z));
if ((_webgl_5cfd34df9dcb15f5 != _webgl_dad807c3e946fcc4))
{
(_webgl_7ba9b56a1a34e054.z = (_webgl_f28d072c82c61bea.z * _webgl_bd1cf0f064bc6fed));
}
(_webgl_4432e07734eb567d.yz = _webgl_7ba9b56a1a34e054.yz);
(_webgl_4432e07734eb567d.x = (-_webgl_7ba9b56a1a34e054.x));
(_webgl_7af42f25fb3f35b3[0] = gl_textureCube(_webgl_e2d4935665806094, _webgl_4432e07734eb567d));
(_webgl_7af42f25fb3f35b3[1] = gl_textureCube(_webgl_6d18ad23908e287, _webgl_4432e07734eb567d));
(_webgl_7af42f25fb3f35b3[2] = gl_textureCube(_webgl_6666018523ec4102, _webgl_4432e07734eb567d));
(_webgl_7af42f25fb3f35b3[3] = gl_textureCube(_webgl_f40e146fb06e4a34, _webgl_4432e07734eb567d));
(_webgl_7af42f25fb3f35b3[4] = gl_textureCube(_webgl_340f351c4a4314aa, _webgl_4432e07734eb567d));
(_webgl_7af42f25fb3f35b3[5] = gl_textureCube(_webgl_7b5e6932dac63e22, _webgl_4432e07734eb567d));
{ for(int _webgl_68ba279e0ff7f2de = {0}; (_webgl_68ba279e0ff7f2de < 6); (_webgl_68ba279e0ff7f2de++))
{
if ((_webgl_68ba279e0ff7f2de == _webgl_315cf9c145d4df06))
{
(_webgl_177223ad0ad05d4c = _webgl_7af42f25fb3f35b3[int_ctor(clamp(float_ctor(_webgl_68ba279e0ff7f2de), 0.0, 5.0))]);
}
if ((_webgl_68ba279e0ff7f2de == _webgl_e03a6ea728c8fe92))
{
(_webgl_6f4df154468b3729 = _webgl_7af42f25fb3f35b3[int_ctor(clamp(float_ctor(_webgl_68ba279e0ff7f2de), 0.0, 5.0))]);
}
}
}
float4 _webgl_cfe4f407d6834756 = {0.0, 0.0, 0.0, 0.0};
(_webgl_cfe4f407d6834756 = lerp(_webgl_177223ad0ad05d4c, _webgl_6f4df154468b3729, frac(_webgl_6472b8a26530e78b)));
float3 _webgl_8eabcbad90e5f7cf = {0.0, 0.0, 0.0};
(_webgl_8eabcbad90e5f7cf = ((8.0 * _webgl_cfe4f407d6834756.w) * _webgl_cfe4f407d6834756.xyz));
float4 _webgl_45bc8ea7e5f7a77c = {0.0, 0.0, 0.0, 0.0};
(_webgl_45bc8ea7e5f7a77c.xyz = ((_webgl_8eabcbad90e5f7cf * _webgl_8eabcbad90e5f7cf) * _webgl_ae2115093f2ac183));
(_webgl_45bc8ea7e5f7a77c.w = _webgl_7ae668e5b64ca8de);
float3 _webgl_d7a381f02878b408 = {0.0, 0.0, 0.0};
(_webgl_d7a381f02878b408 = lerp((_webgl_16cc37db4120bb6a * _webgl_540f7c123bdf52c0), (_webgl_45bc8ea7e5f7a77c.xyz * _webgl_7ae668e5b64ca8de), _webgl_acb134d5a49c2148));
(out_webgl_9b98566002e557b5.xyz = _webgl_d7a381f02878b408);
(out_webgl_9b98566002e557b5.xyz = (out_webgl_9b98566002e557b5.xyz + _webgl_2d459f8069f64681));
float3 _webgl_1e0a569fa8d323c5 = {0.0, 0.0, 0.0};
(_webgl_1e0a569fa8d323c5 = (_webgl_5c81bf65ffac0762 - _webgl_35c9514d594e36f3));
(out_webgl_9b98566002e557b5.xyz = lerp(_webgl_3b3710b9db4788a7, out_webgl_9b98566002e557b5.xyz, clamp(exp(((-sqrt(dot(_webgl_1e0a569fa8d323c5, _webgl_1e0a569fa8d323c5))) * _webgl_5985a6d987efdfc3)), 0.0, 1.0)));
(out_webgl_9b98566002e557b5.xyz = out_webgl_9b98566002e557b5.xyz);
(out_webgl_9b98566002e557b5.xyz = out_webgl_9b98566002e557b5.xyz);
(out_webgl_9b98566002e557b5.w = _webgl_f65f399f8169fe71);
(out_webgl_9b98566002e557b5.x += 0.32876387);
}
void f_initGlobals()
{
(_webgl_540f7c123bdf52c0 = float3(0.0, 0.0, 0.0));
(_webgl_acb134d5a49c2148 = float3(0.0, 0.0, 0.0));
(_webgl_8e684f5904e88831 = 0.0);
}
struct PS_INPUT
{
    float4 dx_Position : SV_Position;
    float4 gl_Position : TEXCOORD3;
    float3 v0 : TEXCOORD0;
    float3 v1 : TEXCOORD1;
    float v2 : TEXCOORD2;
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
    _webgl_f65f399f8169fe71 = input.v2.x;

    gl_main();

    return generateOutput();
}

