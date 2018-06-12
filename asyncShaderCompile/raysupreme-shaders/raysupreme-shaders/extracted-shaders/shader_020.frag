#version 300 es
precision highp float;

in vec2 vTexCoord;

uniform vec3 uOrigin, uLookAt;
uniform float uFov;
uniform vec2 inResolution;

uniform int uIter;
uniform float uTime, uRandom;
uniform sampler2D uLast;

uniform vec3 uMin, uMax;

uniform float uSelectedId;

uniform float uStepSize, uPrecision, uTMin, uTMax;
uniform int uSteps, uDepth, uColorMode;

uniform vec3 uSunDir;
uniform float uSunStrength;
uniform bool uSunActive;
uniform mat4 uInvertLocalTransform;
//uniform vec3 uGizmoTrans;
//uniform vec3 uGizmoRotate;
uniform vec3 uLocalScale;

struct Ray {
    vec3 origin;
    vec3 dir;
};

struct MaterialInfo {
    int type;
    int id;

    vec3  baseColor;
    float subsurface;
    float roughness;
    float metallic;
    float specular;
    float specularTint;
    float clearcoat;
    float clearcoatGloss;
    float anisotropic;
    float sheen;
    float sheenTint;

    float bump;
    vec3 emission;
    float ior;
};

struct Light {
    bool  isActive;
    vec3  pos;
    float radius;
    float bbox_area;
    vec3  bbox_min, bbox_max;
    float id;
};


float smin( float a, float b, float k )
{
    float res = exp( -k*a ) + exp( -k*b );
    return -log( res )/k;
}

vec3 opU( vec3 d1, vec3 d2 )
{
    return (d1.x<d2.x) ? d1 : d2;
}

vec3 opBlend( vec3 d1, vec3 d2, float k )
{
    vec3 rc;
    rc.x=smin( d1.x, d2.x, k );

    if ( d1.x < d2.x )
    {
    	rc.y=d1.y;
        rc.z=d1.z;
    } else
    {
    	rc.y=d2.y;
        rc.z=d2.z;
    }

    return rc;
}

float opS( float d1, float d2 )
{
    return max(-d2,d1);
}

float opI( float d1, float d2 )
{
    return max(d1,d2);
}

vec3 opRep( vec3 p, vec3 c )
{
    return mod(p,c)-0.5*c;
}

vec3 opTwist( vec3 p, float twist )
{
    float c = cos(twist*p.z);
    float s = sin(twist*p.z);
    mat2  m = mat2(c,-s,s,c);
    vec3  q = vec3(m*p.xy,p.z);
    return q;
}

vec3 opCheapBend( vec3 p, float bend )
{
    float c = cos(bend*p.y);
    float s = sin(bend*p.y);
    mat2  m = mat2(c,-s,s,c);
    vec3  q = vec3(m*p.xy,p.z);
    return q;
}

float fold2(float p){
    return abs(p);
}
vec2 fold4(vec2 p){
    return abs(p);
}
vec2 fold6(vec2 p){
    p.y = abs(p.y);
    const vec2 p1 = vec2(0.8657, 0.5);
    const vec2 p2 = vec2(0.8657, -0.5);
    p -= p1 * 2. * min(0., dot(p, p1));
    p -= p2 * 2. * min(0., dot(p, p2));
    return p;
}
vec2 fold8(vec2 p){
    p = abs(p);
    const vec2 p1 = vec2(0.7071, -0.7071);
    p -= p1 * 2. * min(0., dot(p, p1));
    return p;
}
vec2 fold10(vec2 p){
    p.y = abs(p.y);
    const vec2 p1 = vec2(0.9510, 0.3090);
    const vec2 p2 = vec2(0.9510, -0.3090);
    const vec2 p3 = vec2(0.5878, -0.8090);
    p -= p1 * 2. * min(0., dot(p, p1));
    p -= p2 * 2. * min(0., dot(p, p2));
    p -= p3 * 2. * min(0., dot(p, p3));
    return p;
}
vec2 fold12(vec2 p){
    p = abs(p);
    const vec2 p1 = vec2(0.8657, -0.5);
    const vec2 p2 = vec2(0.5, -0.8657);
    p -= p1 * 2. * min(0., dot(p, p1));
    p -= p2 * 2. * min(0., dot(p, p2));
    return p;
}
vec2 fold14(vec2 p){
    p.y = abs(p.y);
    const vec2 p1 = vec2(0.9749, 0.2225);
    const vec2 p2 = vec2(0.7818, -0.6235);
    const vec2 p3 = vec2(0.4339, -0.9010);
    p -= p1 * 2. * min(0., dot(p, p1));
    p -= p2 * 2. * min(0., dot(p, p2));
    p -= p3 * 2. * min(0., dot(p, p3));
    return p;
}
vec2 fold16(vec2 p){
    p = abs(p);
    const vec2 p1 = vec2(0.7071, -0.7071);
    const vec2 p2 = vec2(0.3827, -0.9237);
    p -= p1 * 2. * min(0., dot(p, p1));
    p -= p2 * 2. * min(0., dot(p, p2));
    return p;
}

