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
    vec3 gResult1;
    gResult1 = vec3( 1000000, -2, -1 );
   tp=p;
    tp.y = tp.y + -0.7000;
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 9.900, 0.693, 9.900 ), 0.0 ) ) - 0.010, 0, 0 ) );
   tp=p;
    tp.xz = tp.xz + vec2(-5.8329,-9.1131);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 3.480, 0.990, 0.990 ), 0.0 ) ) - 0.010);
   tp=p;
    tp = tp + vec3(-2.9951,-0.3052,-9.3829);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 0.116, 0.567, 0.339 ), 0.0 ) ) - 0.010, 0, 2 ) );
   tp=p;
    tp = tp + vec3(5.4084,-0.6615,-13.9547);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 7.233, 1.864, 7.908 ), 0.0 ) ) - 0.010);
    res=opU( res, gResult1 );
    gResult1 = vec3( 1000000, -2, -1 );
   tp=p;
    tp = tp + vec3(1.8432,-0.9806,-7.3413);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 3.960, 0.198, 1.729 ), 0.0 ) ) - 0.010, 0, 5 ) );
   tp=p;
    tp = tp + vec3(2.2985,-0.5698,-7.7168);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 4.257, 0.198, 1.729 ), 0.0 ) ) - 0.010, 0, 6 ) );
   tp=p;
    tp = tp + vec3(2.6548,-0.1705,-7.1889);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 4.653, 0.198, 2.657 ), 0.0 ) ) - 0.010, 0, 7 ) );
   tp=p;
    tp = tp + vec3(-7.0562,-0.6615,-2.0499);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 2.933, 0.797, 7.908 ), 0.0 ) ) - 0.010);
   tp=p;
    tp = tp + vec3(10.2510,-0.6615,-2.0499);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 2.933, 0.797, 7.908 ), 0.0 ) ) - 0.010);
    res=opU( res, gResult1 );
    gResult1 = vec3( 1000000, -2, -1 );
   tp=p;
    tp = tp + vec3(6.9955,-3.3000,-3.7075);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 1.939, 2.475, 0.148 ), 0.0 ) ) - 0.010, 0, 11 ) );
   tp=p;
    tp = tp + vec3(7.1909,-3.2000,-3.7807);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 1.188, 1.584, 0.495 ), 0.0 ) ) - 0.010);
   tp=p;
    tp = tp + vec3(-3.8335,-3.3000,-3.7075);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 5.138, 2.475, 0.148 ), 0.0 ) ) - 0.010, 0, 13 ) );
   tp=p;
    tp = tp + vec3(-5.9189,-3.2000,-3.7807);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 2.376, 2.079, 0.495 ), 0.0 ) ) - 0.010);
   tp=p;
    tp.xz = tp.zx * vec2(1.0000,-1.0000);
    tp = tp + vec3(1.4252,-3.3000,-8.8139);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 4.950, 2.475, 0.148 ), 0.0 ) ) - 0.010, 0, 15 ) );
   tp=p;
    tp.xz = tp.zx * vec2(1.0000,-1.0000);
    tp = tp + vec3(1.4252,-3.3000,8.8163);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 4.950, 2.475, 0.148 ), 0.0 ) ) - 0.010, 0, 16 ) );
   tp=p;
    tp = tp + vec3(5.2596,-5.0000,-0.7289);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 0.148, 4.950, 3.960 ), 0.0 ) ) - 0.010, 0, 17 ) );
   tp=p;
    tp.xz = tp.zx * vec2(1.0000,-1.0000);
    tp = tp + vec3(-2.2887,-7.8380,-4.8469);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 0.990, 1.188, 0.990 ), 0.0 ) ) - 0.010);
   tp=p;
    tp = tp + vec3(3.4117,-5.0000,-4.8422);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 1.980, 4.950, 0.148 ), 0.0 ) ) - 0.010, 0, 19 ) );
   tp=p;
    tp = tp + vec3(4.2562,-7.8380,-4.4534);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 0.990, 1.584, 0.990 ), 0.0 ) ) - 0.010);
   tp=p;
    tp = tp + vec3(2.4907,-7.8383,-5.0876);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 0.495, 1.584, 0.990 ), 0.0 ) ) - 0.010);
   tp=p;
    tp = tp + vec3(4.2562,-3.2000,-4.4534);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 0.990, 1.584, 0.990 ), 0.0 ) ) - 0.010);
   tp=p;
    tp = tp + vec3(2.4907,-3.2000,-5.0876);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 0.495, 1.584, 0.990 ), 0.0 ) ) - 0.010);
   tp=p;
    tp = tp + vec3(0.9224,-5.2000,-4.1389);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 0.838, 5.148, 1.660 ), 0.0 ) ) - 0.010, 0, 24 ) );
   tp=p;
    tp.yz = tp.yz + vec2(-5.2000,0.2454);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 9.405, 5.148, 0.198 ), 0.0 ) ) - 0.010, 0, 25 ) );
   tp=p;
    tp = tp + vec3(9.3180,-5.2000,3.5272);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 0.198, 5.148, 3.255 ), 0.0 ) ) - 0.010, 0, 26 ) );
   tp=p;
    tp = tp + vec3(-9.3180,-5.2000,3.5272);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 0.198, 5.148, 3.255 ), 0.0 ) ) - 0.010, 0, 27 ) );
   tp=p;
    tp.yz = tp.yz + vec2(-5.2000,6.6260);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 9.405, 5.148, 0.198 ), 0.0 ) ) - 0.010, 0, 28 ) );
   tp=p;
    tp.yz = tp.yz + vec2(-10.4889,3.3101);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 9.405, 0.099, 3.255 ), 0.0 ) ) - 0.010, 0, 29 ) );
   tp=p;
    tp = tp + vec3(7.4331,-7.8380,0.0819);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 0.990, 1.188, 0.990 ), 0.0 ) ) - 0.010);
   tp=p;
    tp = tp + vec3(-1.0780,-7.8380,0.0819);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 0.990, 1.188, 0.990 ), 0.0 ) ) - 0.010);
   tp=p;
    tp = tp + vec3(-4.5929,-7.8380,0.0819);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 0.990, 1.188, 0.990 ), 0.0 ) ) - 0.010);
   tp=p;
    tp = tp + vec3(-8.0199,-7.8380,0.0819);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 0.990, 1.188, 0.990 ), 0.0 ) ) - 0.010);
    res=opU( res, gResult1 );
    gResult1 = vec3( 1000000, -2, -1 );
   tp=p;
    tp = tp + vec3(-4.9243,-5.9269,-4.1547);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 4.950, 0.297, 4.415 ), 0.0 ) ) - 0.010, 0, 35 ) );
   tp=p;
    tp = tp + vec3(-3.0304,-3.3000,-6.6025);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 0.402, 2.475, 0.653 ), 0.0 ) ) - 0.010, 0, 36 ) );
   tp=p;
    tp = tp + vec3(-8.5374,-3.2000,-6.6025);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 0.402, 2.475, 0.653 ), 0.0 ) ) - 0.010, 0, 37 ) );
    res=opU( res, gResult1 );
    gResult1 = vec3( 1000000, -2, -1 );
   tp=p;
    tp = tp + vec3(3.4808,-9.7717,-1.1778);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 2.383, 0.297, 4.415 ), 0.0 ) ) - 0.010, 0, 39 ) );
   tp=p;
    tp = tp + vec3(7.3254,-5.9269,0.0587);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 2.123, 0.297, 4.415 ), 0.0 ) ) - 0.010, 0, 40 ) );
    res=opU( res, gResult1 );
    gResult1 = vec3( 1000000, -2, -1 );
   tp=p;
    tp = tp + vec3(4.2554,-3.1945,-4.6764);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 0.990, 1.584, 0.198 ), 0.0 ) ) - 0.010, 0, 42 ) );
   tp=p;
    tp = tp + vec3(4.2554,-3.1945,-4.6764);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 0.792, 1.386, 0.495 ), 0.0 ) ) - 0.010);
   tp=p;
    tp = tp + vec3(4.2554,-3.1945,-4.5435);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 0.792, 1.485, 0.148 ), 0.0 ) ) - 0.010, 0, 44 ) );
    res=opU( res, gResult1 );
    gResult1 = vec3( 1000000, -2, -1 );
   tp=p;
    tp = tp + vec3(4.2554,-7.8383,-4.6764);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 0.990, 1.584, 0.198 ), 0.0 ) ) - 0.010, 0, 46 ) );
   tp=p;
    tp = tp + vec3(4.2554,-7.8383,-4.6764);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 0.792, 1.386, 0.495 ), 0.0 ) ) - 0.010);
   tp=p;
    tp = tp + vec3(4.2554,-7.8383,-4.5435);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 0.792, 1.485, 0.148 ), 0.0 ) ) - 0.010, 0, 48 ) );
    res=opU( res, gResult1 );
    gResult1 = vec3( 1000000, -2, -1 );
   tp=p;
    tp = tp + vec3(7.1997,-3.1945,-3.5424);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 1.485, 1.584, 0.198 ), 0.0 ) ) - 0.010, 0, 50 ) );
   tp=p;
    tp = tp + vec3(7.1997,-3.1945,-3.5424);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 0.990, 1.386, 0.495 ), 0.0 ) ) - 0.010);
   tp=p;
    tp = tp + vec3(7.1997,-3.1945,-3.4095);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 0.990, 1.485, 0.148 ), 0.0 ) ) - 0.010, 0, 52 ) );
    res=opU( res, gResult1 );
    gResult1 = vec3( 1000000, -2, -1 );
   tp=p;
    tp = tp + vec3(-4.6197,-7.8622,0.3196);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 0.990, 1.188, 0.198 ), 0.0 ) ) - 0.010, 0, 54 ) );
   tp=p;
    tp = tp + vec3(-4.6197,-7.8622,0.3196);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 0.792, 0.990, 0.495 ), 0.0 ) ) - 0.010);
   tp=p;
    tp = tp + vec3(-4.6197,-7.8291,0.4525);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 0.792, 0.990, 0.148 ), 0.0 ) ) - 0.010, 0, 56 ) );
    res=opU( res, gResult1 );
    gResult1 = vec3( 1000000, -2, -1 );
   tp=p;
    tp = tp + vec3(-1.1052,-7.8622,0.3196);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 0.990, 1.188, 0.198 ), 0.0 ) ) - 0.010, 0, 58 ) );
   tp=p;
    tp = tp + vec3(-1.1052,-7.8622,0.3196);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 0.792, 0.990, 0.495 ), 0.0 ) ) - 0.010);
   tp=p;
    tp = tp + vec3(-1.1052,-7.8291,0.4525);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 0.792, 0.990, 0.148 ), 0.0 ) ) - 0.010, 0, 60 ) );
    res=opU( res, gResult1 );
    gResult1 = vec3( 1000000, -2, -1 );
   tp=p;
    tp = tp + vec3(-8.0062,-7.8622,0.3196);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 0.990, 1.188, 0.198 ), 0.0 ) ) - 0.010, 0, 62 ) );
   tp=p;
    tp = tp + vec3(-8.0062,-7.8622,0.3196);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 0.792, 0.990, 0.495 ), 0.0 ) ) - 0.010);
   tp=p;
    tp = tp + vec3(-8.0062,-7.8291,0.4525);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 0.792, 0.990, 0.148 ), 0.0 ) ) - 0.010, 0, 64 ) );
    res=opU( res, gResult1 );
    gResult1 = vec3( 1000000, -2, -1 );
   tp=p;
    tp = tp + vec3(2.4845,-3.1945,-4.6764);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 0.594, 1.584, 0.198 ), 0.0 ) ) - 0.010, 0, 66 ) );
   tp=p;
    tp = tp + vec3(2.4845,-3.1945,-4.6764);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 0.297, 1.386, 0.495 ), 0.0 ) ) - 0.010);
   tp=p;
    tp = tp + vec3(2.4845,-3.1945,-4.5435);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 0.297, 1.485, 0.148 ), 0.0 ) ) - 0.010, 0, 68 ) );
    res=opU( res, gResult1 );
    gResult1 = vec3( 1000000, -2, -1 );
   tp=p;
    tp = tp + vec3(2.4845,-7.8538,-4.6764);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 0.594, 1.584, 0.198 ), 0.0 ) ) - 0.010, 0, 70 ) );
   tp=p;
    tp = tp + vec3(2.4845,-7.8538,-4.6764);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 0.297, 1.386, 0.495 ), 0.0 ) ) - 0.010);
   tp=p;
    tp = tp + vec3(2.4845,-7.8538,-4.5435);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 0.297, 1.485, 0.148 ), 0.0 ) ) - 0.010, 0, 72 ) );
    res=opU( res, gResult1 );
    gResult1 = vec3( 1000000, -2, -1 );
   tp=p;
    tp = tp + vec3(7.4230,-7.8622,0.3196);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 0.990, 1.188, 0.198 ), 0.0 ) ) - 0.010, 0, 74 ) );
   tp=p;
    tp = tp + vec3(7.4230,-7.8622,0.3196);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 0.792, 0.990, 0.495 ), 0.0 ) ) - 0.010);
   tp=p;
    tp = tp + vec3(7.4230,-7.8291,0.4525);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 0.792, 0.990, 0.148 ), 0.0 ) ) - 0.010, 0, 76 ) );
    res=opU( res, gResult1 );
    gResult1 = vec3( 1000000, -2, -1 );
   tp=p;
    tp = tp + vec3(-5.9294,-3.3875,-3.5246);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 2.475, 1.980, 0.198 ), 0.0 ) ) - 0.010, 0, 78 ) );
   tp=p;
    tp = tp + vec3(-5.9294,-3.3875,-3.5246);
    gResult1.x=opS( gResult1.x, length( max( abs( tp) - vec3( 2.178, 1.782, 0.495 ), 0.0 ) ) - 0.010);
   tp=p;
    tp = tp + vec3(-5.9294,-3.3875,-3.3917);
    gResult1=opU( gResult1, vec3( length( max( abs( tp) - vec3( 2.178, 1.980, 0.148 ), 0.0 ) ) - 0.010, 0, 80 ) );
    res=opU( res, gResult1 );
   tp=p;
    tp = tp + vec3(-3.9968,-0.3052,-9.3829);
    res=opU( res, vec3( length( max( abs( tp) - vec3( 0.116, 0.567, 0.339 ), 0.0 ) ) - 0.010, 0, 82 ) );
   tp=p;
    tp = tp + vec3(-5.0704,-0.3052,-9.3829);
    res=opU( res, vec3( length( max( abs( tp) - vec3( 0.116, 0.567, 0.339 ), 0.0 ) ) - 0.010, 0, 83 ) );
   tp=p;
    tp = tp + vec3(-6.1014,-0.3052,-9.3829);
    res=opU( res, vec3( length( max( abs( tp) - vec3( 0.116, 0.567, 0.339 ), 0.0 ) ) - 0.010, 0, 84 ) );
   tp=p;
    tp = tp + vec3(-7.1090,-0.3052,-9.3829);
    res=opU( res, vec3( length( max( abs( tp) - vec3( 0.116, 0.567, 0.339 ), 0.0 ) ) - 0.010, 0, 85 ) );
   tp=p;
    tp = tp + vec3(-8.3756,-0.3052,-9.3829);
    res=opU( res, vec3( length( max( abs( tp) - vec3( 0.116, 0.567, 0.339 ), 0.0 ) ) - 0.010, 0, 86 ) );
   tp=p;
    res=opU( res, vec3( tp.y + 0.000, 0, 87 ) );
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
