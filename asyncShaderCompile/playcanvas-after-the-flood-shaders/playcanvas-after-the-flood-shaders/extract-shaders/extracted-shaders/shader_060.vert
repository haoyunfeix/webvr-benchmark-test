attribute vec3 vertex_position;
uniform mat4 matrix_model;
uniform mat4 matrix_viewProjection;
vec3 dPositionW;
mat4 dModelMatrix;
mat4 getModelMatrix() {
    return matrix_model;
}
vec4 getPosition() {
    dModelMatrix = getModelMatrix();
    vec4 posW = dModelMatrix * vec4(vertex_position, 1.0);
    dPositionW = posW.xyz;
    return matrix_viewProjection * posW;
}
vec3 getWorldPosition() {
    return dPositionW;
}
attribute vec2 vertex_texCoord0;

varying vec2 vUv0;

varying vec3 worldPos;

void main(void)
{
   gl_Position = getPosition();
    vUv0 = vertex_texCoord0;
    worldPos = dPositionW;
    gl_Position.x += 0.5049555922693807;
}