// return inverse R * inverse T
// inverse R = transpose R
mat4 transRotateTaitBryan(vec3 trans, vec3 alpha){
    vec3 c = cos(alpha);
    vec3 s = sin(alpha);
    vec4 v1 = vec4(c.y*c.z, c.x*s.z + c.z*s.x*s.y, s.x*s.z-c.x*c.z*s.y, 0.0);
    vec4 v2 = vec4(-c.y*s.z, c.x*c.z-s.x*s.y*s.z, c.z*s.x + c.x*s.y*s.z, 0.0);
    vec4 v3 = vec4(s.y, -c.y*s.x, c.x*c.y, 0.0);
    return mat4(
        vec4(v1.x, v2.x, v3.x, 0.0),
        vec4(v1.y, v2.y, v3.y, 0.0),
        vec4(v1.z, v2.z, v3.z, 0.0),
        vec4(-trans, 1.0));
}

// Used as shorthand to write things like vec3(1, 0, 1) in the short form, e.yxy.
const vec2 e = vec2(0, 1);

// Fabrices consice, 2D rotation formula.
mat2 r2(float th){ vec2 a = sin(vec2(1.5707963, 0) + th); return mat2(a, -a.y, a.x); }

// The standard vec3 to vec3 hash, commonly attributed to IQ. On a GPU, the "sin" function
// tend to break down with large time values, so any hash function using "sin" probably
// can't be trusted in a product that requires accuracy.
vec3 hash(in vec3 p)
{
    float time = 0.0;

    p = vec3( dot(p,vec3(127.1, 311.7, 74.7)),
              dot(p,vec3(269.5, 183.3, 246.1)),
              dot(p,vec3(113.5, 271.9, 124.6)));

    p = fract(sin(p)*43758.5453123)*2. - 1.;

    mat2  m = r2(time*2.);//in general use 3d rotation
    p.xy = m * p.xy;//rotate gradient vector
    //p.yz = m * p.yz;//rotate gradient vector
    //p.zx = m * p.zx;//rotate gradient vector
    return p;
}

float gradNoise(in vec3 f){

    // Used as shorthand to write things like vec3(1, 0, 1) in the short form, e.yxy.
   const vec2 e = vec2(0, 1);

    // Set up the cubic grid.
    // Integer value - unique to each cube, and used as an ID to generate random vectors for the
    // cube vertiies. Note that vertices shared among the cubes have the save random vectors attributed
    // to them.
    vec3 p = floor(f);
    f -= p; // Fractional position within the cube.


    // Smoothing - for smooth interpolation. Use the last line see the difference.
    //vec3 w = f*f*f*(f*(f*6.-15.)+10.); // Quintic smoothing. Slower and more squarish, but derivatives are smooth too.
    vec3 w = f*f*(3. - 2.*f); // Cubic smoothing.
    //vec3 w = f*f*f; w = ( 7. + (w - 7. ) * f ) * w;
// Super smooth, but less practical.
    //vec3 w = .5 - .5*cos(f*3.14159); // Cosinusoidal smoothing.
    //vec3 w = f; // No smoothing. Gives a blocky appearance.

    // Smoothly interpolating between the eight verticies of the cube. Due to the shared verticies between
    // cubes, the result is blending of random values throughout the 3D space.
    float c = mix(mix(mix(dot(hash(p + e.xxx), f - e.xxx), dot(hash(p + e.yxx), f - e.yxx), w.x),
                      mix(dot(hash(p + e.xyx), f - e.xyx), dot(hash(p + e.yyx), f - e.yyx), w.x), w.y),
                  mix(mix(dot(hash(p + e.xxy), f - e.xxy), dot(hash(p + e.yxy), f - e.yxy), w.x),
                      mix(dot(hash(p + e.xyy), f - e.xyy), dot(hash(p + e.yyy), f - e.yyy), w.x), w.y), w.z);

    // Taking the final result, and putting it into the zero to one range.
    return c*.5 + .5; // Range: [0, 1].
}
// Combining noise layers. Referred to as fractal Brownian motion, turbulence, etc.
float gradTurbulence(in vec3 p){

    // Three control factors. Lacunarity and gain are set to common defaults.
    const int layers = 5; //Noise layers. Also called octaves.
    const float lacunarity = 2.; // Frequency change factor. Controls the gaps.
    const float gain = .5; // Amplitue change factor. Controls granularity.

    float res = 0.; // Final result.
    float amp = 1.; // Initial amplitude.
    float tot = 0.; // Total amplitude. Used to normalize the final value.

    // Adding the layers of noise with varying frequencies and amplitudes.
    for(int i=0; i<layers; i++){

        res += gradNoise(p)*amp;  // Add noise layers at various amplitudes.
        p *= lacunarity; // Change the layer frequency.
        tot += amp; // Add the amplitude.
        amp *= gain; // Change the amplitude.

    }

    return res/tot; // Normalize and return. Range [0, 1]
}

