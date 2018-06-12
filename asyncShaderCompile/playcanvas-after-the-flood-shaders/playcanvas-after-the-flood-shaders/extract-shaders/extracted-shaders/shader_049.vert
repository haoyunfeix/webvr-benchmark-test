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

varying float vDepth;
uniform mat4 matrix_view;
uniform float camera_far;

void main(void)
{
   gl_Position = getPosition();
    vUv0 = vertex_texCoord0;
    vDepth = -(matrix_view * vec4(getWorldPosition(),1.0)).z / camera_far;
    gl_Position.x += 0.9557881309991387;
}


