#version 300 es
#define varying in
out highp vec4 pc_fragColor;
#define gl_FragColor pc_fragColor
#define texture2D texture
#define textureCube texture
#define texture2DProj textureProj
#define GL2
// ----- zebraAlpha -----
precision highp float;

varying vec3 vPositionW;
varying vec3 vNormalW;
varying vec2 vUv0;

uniform vec3 view_position;
uniform vec3 light_globalAmbient;
float square(float x) {
    return x*x;
}
float saturate(float x) {
    return clamp(x, 0.0, 1.0);
}
vec3 saturate(vec3 x) {
    return clamp(x, vec3(0.0), vec3(1.0));
}
vec4 dReflection;
vec3 dAlbedo;
vec3 dNormalW;
vec3 dViewDirW;
vec3 dReflDirW;
vec3 dDiffuseLight;
vec3 dSpecularLight;
vec3 dLightDirNormW;
vec3 dLightDirW;
vec3 dLightPosW;
vec3 dShadowCoord;
vec3 dSpecularity;
float dGlossiness;
float dAlpha;
float dAtten;
float getSpotEffect(vec3 lightSpotDirW, float lightInnerConeAngle, float lightOuterConeAngle) {
    float cosAngle = dot(dLightDirNormW, lightSpotDirW);
    return smoothstep(lightOuterConeAngle, lightInnerConeAngle, cosAngle);
}
float getFalloffInvSquared(float lightRadius) {
    float sqrDist = dot(dLightDirW, dLightDirW);
    float falloff = 1.0 / (sqrDist + 1.0);
    float invRadius = 1.0 / lightRadius;
    falloff *= 16.0;
    falloff *= square( saturate( 1.0 - square( sqrDist * square(invRadius) ) ) );
    return falloff;
}
void getLightDirPoint(vec3 lightPosW) {
    dLightDirW = vPositionW - lightPosW;
    dLightDirNormW = normalize(dLightDirW);
    dLightPosW = lightPosW;
}
uniform vec3 light0_color;
uniform vec3 light0_position;
uniform float light0_radius;
uniform vec3 light0_direction;
uniform float light0_innerConeAngle;
uniform float light0_outerConeAngle;
uniform vec3 light1_color;
uniform vec3 light1_position;
uniform float light1_radius;
uniform vec3 light1_direction;
uniform float light1_innerConeAngle;
uniform float light1_outerConeAngle;
uniform mat4 light1_shadowMatrix;
uniform vec4 light1_shadowParams;
uniform sampler2D light1_shadowMap;

void getNormal() {
    dNormalW = normalize(vNormalW);
}
vec3 gammaCorrectInput(vec3 color) {
    return pow(color, vec3(2.2));
}
float gammaCorrectInput(float color) {
    return pow(color, 2.2);
}
vec4 gammaCorrectInput(vec4 color) {
    return vec4(pow(color.rgb, vec3(2.2)), color.a);
}
vec4 texture2DSRGB(sampler2D tex, vec2 uv) {
    vec4 rgba = texture2D(tex, uv);
    rgba.rgb = gammaCorrectInput(rgba.rgb);
    return rgba;
}
vec4 textureCubeSRGB(samplerCube tex, vec3 uvw) {
    vec4 rgba = textureCube(tex, uvw);
    rgba.rgb = gammaCorrectInput(rgba.rgb);
    return rgba;
}
vec3 gammaCorrectOutput(vec3 color) {
    return color;
}
vec3 toneMap(vec3 color) {
    return color;
}

uniform vec3 fog_color;
uniform float fog_density;

vec3 addFog(vec3 color) {
    float depth = distance(vPositionW, view_position);

    float fogFactor = exp(-depth * fog_density);
    fogFactor = clamp(fogFactor, 0.0, 1.0);

    vec3 result = mix(fog_color, color, fogFactor);
    return result;
}

vec3 decodeRGBM(vec4 rgbm) {
    vec3 color = (8.0 * rgbm.a) * rgbm.rgb;
    return color * color;
}
vec3 texture2DRGBM(sampler2D tex, vec2 uv) {
    return decodeRGBM(texture2D(tex, uv));
}
vec3 textureCubeRGBM(samplerCube tex, vec3 uvw) {
    return decodeRGBM(textureCube(tex, uvw));
}
vec3 fixSeams(vec3 vec, float mipmapIndex) {
    float scale = 1.0 - exp2(mipmapIndex) / 128.0;
    float M = max(max(abs(vec.x), abs(vec.y)), abs(vec.z));
    if (abs(vec.x) != M) vec.x *= scale;
    if (abs(vec.y) != M) vec.y *= scale;
    if (abs(vec.z) != M) vec.z *= scale;
    return vec;
}
vec3 fixSeams(vec3 vec) {
    float scale = 1.0 - 1.0 / 128.0;
    float M = max(max(abs(vec.x), abs(vec.y)), abs(vec.z));
    if (abs(vec.x) != M) vec.x *= scale;
    if (abs(vec.y) != M) vec.y *= scale;
    if (abs(vec.z) != M) vec.z *= scale;
    return vec;
}
vec3 fixSeamsStatic(vec3 vec, float invRecMipSize) {
    float scale = invRecMipSize;
    float M = max(max(abs(vec.x), abs(vec.y)), abs(vec.z));
    if (abs(vec.x) != M) vec.x *= scale;
    if (abs(vec.y) != M) vec.y *= scale;
    if (abs(vec.z) != M) vec.z *= scale;
    return vec;
}
vec3 cubeMapProject(vec3 dir) {
    return dir;
}