#define MAX_MATERIALS 3
uniform MaterialInfo uMaterials[MAX_MATERIALS];

#define MAX_LIGHTS 1
uniform Light uLights[MAX_LIGHTS];






#define SAMPLES 1
#define MAXDEPTH 4

#define PI 3.14159265359
#define TWO_PI 6.28318
#define NUM_SPHERES 7

#define WALL_LEFT_ID 1.
#define WALL_RIGHT_ID 2.
#define WALL_FRONT_ID 3.
#define WALL_BACK_ID 4.
#define WALL_TOP_ID 5.
#define WALL_BOTTOM_ID 6.
#define LIGHT_ID 7.
#define SPHERE_ID1 8.
#define SPHERE_ID2 9.

#define LIGHT_TYPE_SPHERE 0
#define LIGHT_TYPE_SUN    1

#define EPSILON 0.0001
#define INFINITY 1000000.

#define RAY_MARCH_STEPS 100

#define MATCHES_ID(id1, id2) (id1 > (id2 - .5)) && (id1 < (id2 + .5))

#define Le vec3(40.)

/* Sun/Directional Light Parameters

SUN_DIRECTION 	- Mean direction
SUN_SOLID_ANGLE - The solid angle sun subtens at eye. higher value will create softer shadows.
sunLe			- Radiance

*/

#define SUN_DIRECTION vec3(1.,1.,1.)
#define SUN_SOLID_ANGLE 6.87E-5
#define sunLe vec3(20000.)

// struct Ray { vec3 o, d; };

struct LightInfo {
    vec3 L;
    vec3 position;
    vec3 direction;
    float radius;
    int type;
    bool enabled;
};

struct Sphere {
	float r;
	vec3 p;
};

struct Plane {
	vec3 p;
	vec4 n;
};

struct RaySampleInfo {
    vec3 origin;
    vec3 direction;
    vec2 imagePlaneUV;
};

Sphere spheres[NUM_SPHERES];
Plane  planes[6];
float seed = 0.;

#define NUM_LIGHTS 2
LightInfo lights[NUM_LIGHTS];

struct SurfaceInteraction {
    float id;
    vec3 incomingRayDir;
    vec3 point;
    vec3 normal;
    float objId;
};

#define INIT_SURFACE_INFO(incomingRayDir) SurfaceInteraction(-1. /* id */, incomingRayDir /* incomingRayDir */, vec3(0.) /* point */, vec3(0.) /* normal */, -10.)

///////////////////////////////////////////////////////////////////////
//////////////////////// Utility Functions ///////////////////////////
///////////////////////////////////////////////////////////////////////

vec3 linearToGamma(const in vec3 linearColor) {
   return pow(linearColor, vec3(0.4545));
}

vec3 gammaToLinear(const in vec3 gammaColor) {
   return pow(gammaColor, vec3(2.2));
}

#define HASHSCALE3 vec3(.1031, .1030, .0973)
vec2 hash21(float p) {
    vec3 p3 = fract(vec3(p) * HASHSCALE3);
    p3 += dot(p3, p3.yzx + 19.19);
    return fract(vec2((p3.x + p3.y)*p3.z, (p3.x+p3.z)*p3.y));
}

#define HASHSCALE1 .1031
float hash12(vec2 p) {
    vec3 p3  = fract(vec3(p.xyx) * HASHSCALE1);
    p3 += dot(p3, p3.yzx + 19.19);
    return fract((p3.x + p3.y) * p3.z);
}

float random() {
   return fract(sin(seed++)*43758.5453123);
}

float distanceSq(vec3 v1, vec3 v2) {
    vec3 d = v1 - v2;
    return dot(d, d);
}

float sqr(float x) {
    return x*x;
}

void CoordinateSystem(vec3 normal, out vec3 tangent, out vec3 binormal){
    if (abs(normal.x) > abs(normal.y)) {
        tangent = normalize(vec3(-normal.z, 0., normal.x));
    }
    else {
        tangent = normalize(vec3(0., normal.z, -normal.y));
    }

    binormal = cross(normal, tangent);
}

