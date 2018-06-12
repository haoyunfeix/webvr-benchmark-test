#version 300 es
precision mediump float;

in vec2 vTexCoord;

uniform vec3 uSunDir;
uniform bool uSunActive;

uniform float uStepSize, uTMin, uTMax;
uniform int uSteps;


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
    vec3  emission;
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



#define MAX_MATERIALS 3
uniform MaterialInfo uMaterials[MAX_MATERIALS];




// --- Structs

struct Ray {
    vec3 origin;
    vec3 dir;
};

uniform float uSelectedId;

// --- Grid

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

const vec3 L = normalize(vec3(-0.5, 0.3, 0.7));
const vec3 L1 = normalize(vec3(0.5, -0.5, -0.5));
const vec3 L2 = normalize(vec3(0, 0.5, 0));

// ---

uniform sampler2D uRO, uRD;
uniform sampler2D uHit, uNormal;

vec4 getColor( in Ray ray, in vec3 hit )
{
    vec4 color = vec4( 0.0 );

    MaterialInfo material;

    if ( hit.y >= 0.0 && hit.z < 10000.0 )
    {
        int matIndex=int( hit.y );
        material = uMaterials[matIndex];
    }

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

    vec3 normal = textureLod( uNormal, vTexCoord, 0.0 ).xyz;
    if ( hit.y >= 0.0 && ( hit.x < planeD || color.a < 0.8 ) )
    {
        vec3 hitOrigin = ray.origin + ray.dir * hit.x;

        

        if ( hit.z == uSelectedId )
        {
            material.baseColor = vec3( 0.5, 0.5, 1.0 );
            color = vec4( material.baseColor * vec3(0.5, 0.5, 1.0) * clamp(dot(L, normal), 0.3, 1.0), 1.0 );
        } else
        {
            color = vec4( material.baseColor * clamp(max(max(dot(L, normal),dot(L1, normal)), dot(L2, normal)), 0.3, 1.0), 1.0 );
        }
    }

    

    return color;
}

out vec4 outColor;

void main()
{
    vec4 inRO = textureLod( uRO, vTexCoord, 0.0 );
    vec4 inRD = textureLod( uRD, vTexCoord, 0.0 );

    vec3 hit = textureLod( uHit, vTexCoord, 0.0 ).xyz;

    outColor = getColor( Ray( inRO.xyz, inRD.xyz ), hit );
    outColor = vec4( clamp( pow( outColor.xyz, vec3(0.4545) ), 0.0, 1.0 ), outColor.a );
}