//#ifdef GL2
//#define skyboxIntensity uniformScene.fogColor_skyInt.w
//#else
uniform float skyboxIntensity;
//#endif
vec3 processEnvironment(vec3 color) {
    return color * skyboxIntensity;
}
uniform vec3 material_diffuse;
void getAlbedo() {
    dAlbedo = material_diffuse.rgb;
}
uniform sampler2D texture_opacityMap;
void getOpacity() {
    dAlpha = texture2D(texture_opacityMap, vUv0).g;
}
uniform vec3 material_emissive;
vec3 getEmission() {
    return material_emissive;
}
float antiAliasGlossiness(float power) {
    return power;
}
uniform vec3 material_specular;
void getSpecularity() {
    dSpecularity = material_specular;
}
uniform float material_shininess;
void getGlossiness() {
    dGlossiness = material_shininess + 0.0000001;
}
// Schlick's approximation
uniform float material_fresnelFactor; // unused
void getFresnel() {
    float fresnel = 1.0 - max(dot(dNormalW, dViewDirW), 0.0);
    float fresnel2 = fresnel * fresnel;
    fresnel *= fresnel2 * fresnel2;
    fresnel *= dGlossiness * dGlossiness;
    dSpecularity = dSpecularity + (1.0 - dSpecularity) * fresnel;
}
uniform samplerCube texture_prefilteredCubeMap128;
uniform samplerCube texture_prefilteredCubeMap64;
uniform samplerCube texture_prefilteredCubeMap32;
uniform samplerCube texture_prefilteredCubeMap16;
uniform samplerCube texture_prefilteredCubeMap8;
uniform samplerCube texture_prefilteredCubeMap4;
uniform float material_reflectivity;
void addReflection() {
    // Unfortunately, WebGL doesn't allow us using textureCubeLod. Therefore bunch of nasty workarounds is required.
    // We fix mip0 to 128x128, so code is rather static.
    // Mips smaller than 4x4 aren't great even for diffuse. Don't forget that we don't have bilinear filtering between different faces.
    float bias = saturate(1.0 - dGlossiness) * 5.0; // multiply by max mip level
    int index1 = int(bias);
    int index2 = int(min(bias + 1.0, 7.0));
    vec3 fixedReflDir = fixSeams(cubeMapProject(dReflDirW), bias);
    fixedReflDir.x *= -1.0;
    vec4 cubes[6];
    cubes[0] = textureCube(texture_prefilteredCubeMap128, fixedReflDir);
    cubes[1] = textureCube(texture_prefilteredCubeMap64, fixedReflDir);
    cubes[2] = textureCube(texture_prefilteredCubeMap32, fixedReflDir);
    cubes[3] = textureCube(texture_prefilteredCubeMap16, fixedReflDir);
    cubes[4] = textureCube(texture_prefilteredCubeMap8, fixedReflDir);
    cubes[5] = textureCube(texture_prefilteredCubeMap4, fixedReflDir);
    // Also we don't have dynamic indexing in PS, so...
    vec4 cube[2];
    for(int i = 0; i < 6; i++) {
        if (i == index1) {
            cube[0] = cubes[i];
        }
        if (i == index2) {
            cube[1] = cubes[i];
        }
    }
    // another variant
    /*if (index1==0){ cube[0]=cubes[0];
    }else if (index1==1){ cube[0]=cubes[1];
    }else if (index1==2){ cube[0]=cubes[2];
    }else if (index1==3){ cube[0]=cubes[3];
    }else if (index1==4){ cube[0]=cubes[4];
    }else if (index1==5){ cube[0]=cubes[5];}
    if (index2==0){ cube[1]=cubes[0];
    }else if (index2==1){ cube[1]=cubes[1];
    }else if (index2==2){ cube[1]=cubes[2];
    }else if (index2==3){ cube[1]=cubes[3];
    }else if (index2==4){ cube[1]=cubes[4];
    }else if (index2==5){ cube[1]=cubes[5];}*/
    vec4 cubeFinal = mix(cube[0], cube[1], fract(bias));
    vec3 refl = processEnvironment(decodeRGBM(cubeFinal).rgb);
    dReflection += vec4(refl, material_reflectivity);
}
float linstep(float a, float b, float v) {
    return saturate((v - a) / (b - a));
}
float reduceLightBleeding(float pMax, float amount) {
  // Remove the [0, amount] tail and linearly rescale (amount, 1].
   return linstep(amount, 1.0, pMax);
}
float chebyshevUpperBound(vec2 moments, float mean, float minVariance, float lightBleedingReduction) {
    // Compute variance
    float variance = moments.y - (moments.x * moments.x);
    variance = max(variance, minVariance);
    // Compute probabilistic upper bound
    float d = mean - moments.x;
    float pMax = variance / (variance + (d * d));
    pMax = reduceLightBleeding(pMax, lightBleedingReduction);
    // One-tailed Chebyshev
    return (mean <= moments.x ? 1.0 : pMax);
}
float calculateEVSM(vec3 moments, float Z, float vsmBias, float exponent) {
    Z = 2.0 * Z - 1.0;
    float warpedDepth = exp(exponent * Z);
    moments.xy += vec2(warpedDepth, warpedDepth*warpedDepth) * (1.0 - moments.z);
    float VSMBias = vsmBias;//0.01 * 0.25;
    float depthScale = VSMBias * exponent * warpedDepth;
    float minVariance1 = depthScale * depthScale;
    return chebyshevUpperBound(moments.xy, warpedDepth, minVariance1, 0.1);
}
float calculateVSM8(vec3 moments, float Z, float vsmBias) {
    float VSMBias = vsmBias;//0.01 * 0.25;
    float depthScale = VSMBias * Z;
    float minVariance1 = depthScale * depthScale;
    return chebyshevUpperBound(moments.xy, Z, minVariance1, 0.1);
}
float decodeFloatRG(vec2 rg) {
    return rg.y*(1.0/255.0) + rg.x;
}
float VSM8(sampler2D tex, vec2 texCoords, float resolution, float Z, float vsmBias, float exponent) {
    vec4 c = texture2D(tex, texCoords);
    vec3 moments = vec3(decodeFloatRG(c.xy), decodeFloatRG(c.zw), 0.0);
    return calculateVSM8(moments, Z, vsmBias);
}
float getShadowVSM8(sampler2D shadowMap, vec3 shadowParams, float exponent) {
    return VSM8(shadowMap, dShadowCoord.xy, shadowParams.x, dShadowCoord.z, shadowParams.y, 0.0);
}
float getShadowSpotVSM8(sampler2D shadowMap, vec4 shadowParams, float exponent) {
    return VSM8(shadowMap, dShadowCoord.xy, shadowParams.x, length(dLightDirW) * shadowParams.w + shadowParams.z, shadowParams.y, 0.0);
}
float getShadowBias(float resolution, float maxBias) {
    return maxBias;
}
void _getShadowCoordOrtho(mat4 shadowMatrix, vec3 shadowParams, vec3 wPos) {
    dShadowCoord = (shadowMatrix * vec4(wPos, 1.0)).xyz;
    dShadowCoord.z += getShadowBias(shadowParams.x, shadowParams.z);
    //dShadowCoord.z = min(dShadowCoord.z, 1.0);
}
void _getShadowCoordPersp(mat4 shadowMatrix, vec4 shadowParams, vec3 wPos) {
    vec4 projPos = shadowMatrix * vec4(wPos, 1.0);
    projPos.xy /= projPos.w;
    dShadowCoord.xy = projPos.xy;
    dShadowCoord.z = projPos.z / projPos.w;//length(dLightDirW) * shadowParams.w;
    //dShadowCoord.z = length(dLightDirW) * shadowParams.w;
    //dShadowCoord.z += getShadowBias(shadowParams.x, shadowParams.z);
    float f = 1.0 / shadowParams.w;
    float n = f / 1000.0;
    //dShadowCoord.z = (2.0*n) / (f + n - dShadowCoord.z * (f - n)); // linearize
    dShadowCoord.z = -((2.0*f*n)/(f-n)) / (dShadowCoord.z - (f+n)/(f-n)); // linearize
    dShadowCoord.z *= shadowParams.w;
    dShadowCoord.z += getShadowBias(shadowParams.x, shadowParams.z) * 10.0;
    dShadowCoord.z /= shadowParams.w;
    dShadowCoord.z = (f+n)/(f-n) - (2.0*f*n)/(f-n) / dShadowCoord.z; // unlinearize
}
void getShadowCoordOrtho(mat4 shadowMatrix, vec3 shadowParams) {
    _getShadowCoordOrtho(shadowMatrix, shadowParams, vPositionW);
}
void getShadowCoordPersp(mat4 shadowMatrix, vec4 shadowParams) {
    _getShadowCoordPersp(shadowMatrix, shadowParams, vPositionW);
}
void getShadowCoordPerspNormalOffset(mat4 shadowMatrix, vec4 shadowParams) {
    float distScale = abs(dot(vPositionW - dLightPosW, dLightDirNormW)); // fov?
    vec3 wPos = vPositionW + vNormalW * shadowParams.y * clamp(1.0 - dot(vNormalW, -dLightDirNormW), 0.0, 1.0) * distScale;
    _getShadowCoordPersp(shadowMatrix, shadowParams, wPos);
}
void getShadowCoordOrthoNormalOffset(mat4 shadowMatrix, vec3 shadowParams) {
    vec3 wPos = vPositionW + vNormalW * shadowParams.y * clamp(1.0 - dot(vNormalW, -dLightDirNormW), 0.0, 1.0); //0.08
    _getShadowCoordOrtho(shadowMatrix, shadowParams, wPos);
}
void normalOffsetPointShadow(vec4 shadowParams) {
    float distScale = length(dLightDirW);
    vec3 wPos = vPositionW + vNormalW * shadowParams.y * clamp(1.0 - dot(vNormalW, -dLightDirNormW), 0.0, 1.0) * distScale; //0.02
    vec3 dir = wPos - dLightPosW;
    dLightDirW = dir;
}
float getLightDiffuse() {
    return max(dot(dNormalW, -dLightDirNormW), 0.0);
}
// Energy-conserving (hopefully) Blinn-Phong
float getLightSpecular() {
    vec3 h = normalize( -dLightDirNormW + dViewDirW );
    float nh = max( dot( h, dNormalW ), 0.0 );
    float specPow = exp2(dGlossiness * 11.0); // glossiness is linear, power is not; 0 - 2048
    specPow = antiAliasGlossiness(specPow);
    // Hack: On Mac OS X, calling pow with zero for the exponent generates hideous artifacts so bias up a little
    specPow = max(specPow, 0.0001);
    return pow(nh, specPow) * (specPow + 2.0) / 8.0;
}
vec3 combineColor() {
    return mix(dAlbedo * dDiffuseLight, dSpecularLight + dReflection.rgb * dReflection.a, dSpecularity);
}
void addAmbient() {
    vec3 fixedReflDir = fixSeamsStatic(dNormalW, 1.0 - 1.0 / 4.0);
    fixedReflDir.x *= -1.0;
    dDiffuseLight += processEnvironment(decodeRGBM(textureCube(texture_prefilteredCubeMap4, fixedReflDir)).rgb);
}
uniform float alpha_ref;
void alphaTest(float a) {
    if (a < alpha_ref) discard;
}
void getViewDir() {
    dViewDirW = normalize(view_position - vPositionW);
}
void getReflDir() {
    dReflDirW = normalize(-reflect(dViewDirW, dNormalW));
}