vec3 sphericalDirection(float sinTheta, float cosTheta, float sinPhi, float cosPhi) {
    return vec3(sinTheta * cosPhi, sinTheta * sinPhi, cosTheta);
}

vec3 uniform_sample_cone(vec2 u12, float cosThetaMax, vec3 xbasis, vec3 ybasis, vec3 zbasis) {
    float cosTheta = (1. - u12.x) + u12.x * cosThetaMax;
    float sinTheta = sqrt(1. - cosTheta * cosTheta);
    float phi = u12.y * TWO_PI;
    vec3 samplev = sphericalDirection(sinTheta, cosTheta, sin(phi), cos(phi));
    return samplev.x * xbasis + samplev.y * ybasis + samplev.z * zbasis;
}

bool sameHemiSphere(const in vec3 wo, const in vec3 wi, const in vec3 normal) {
    return dot(wo, normal) * dot(wi, normal) > 0.0;
}

vec2 concentricSampleDisk(const in vec2 u) {
    vec2 uOffset = 2. * u - vec2(1., 1.);

    if (uOffset.x == 0. && uOffset.y == 0.) return vec2(0., 0.);

    float theta, r;
    if (abs(uOffset.x) > abs(uOffset.y)) {
        r = uOffset.x;
        theta = PI/4. * (uOffset.y / uOffset.x);
    } else {
        r = uOffset.y;
        theta = PI/2. - PI/4. * (uOffset.x / uOffset.y);
    }
    return r * vec2(cos(theta), sin(theta));
}

vec3 cosineSampleHemisphere(const in vec2 u) {
    vec2 d = concentricSampleDisk(u);
    float z = sqrt(max(0., 1. - d.x * d.x - d.y * d.y));
    return vec3(d.x, d.y, z);
}

vec3 uniformSampleHemisphere(const in vec2 u) {
    float z = u[0];
    float r = sqrt(max(0., 1. - z * z));
    float phi = 2. * PI * u[1];
    return vec3(r * cos(phi), r * sin(phi), z);
}
///////////////////////////////////////////////////////////////////////
///////////// DISTANCE FIELDS AND RAY MARCHING ////////////////////////
///////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////
///////////////////////  PDF's and BRDF's  ////////////////////////////
///////////////////////////////////////////////////////////////////////

float schlickWeight(float cosTheta) {
    float m = clamp(1. - cosTheta, 0., 1.);
    return (m * m) * (m * m) * m;
}

float GTR1(float NdotH, float a) {
    if (a >= 1.) return 1./PI;
    float a2 = a*a;
    float t = 1. + (a2-1.)*NdotH*NdotH;
    return (a2-1.) / (PI*log(a2)*t);
}

float GTR2(float NdotH, float a) {
    float a2 = a*a;
    float t = 1. + (a2-1.)*NdotH*NdotH;
    return a2 / (PI * t*t);
}

float GTR2_aniso(float NdotH, float HdotX, float HdotY, float ax, float ay) {
    return 1. / (PI * ax*ay * sqr( sqr(HdotX/ax) + sqr(HdotY/ay) + NdotH*NdotH ));
}

float smithG_GGX(float NdotV, float alphaG) {
    float a = alphaG*alphaG;
    float b = NdotV*NdotV;
    return 1. / (NdotV + sqrt(a + b - a*b));
}

float smithG_GGX_aniso(float NdotV, float VdotX, float VdotY, float ax, float ay) {
    return 1. / (NdotV + sqrt( sqr(VdotX*ax) + sqr(VdotY*ay) + sqr(NdotV) ));
}

float pdfLambertianReflection(const in vec3 wi, const in vec3 wo, const in vec3 normal) {
    return sameHemiSphere(wo, wi, normal) ? abs(dot(normal, wi))/PI : 0.;
}

float pdfMicrofacet(const in vec3 wi, const in vec3 wo, const in SurfaceInteraction interaction, const in MaterialInfo material) {
    if (!sameHemiSphere(wo, wi, interaction.normal)) return 0.;
    vec3 wh = normalize(wo + wi);

    float NdotH = dot(interaction.normal, wh);
    float alpha2 = material.roughness * material.roughness;
    alpha2 *= alpha2;

    float cos2Theta = NdotH * NdotH;
    float denom = cos2Theta * ( alpha2 - 1.) + 1.;
    //if( denom == 0. ) return 0.;
    float pdfDistribution = alpha2 * NdotH /(PI * denom * denom);
    return pdfDistribution/(4. * dot(wo, wh));
}

