#version 300 es
precision highp float;

in vec2 vTexCoord;

uniform vec3 uOrigin, uLookAt;
uniform float uFov;
uniform vec2 inResolution;

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


uniform mat4 uInvertLocalTransform;
uniform vec3 uLocalScale;
//uniform vec3 uGizmoTrans;
//uniform vec3 uGizmoRotate;



vec3 map( vec3 p )
{
    vec3 res=vec3( 1000000, -2, -1 ); mat4 mat; vec3 tp, temp;
    return res;
}


uniform sampler2D uRO, uRD, uHit, uNormal;

uniform int uOffset, uStep;
uniform float uTMin, uTMax;
uniform float uStepSize;

layout(location=0) out vec4 outHit;
layout(location=1) out vec4 outNormal;

vec3 calcNormalA(vec3 pos){
    vec3 eps = vec3(.0001,0,0);
    vec3 nor = vec3(
        map(pos+eps.xyy).x - map(pos-eps.xyy).x,
        map(pos+eps.yxy).x - map(pos-eps.yxy).x,
        map(pos+eps.yyx).x - map(pos-eps.yyx).x
    );
    return normalize(nor);
}

const int NORMAL_STEPS = 6;

vec3 calcNormalB(vec3 pos){
    vec3 eps = vec3(.0001,0,0);
    vec3 nor = vec3(0);
    float invert = 1.;
    for (int i = 0; i < NORMAL_STEPS; i++){
        nor += map(pos + eps * invert).x * eps * invert;
        eps = eps.zxy;
        invert *= -1.;
    }
    return normalize(nor);
}

/*
vec3 calc_normal(vec3 p) {

    vec3 epsilon = vec3(0.001, 0., 0.);

    vec3 n = vec3(map(p + epsilon.xyy).x - map(p - epsilon.xyy).x,
                  map(p + epsilon.yxy).x - map(p - epsilon.yxy).x,
                  map(p + epsilon.yyx).x - map(p - epsilon.yyx).x);

    return normalize(n);
}*/

vec3 castRay( in vec3 ro, in vec3 rd, in float tmax, in vec3 res )
{
    float t=res.x, m=res.y, id=res.z;

    for( int i = uOffset; i < (uOffset + uStep); i++ )
    {
        float precis = 0.0001;// * t;

        vec3 res = map( ro+rd*t );
        // <! ABS !>
        // if( t<precis || t>tmax ) break;
        t += res.x * uStepSize;
        if ( res.x <= precis ) {
            m = res.y;
            id = res.z;
            break;
        }
    }

    if( t>tmax ) { m=-1.0; id=-1.0; }
    return vec3( t, m, id );
}

void main()
{
    vec3 inRO = textureLod( uRO, vTexCoord, 0.0 ).xyz;
    vec3 inRD = textureLod( uRD, vTexCoord, 0.0 ).xyz;

    vec3 res, normal = vec3( 0 );

    if ( uOffset == 0 ) res = vec3( uTMin, -1, -1 );
    else {
        res = textureLod( uHit, vTexCoord, 0.0 ).xyz;
        normal = textureLod( uNormal, vTexCoord, 0.0 ).xyz;

        if ( res.y >= 0.0 ) {
            outHit = vec4( res, 1.0 );
            outNormal = vec4( normal, 1.0 );
            return;
        }
    }

    vec3 hit = castRay( inRO, inRD, uTMax, res );
    if ( hit.y >= 0.0 ) {
        normal = calcNormalB( inRO + inRD * hit.x );
    }

    outHit = vec4( hit, 1.0 );
    outNormal = vec4( normal, 1.0 );
}
