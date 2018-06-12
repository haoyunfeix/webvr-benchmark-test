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
varying vec3 worldPos;

void main(void)
{
   gl_Position = getPosition();
    worldPos = dPositionW;
    gl_Position.x += 0.8131036866003529;
}