float pdfClearCoat(const in vec3 wi, const in vec3 wo, const in SurfaceInteraction interaction, const in MaterialInfo material) {
    if (!sameHemiSphere(wo, wi, interaction.normal)) return 0.;

    vec3 wh = wi + wo;
    wh = normalize(wh);

    float Dr = GTR1(abs(dot(wh, interaction.normal)), material.roughness);
    return Dr / (4. * dot(wo, wh));
}

vec3 disneyDiffuse(const in float NdotL, const in float NdotV, const in float LdotH, const in MaterialInfo material) {

    float FL = schlickWeight(NdotL), FV = schlickWeight(NdotV);

    float Fd90 = 0.5 + 2. * LdotH*LdotH * material.roughness;
    float Fd = mix(1.0, Fd90, FL) * mix(1.0, Fd90, FV);

    return (1./PI) * Fd * material.baseColor;
}

vec3 disneySubsurface(const in float NdotL, const in float NdotV, const in float LdotH, const in MaterialInfo material) {

    float FL = schlickWeight(NdotL), FV = schlickWeight(NdotV);


    float Fss90 = LdotH*LdotH*material.roughness;
    float Fss = mix(1.0, Fss90, FL) * mix(1.0, Fss90, FV);
    float ss = 1.25 * (Fss * (1. / (NdotL + NdotV) - .5) + .5);

    return (1./PI) * ss * material.baseColor;
}

vec3 disneyMicrofacetIsotropic(float NdotL, float NdotV, float NdotH, float LdotH, const in MaterialInfo material) {

    float Cdlum = .3*material.baseColor.r + .6*material.baseColor.g + .1*material.baseColor.b; // luminance approx.

    vec3 Ctint = Cdlum > 0. ? material.baseColor/Cdlum : vec3(1.); // normalize lum. to isolate hue+sat
    vec3 Cspec0 = mix(material.specular *.08 * mix(vec3(1.), Ctint, material.specularTint), material.baseColor, material.metallic);

    float a = max(.001, sqr(material.roughness));
    float Ds = GTR2(NdotH, a);
    float FH = schlickWeight(LdotH);
    vec3 Fs = mix(Cspec0, vec3(1), FH);
    float Gs;
    Gs  = smithG_GGX(NdotL, a);
    Gs *= smithG_GGX(NdotV, a);

    return Gs*Fs*Ds;
}

vec3 disneyMicrofacetAnisotropic(float NdotL, float NdotV, float NdotH, float LdotH, const in MaterialInfo material,
                                 const in vec3 L, const in vec3 V,
                                 const in vec3 H, const in vec3 X, const in vec3 Y) {

    float Cdlum = .3*material.baseColor.r + .6*material.baseColor.g + .1*material.baseColor.b; // luminance approx.

    vec3 Ctint = Cdlum > 0. ? material.baseColor/Cdlum : vec3(1.); // normalize lum. to isolate hue+sat
    vec3 Cspec0 = mix(material.specular *.08 * mix(vec3(1.), Ctint, material.specularTint), material.baseColor, material.metallic);

    float aspect = sqrt(1.-material.anisotropic*.9);
    float ax = max(.001, sqr(material.roughness)/aspect);
    float ay = max(.001, sqr(material.roughness)*aspect);
    float Ds = GTR2_aniso(NdotH, dot(H, X), dot(H, Y), ax, ay);
    float FH = schlickWeight(LdotH);
    vec3 Fs = mix(Cspec0, vec3(1), FH);
    float Gs;
    Gs  = smithG_GGX_aniso(NdotL, dot(L, X), dot(L, Y), ax, ay);
    Gs *= smithG_GGX_aniso(NdotV, dot(V, X), dot(V, Y), ax, ay);

    return Gs*Fs*Ds;
}

float disneyClearCoat(float NdotL, float NdotV, float NdotH, float LdotH, const in MaterialInfo material) {
    // clearcoat (ior = 1.5 -> F0 = 0.04)
    float Dr = GTR1(NdotH, mix(.1,.001,material.clearcoatGloss));
    float FH = schlickWeight(LdotH);
    float Fr = mix(.04, 1.0, FH);
    float Gr = smithG_GGX(NdotL, .25) * smithG_GGX(NdotV, .25);
    return .25 * material.clearcoat*Gr*Fr*Dr;
}

vec3 disneySheen(float LdotH, const in MaterialInfo material) {
    float FH = schlickWeight(LdotH);
    float Cdlum = .3*material.baseColor.r + .6*material.baseColor.g  + .1*material.baseColor.b; // luminance approx.

    vec3 Ctint = Cdlum > 0. ? material.baseColor/Cdlum : vec3(1.); // normalize lum. to isolate hue+sat
    vec3 Csheen = mix(vec3(1.), Ctint, material.sheenTint);
    vec3 Fsheen = FH * material.sheen * Csheen;
    return FH * material.sheen * Csheen;
}


