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
vec3 map( vec3 p )
{
    vec3 res=vec3( 1000000, -2, -1 ); mat4 mat; vec3 tp, temp;
    res=opU( res, vec3( length( max( abs( p) - vec3( 0.990, 0.990, 0.990 ), 0.0 ) ) - 0.010, 0, 0 ) );
    return res;
}
#define MAX_MATERIALS 1
uniform MaterialInfo uMaterials[MAX_MATERIALS];

#define MAX_LIGHTS 1
uniform Light uLights[MAX_LIGHTS];

vec3 calcNormal( in vec3 pos )
{

    vec2 e = vec2(1.0,-1.0)*0.5773*0.0005;
    return normalize( e.xyy*map( pos + e.xyy ).x +
                      e.yyx*map( pos + e.yyx ).x +
                      e.yxy*map( pos + e.yxy ).x +
                      e.xxx*map( pos + e.xxx ).x );

    // float eps = 0.01; // precission",
    // float gradX = map( pos + vec3(eps, 0.0, 0.0) ).x - map( pos - vec3(eps, 0.0, 0.0) ).x;
    // float gradY = map( pos + vec3(0.0, eps, 0.0) ).x - map( pos - vec3(0.0, eps, 0.0) ).x;
    // float gradZ = map( pos + vec3(0.0, 0.0, eps) ).x - map( pos - vec3(0.0, 0.0, eps) ).x;
    // return normalize( vec3( gradX, gradY, gradZ ) );
}

/*
vec3 calcNormal(vec3 p) {
	vec2 q = vec2(0.0, 0.002);

	float x = map(p + q.yxx).x - map(p - q.yxx).x;
	float y = map(p + q.xyx).x - map(p - q.xyx).x;
	float z = map(p + q.xxy).x - map(p - q.xxy).x;

	return normalize(vec3(x, y, z));
}*/

// --- Cast a ray into the scene

