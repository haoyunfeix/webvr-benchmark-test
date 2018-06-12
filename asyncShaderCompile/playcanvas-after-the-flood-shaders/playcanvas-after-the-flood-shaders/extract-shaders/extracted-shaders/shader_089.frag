precision highp float;

vec3 fixSeams(vec3 vec, float mipmapIndex) {
    return vec;
}
vec3 fixSeams(vec3 vec) {
    return vec;
}
vec3 fixSeamsStatic(vec3 vec, float invRecMipSize) {
    return vec;
}

//#ifdef GL2
//#define skyboxIntensity uniformScene.fogColor_skyInt.w
//#else
uniform float skyboxIntensity;
//#endif
vec3 processEnvironment(vec3 color) {
    return color * skyboxIntensity;
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
uniform float exposure;
vec3 toneMap(vec3 color) {
    return color * exposure;
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
varying vec3 vViewDir;
uniform samplerCube texture_cubeMap;
void main(void) {
    vec3 color = processEnvironment(textureCubeRGBM(texture_cubeMap, fixSeamsStatic(vViewDir, 0.9921875)).rgb);
    color = toneMap(color);
    color = gammaCorrectOutput(color);
    gl_FragColor = vec4(color, 1.0);
  gl_FragColor.x += 0.6542787988608216;
}