vec3 lightSample( const in LightInfo light, const in SurfaceInteraction interaction, out vec3 wi, out float lightPdf, float seed ) {
    vec2 u = vec2(random(), random());

    vec3 tangent = vec3(0.), binormal = vec3(0.);
    vec3 ldir = normalize(light.position - interaction.point);
    CoordinateSystem(ldir, tangent, binormal);

    float sinThetaMax2 = light.radius * light.radius / distanceSq(light.position, interaction.point);
    float cosThetaMax = sqrt(max(0., 1. - sinThetaMax2));
    wi = uniform_sample_cone(u, cosThetaMax, tangent, binormal, ldir);

    if (dot(wi, interaction.normal) > 0.) {
        lightPdf = 1. / (TWO_PI * (1. - cosThetaMax));
    }

	return light.L;
}

vec3 sampleSun(const in LightInfo light, const in SurfaceInteraction interaction, out vec3 wi, out float lightPdf, float seed) {
    vec2 u = vec2(random(), random());

    vec3 tangent = vec3(0.), binormal = vec3(0.);
    vec3 ldir = light.direction;
    CoordinateSystem(ldir, tangent, binormal);

    float cosThetaMax = 1. - SUN_SOLID_ANGLE/TWO_PI;
    wi = uniform_sample_cone(u, cosThetaMax, tangent, binormal, ldir);

    if (dot(wi, interaction.normal) > 0.) {
        lightPdf = 1. / SUN_SOLID_ANGLE;
    }

	return light.L;
}

vec3 lightLe( vec4 light, const in SurfaceInteraction interaction, out float lightPdf ) {
	return Le;
}

float lightPdf(const in vec4 light, const in SurfaceInteraction interaction) {
	float sinThetaMax2 = light.w * light.w / distanceSq(light.xyz, interaction.point);
    float cosThetaMax = sqrt(max(0., 1. - sinThetaMax2));
    return 1. / (TWO_PI * (1. - cosThetaMax));
}

vec3 bsdfEvaluate(const in vec3 wi, const in vec3 wo, const in SurfaceInteraction interaction, const in MaterialInfo material) {
    if( !sameHemiSphere(wo, wi, interaction.normal) )
        return vec3(0.);

	float NdotL = dot(interaction.normal, wo);
    float NdotV = dot(interaction.normal, wi);

    if (NdotL < 0. || NdotV < 0.) return vec3(0.);

    vec3 H = normalize(wo+wi);
    float NdotH = dot(interaction.normal,H);
    float LdotH = dot(wo,H);

    vec3 diffuse = disneyDiffuse(NdotL, NdotV, LdotH, material);
    vec3 subSurface = disneySubsurface(NdotL, NdotV, LdotH, material);
    vec3 glossy = disneyMicrofacetIsotropic(NdotL, NdotV, NdotH, LdotH, material);
    float clearCoat = disneyClearCoat(NdotL, NdotV, NdotH, LdotH, material);
    vec3 sheen = disneySheen(LdotH, material);

    return ( mix(diffuse, subSurface, material.subsurface) + sheen * 0. ) * (1. - material.metallic) + glossy + clearCoat * 0.;
}

#define cosineSample \
	vec3 wiLocal = cosineSampleHemisphere(u); \
	vec3 tangent = vec3(0.), binormal = vec3(0.);\
	CoordinateSystem(normal, tangent, binormal);\
	wi = wiLocal.x * tangent + wiLocal.y * binormal + wiLocal.z * normal;\
    if (dot(wo, normal) < 0.) wi.z *= -1.;\
    float NdotL = dot(normal, wo);\
    float NdotV = dot(normal, wi);\
    if (NdotL < 0. || NdotV < 0.) {\
       pdf = 0.;\
       return vec3(0.);\
    }\

vec3 disneyDiffuseSample(out vec3 wi, const in vec3 wo, out float pdf, const in vec2 u, const in vec3 normal, const in MaterialInfo material) {

    cosineSample

    vec3 H = normalize(wo+wi);
    float LdotH = dot(wo,H);

    pdf = pdfLambertianReflection(wi, wo, normal);
    return disneyDiffuse(NdotL, NdotV, LdotH, material) * (1. - material.subsurface);
}