vec3 castRay( in vec3 ro, in vec3 rd, in float tmin, in float tmax )
{
    float t=tmin;
    float m=-1.0, id=-1.0;

    for( int i=0; i<uSteps; i++ )
    {
        float precis = 0.0005 * t;

        vec3 res = map( ro+rd*t );
        
        if( t<precis || t>tmax ) break;
        t += res.x * uStepSize;
        m = res.y;
        id = res.z;
    }

    if( t>tmax ) { m=-1.0; id=-1.0; }
    return vec3( t, m, id );
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
vec3 hitScene( in vec3 ro, in vec3 rd, out MaterialInfo material, out vec3 normal )
{
    float tmin=uTMin, tmax=uTMax;

    vec3 hit = castRay( ro, rd, tmin, tmax );

    if ( hit.y >= 0.0 && hit.z < 10000.0 )
    {
        int matIndex=int( hit.y );
        normal = calcNormal( ro + rd * hit.x );

        material = uMaterials[matIndex];
    }

    return hit;
}

vec3 hitScene2( in vec3 ro, in vec3 rd, out MaterialInfo material )
{
    float tmin=uTMin, tmax=uTMax;
    vec3 hit = castRay( ro, rd, tmin, tmax );

    if ( hit.y >= 0.0 && hit.z < 10000.0 ) {
        int matIndex=int( hit.y );
        material = uMaterials[matIndex];
    }

    return hit;
}
vec4 background( in vec3 ro, in vec3 rd, in vec3 sunDir ) {
vec4 color=vec4(0,0,0,0);
vec4 topColor = vec4( 0.1229, 0.3628, 0.7820, 1.0000 );
vec4 bottomColor = vec4( 1.0000, 1.0000, 1.0000, 1.0000 );
float t = 0.5 * ( rd.y + 1.0 );
vec4 backColor = ( vec4( 1.0 )  - vec4( t )  ) * bottomColor + vec4( t )  * topColor;
color = vec4( backColor.x, backColor.y, backColor.z, 1.0 ) ;

return color;
}// --- Grid

uniform bool uGrid;
uniform float uGridSize;
uniform float uGridDim;

#define GRID_COLOR_1 vec4( 0.35, 0.35, 0.35, 0 )
#define GRID_COLOR_2 vec4( 0.35, 0.35, 0.35, 1.0 )

#define RED_COLOR_1 vec4( 0 )
#define RED_COLOR_2 vec4( 189.0*0.5/255.0, 33.0*0.5/255.0, 33.0*0.5/255.0, 1 )

#define BLUE_COLOR_1 vec4( 0 )
#define BLUE_COLOR_2 vec4( 68.0*0.5/255.0, 69.0*0.5/255.0, 198.0*0.5/255.0, 1 )

#define YELLOW_COLOR_1 vec4( 0 )
#define YELLOW_COLOR_2 vec4( 219.0*0.5/255.0, 217.0*0.5/255.0, 42.0*0.5/255.0, 1 )

#define GRID_LINE_SIZE 1.5

const vec3 L = normalize(vec3(-0.5, 0.5, 0.5));
const vec3 L1 = normalize(vec3(0.5, -0.5, -0.5));

vec4 getColor( in Ray ray )
{
    vec4 color = vec4( 0.0 );

    MaterialInfo material;

    vec3 hit = hitScene2( ray.origin, ray.dir, material );

    float planeD = 1000.0;
    if ( uGrid )
    {
        float denom = dot( ray.dir, vec3( 0, 1, 0 ) );
        if ( denom != 0.0 )
        {
            float t = -( dot( ray.origin, vec3( 0, 1, 0 )  ) ) / denom;

            if ( t >= 0.0 )
            {
                vec3 p = ray.origin + t * ray.dir;

                if ( p.x <= uGridDim && p.x >= -uGridDim && p.z <= uGridDim && p.z >= -uGridDim )
                {
                    vec2 uv = abs(mod(p.xz + uGridSize/2.0, uGridSize) - uGridSize/2.0);

                    uv /= fwidth(p.xz);
                    float gln = min(uv.x, uv.y) / uGridSize;

                    color = mix(GRID_COLOR_1, GRID_COLOR_2, 1.0 - smoothstep(0.0, GRID_LINE_SIZE / uGridSize, gln));

                    if ( p.z > 0.0 && abs( p.x ) < 0.1 ) {

                        vec4 blendColor = mix(BLUE_COLOR_1, BLUE_COLOR_2, 1.0 - smoothstep(0.0, GRID_LINE_SIZE / uGridSize, uv.x / uGridSize ));

                        color.a = 1.0 - (1.0 - blendColor.a) * (1.0 - color.a);
                        color.x = ( blendColor.x ) + (color.x * (1.0 - blendColor.a ) );
                        color.y = ( blendColor.y ) + (color.y * (1.0 - blendColor.a ) );
                        color.z = ( blendColor.z ) + (color.z * (1.0 - blendColor.a ) );
                    }
                    if ( p.x > 0.0 && abs( p.z ) < 0.1 ) {

                        vec4 blendColor = mix(RED_COLOR_1, RED_COLOR_2, 1.0 - smoothstep(0.0, GRID_LINE_SIZE / uGridSize, uv.y / uGridSize ));

                        color.a = 1.0 - (1.0 - blendColor.a) * (1.0 - color.a);
                        color.x = ( blendColor.x ) + (color.x * (1.0 - blendColor.a ) );
                        color.y = ( blendColor.y ) + (color.y * (1.0 - blendColor.a ) );
                        color.z = ( blendColor.z ) + (color.z * (1.0 - blendColor.a ) );
                    }
                    planeD = t;
                }
            }
        }

        denom = dot( ray.dir, vec3( 0, 0, 1 ) );
        if ( denom != 0.0 )
        {
            float t = -( dot( ray.origin, vec3( 0, 0, 1 )  ) ) / denom;

            if ( t >= 0.0 )
            {
                vec3 p = ray.origin + t * ray.dir;

                if ( /*t < planeD &&*/ p.y <= uGridDim && p.y >= 0.0 )
                {
                    vec2 uv = abs(mod(p.xy + uGridSize/2.0, uGridSize) - uGridSize/2.0);

                    uv /= fwidth(p.xy);
                    float gln = min(uv.x, uv.y) / uGridSize;

                    if ( abs( p.x ) < 0.1 )
                    {
                        vec4 blendColor = mix(YELLOW_COLOR_1, YELLOW_COLOR_2, 1.0 - smoothstep(0.0, GRID_LINE_SIZE / uGridSize, uv.x / uGridSize ));

                        color.a = 1.0 - (1.0 - blendColor.a) * (1.0 - color.a);
                        color.x = ( blendColor.x ) + (color.x * (1.0 - blendColor.a ) );
                        color.y = ( blendColor.y ) + (color.y * (1.0 - blendColor.a ) );
                        color.z = ( blendColor.z ) + (color.z * (1.0 - blendColor.a ) );

                        if ( blendColor.a > 0.9 )
                            planeD = t;
                    }
                }
            }
        }
    }

    if ( hit.y >= 0.0 && ( hit.x < planeD || color.a < 0.8 ) )
    {
        if ( hit.z == uSelectedId )
        {
            color = vec4( 0.416, 0.416, 0.78, 1.0 );
        } else
        {
            color = vec4( clamp( pow( material.baseColor, vec3(0.4545) ), 0.0, 1.0 ), 1.0 );
        }
    }

    else { color = background( ray.origin, ray.dir, normalize( uSunDir ) ); color = vec4( clamp( pow( color.xyz, vec3(0.4545) ), 0.0, 1.0 ), color.a ); }

    return color;
}

out vec4 outColor;

void main()
{
    float ratio = inResolution.x / inResolution.y;
    vec2 pixelSize = vec2(1.0) / inResolution.xy;

    // --- Camera

    const float fov = 80.0;
    float halfWidth = tan(radians(fov) * 0.5);
    float halfHeight = halfWidth / ratio;

    vec3 upVector = vec3(0.0, 1.0, 0.0);

    vec3 w = normalize(uOrigin - uLookAt);
    vec3 u = cross(upVector, w);
    vec3 v = cross(w, u);

    vec3 lowerLeft = uOrigin - halfWidth * u - halfHeight * v - w;
    vec3 horizontal = u * halfWidth * 2.0;
    vec3 vertical = v * halfHeight * 2.0;

    // ---

    vec3 dir = lowerLeft - uOrigin;
    vec2 rand = vec2(0.5);

    dir += horizontal * (pixelSize.x * rand.x + vTexCoord.x);
    dir += vertical * (pixelSize.y * rand.y + 1.0 - vTexCoord.y);

    outColor = getColor( Ray( uOrigin, normalize(dir) ) );
    // outColor = vec4( clamp( pow( color.xyz, vec3(0.4545) ), 0.0, 1.0 ), color.a );
}

