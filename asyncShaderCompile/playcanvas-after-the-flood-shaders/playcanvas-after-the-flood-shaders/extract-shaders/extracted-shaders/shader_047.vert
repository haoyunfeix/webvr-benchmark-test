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
varying float vDepth;
uniform mat4 matrix_view;
uniform float camera_far;

void main(void)
{
    gl_Position = getPosition();
    vDepth = -(matrix_view * vec4(getWorldPosition(),1.0)).z / camera_far;
    gl_Position.x += 0.7963953253923342;
}


