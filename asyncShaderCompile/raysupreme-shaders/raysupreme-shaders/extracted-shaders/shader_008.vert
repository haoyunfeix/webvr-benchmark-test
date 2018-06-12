#version 300 es
precision highp float;
in vec4 aPosition;
in vec2 aTexCoord;
out vec2 vTexCoord;
void main() {
   vTexCoord = vec2(aTexCoord.x, aTexCoord.y);
   gl_Position = aPosition;
}