vec3 disneySubSurfaceSample(out vec3 wi, const in vec3 wo, out float pdf, const in vec2 u, const in vec3 normal, const in MaterialInfo material) {

    cosineSample

    vec3 H = normalize(wo+wi);
    float NdotH = dot(normal,H);

    pdf = pdfLambertianReflection(wi, wo, normal);
    return disneySubsurface(NdotL, NdotV, NdotH, material) * material.subsurface;
}

vec3 disneySheenSample(out vec3 wi, const in vec3 wo, out float pdf, const in vec2 u, const in vec3 normal, const in MaterialInfo material) {

    cosineSample

    vec3 H = normalize(wo+wi);
    float LdotH = dot(wo,H);

    pdf = pdfLambertianReflection(wi, wo, normal);
    return disneySheen(LdotH, material);
}

vec3 disneyMicrofacetSample(out vec3 wi, const in vec3 wo, out float pdf, const in vec2 u, const in SurfaceInteraction interaction, const in MaterialInfo material) {
    float cosTheta = 0., phi = (2. * PI) * u[1];
    float alpha = material.roughness * material.roughness;
    float tanTheta2 = alpha * alpha * u[0] / (1.0 - u[0]);
    cosTheta = 1. / sqrt(1. + tanTheta2);

    float sinTheta = sqrt(max(0., 1. - cosTheta * cosTheta));
    vec3 whLocal = sphericalDirection(sinTheta, cosTheta, sin(phi), cos(phi));

    vec3 tangent = vec3(0.), binormal = vec3(0.);
    CoordinateSystem(interaction.normal, tangent, binormal);

    vec3 wh = whLocal.x * tangent + whLocal.y * binormal + whLocal.z * interaction.normal;

    if(!sameHemiSphere(wo, wh, interaction.normal)) {
       wh *= -1.;
    }

    wi = reflect(-wo, wh);

    float NdotL = dot(interaction.normal, wo);
    float NdotV = dot(interaction.normal, wi);

    if (NdotL < 0. || NdotV < 0.) {
        pdf = 0.; // If not set to 0 here, create's artifacts. WHY EVEN IF SET OUTSIDE??
        return vec3(0.);
    }

    vec3 H = normalize(wo+wi);
    float NdotH = dot(interaction.normal,H);
    float LdotH = dot(wo,H);

    pdf = pdfMicrofacet(wi, wo, interaction, material);
    return disneyMicrofacetIsotropic(NdotL, NdotV, NdotH, LdotH, material);
}

vec3 disneyClearCoatSample(out vec3 wi, const in vec3 wo, out float pdf, const in vec2 u, const in vec3 normal, const in MaterialInfo material) {
    // TODO:: Implement!!
    return vec3(0.);
}

float bsdfPdf(const in vec3 wi, const in vec3 wo, const in SurfaceInteraction interaction, const in MaterialInfo material) {
    // Pdf's for Sheen, Subsurface and Diffuse are same
    float pdfDiffuse = pdfLambertianReflection(wi, wo, interaction.normal);
    float pdfMicrofacet = pdfMicrofacet(wi, wo, interaction, material);
    float pdfClearCoat = pdfClearCoat(wi, wo, interaction, material);;
	//return (pdfDiffuse * 3. + pdfMicrofacet + pdfClearCoat)/5.;
    return (pdfDiffuse * 1. + pdfMicrofacet)/2.;
}

// TODO:: Check this function carefully
vec3 bsdfSample(out vec3 wi, const in vec3 wo, out float pdf, const in SurfaceInteraction interaction, const in MaterialInfo material) {

    vec3 f = vec3(0.);
    pdf = 0.0;

    vec2 u = vec2(random(), random());
	if( random() < 0.5 ) {
       f = disneyDiffuseSample(wi, wo, pdf, u, interaction.normal, material);
    }
    else {
       f = disneyMicrofacetSample(wi, wo, pdf, u, interaction, material);
    }

    f = bsdfEvaluate(wi, wo, interaction, material);
    //pdf = bsdfPdf(wi, wo, interaction, material);
    if( pdf == 0.)
        return vec3(0.);
	return f;
}

vec3 sampleLightType( const in LightInfo light, const in SurfaceInteraction interaction, out vec3 wi, out float lightPdf, out float visibility, float seed) {
    if( !light.enabled )
        return vec3(0.);

    if( light.type == LIGHT_TYPE_SPHERE ) {
        vec3 L = lightSample(light, interaction, wi, lightPdf, seed);
        // visibility = visibilityTest(interaction.point + wi * .01, wi);
        return L;
    }
    else if( light.type == LIGHT_TYPE_SUN ) {
        vec3 L = sampleSun(light, interaction, wi, lightPdf, seed);
        // visibility = visibilityTestSun(interaction.point + wi * .01, wi);
        return L;
    }
    else {
        return vec3(0.);
    }
}

