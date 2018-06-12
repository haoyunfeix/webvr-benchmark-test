attribute vec3 vertex_position;
uniform mat4 matrix_model;
uniform mat4 matrix_viewProjection;
vec3 dPositionW;
mat4 dModelMatrix;
attribute vec4 vertex_boneWeights;
attribute vec4 vertex_boneIndices;
uniform sampler2D texture_poseMap;
uniform vec2 texture_poseMapSize;
uniform vec3 skinPosOffset;
mat4 getBoneMatrix(const in float i)
{
    float j = i * 4.0;
    float x = mod(j, float(texture_poseMapSize.x));
    float y = floor(j / float(texture_poseMapSize.x));
    float dx = 1.0 / float(texture_poseMapSize.x);
    float dy = 1.0 / float(texture_poseMapSize.y);
    y = dy * (y + 0.5);
    vec4 v1 = texture2D(texture_poseMap, vec2(dx * (x + 0.5), y));
    vec4 v2 = texture2D(texture_poseMap, vec2(dx * (x + 1.5), y));
    vec4 v3 = texture2D(texture_poseMap, vec2(dx * (x + 2.5), y));
    vec4 v4 = texture2D(texture_poseMap, vec2(dx * (x + 3.5), y));
    mat4 bone = mat4(v1, v2, v3, v4);
    return bone;
}
mat4 getModelMatrix() {
    return getBoneMatrix(vertex_boneIndices.x) * vertex_boneWeights.x +
           getBoneMatrix(vertex_boneIndices.y) * vertex_boneWeights.y +
           getBoneMatrix(vertex_boneIndices.z) * vertex_boneWeights.z +
           getBoneMatrix(vertex_boneIndices.w) * vertex_boneWeights.w;
}
vec4 getPosition() {
    dModelMatrix = getModelMatrix();
    vec4 posW = dModelMatrix * vec4(vertex_position, 1.0);
    //posW.xyz /= posW.w;
    posW.xyz += skinPosOffset;
    dPositionW = posW.xyz;// / posW.w;
    return matrix_viewProjection * posW;
}
vec3 getWorldPosition() {
    return dPositionW;
}
varying float vDepth;
uniform mat4 matrix_view;
uniform float camera_far;

void main(void)
{
   gl_Position = getPosition();
    vDepth = -(matrix_view * vec4(getWorldPosition(),1.0)).z / camera_far;
    gl_Position.x += 0.5265678153909799;
}