void main(void) {
    dDiffuseLight = vec3(0);
    dSpecularLight = vec3(0);
    dReflection = vec4(0);
    dSpecularity = vec3(0);
   getOpacity();
   alphaTest(dAlpha);
   getViewDir();
   getNormal();
   getReflDir();
   getAlbedo();
   getSpecularity();
   getGlossiness();
   getFresnel();
   addAmbient();
   addReflection();
   getLightDirPoint(light0_position);
   dAtten = getFalloffInvSquared(light0_radius);
   if (dAtten > 0.00001) {
       dAtten *= getSpotEffect(light0_direction, light0_innerConeAngle, light0_outerConeAngle);
       dAtten *= getLightDiffuse();
       dDiffuseLight += dAtten * light0_color;
       dAtten *= getLightSpecular();
       dSpecularLight += dAtten * light0_color;
   }

   getLightDirPoint(light1_position);
   dAtten = getFalloffInvSquared(light1_radius);
   if (dAtten > 0.00001) {
       dAtten *= getSpotEffect(light1_direction, light1_innerConeAngle, light1_outerConeAngle);
       dAtten *= getLightDiffuse();
    getShadowCoordPersp(light1_shadowMatrix, light1_shadowParams);
       dAtten *= getShadowSpotVSM8(light1_shadowMap, light1_shadowParams, 0.0);
       dDiffuseLight += dAtten * light1_color;
       dAtten *= getLightSpecular();
       dSpecularLight += dAtten * light1_color;
   }


   gl_FragColor.rgb = combineColor();
   gl_FragColor.rgb += getEmission();
   gl_FragColor.rgb = addFog(gl_FragColor.rgb);
   gl_FragColor.rgb = toneMap(gl_FragColor.rgb);
   gl_FragColor.rgb = gammaCorrectOutput(gl_FragColor.rgb);
gl_FragColor.a = dAlpha;

  pc_fragColor.x += 0.39825515327306693;
}