vec3 estimateDirectLight(const in LightInfo light, const in SurfaceInteraction interaction, const in MaterialInfo material) {
	// Sample light source with multiple importance sampling
    vec3 wi;
    vec3 wo = -interaction.incomingRayDir;
    vec3 Ld = vec3(0.);
    float lightPdf = 0., scatteringPdf = 0., visibility = 0.;

    vec3 Li = sampleLightType( light, interaction, wi, lightPdf, visibility, seed );
    Li *= visibility;

    bool isBlack = dot(Li, Li) == 0.;

    if (lightPdf > 0. && !isBlack ) {
        vec3 f = bsdfEvaluate(wi, wo, interaction, material) * abs(dot(wi, interaction.normal));
        scatteringPdf = bsdfPdf(wi, wo, interaction, material);

		isBlack = dot(f, f) == 0.;
        if (!isBlack) {
           float weight = 1.;//powerHeuristic(1., lightPdf, 1., scatteringPdf);
           Ld += f * Li * weight / lightPdf;
        }
    }

    // Sample BSDF with multiple importance sampling
    /*vec3 f;
    bool sampledSpecular = false;
    // Sample scattered direction for surface interactions
    BxDFType sampledType;
    f = bsdfSample(isect.wo, wi, uScattering, &scatteringPdf, bsdfFlags, &sampledType);
    f *= abs(dot(wi, isect.shading.n);
	bool isBlack = dot(Li, Li) == 0.;
    sampledSpecular = (sampledType & BSDF_SPECULAR) != 0;

    if (!isBlack && scatteringPdf > 0) {
    // Account for light contributions along sampled direction _wi_
    	float weight = 1.;
    	if (!sampledSpecular) {
            lightPdf = light.Pdf_Li(it, wi);
            if (lightPdf == 0) return Ld;
            weight = PowerHeuristic(1, scatteringPdf, 1, lightPdf);
        }

        SurfaceInteraction interaction;
        bool foundSurfaceInteraction = false;
        // Add light contribution from material sampling
        vec3 Li(0.f);
        if (foundSurfaceInteraction) {
            if (lightIsect.primitive->GetAreaLight() == &light)
                Li = lightIsect.Le(-wi);
        } else
            Li = light.Le(ray);
        if (!Li.IsBlack()) Ld += f * Li * Tr * weight / scatteringPdf;
    }*/
    return Ld;
}


#define STOP_CODE -100000.0

uniform sampler2D uRO, uRD;
uniform sampler2D uHit, uNormal;

layout(location=0) out vec4 ro;
layout(location=1) out vec4 rd;

void getColor( inout Ray ray )
{
    MaterialInfo material;

    // vec3 hit = hitScene( ray.origin, ray.dir, material, normal );
    vec3 hit = textureLod( uHit, vTexCoord, 0.0 ).xyz;
    vec3 normal = textureLod( uNormal, vTexCoord, 0.0 ).xyz;

    if ( hit.y >= 0.0 && hit.z < 10000.0 )
        material = uMaterials[int(hit.y)];

    if ( hit.y >= 0.0 )
    {
        vec3 hitOrigin = ray.origin + ray.dir * hit.x;

        

        if ( material.type == 0 )
        {
            // Disney

            SurfaceInteraction interaction;
            interaction.point = hitOrigin;
            interaction.incomingRayDir = ray.dir;
            interaction.normal = normal;

            vec3 wo = -interaction.incomingRayDir, wi;
            float pdf = 0.;

            vec3 f = bsdfSample( wi, wo, pdf, interaction, material );
            ray = Ray( interaction.point/* + 1. * wi*/, wi );
        } else
        if ( material.type == 2 )
        {
            // --- Light
            ray = Ray( vec3( -100000 ), vec3( -100000 ) );
        }
    } else ray = Ray( vec3( -100000 ), vec3( -100000 ) );
}

void main()
{
    //randv2 = fract(cos((vTexCoord.xy+vTexCoord.yx*vec2(1000.0,1000.0))+vec2(uTime)*10.0));
    seed = float( uTime ) + hash12( vTexCoord );

    vec4 inRO = textureLod( uRO, vTexCoord, 0.0 );
    vec4 inRD = textureLod( uRD, vTexCoord, 0.0 );

    Ray ray = Ray( inRO.xyz, inRD.xyz );

    if ( inRO.x != STOP_CODE && inRD.x != STOP_CODE ) {
        getColor( ray );

        ro = vec4( ray.origin, 1. );
        rd = vec4( normalize( ray.dir ), 1. );
    } else {
        ro = inRO;
        rd = inRD;
    }
}
