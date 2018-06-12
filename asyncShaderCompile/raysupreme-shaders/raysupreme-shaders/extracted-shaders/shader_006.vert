#version 300 es
                precision highp float;
                in vec4 aPosition;
                in vec2 aTexCoord;
                out vec2 texCoord;

                void main() {
                    texCoord = vec2(aTexCoord.x, 1.0- aTexCoord.y);
                    gl_Position = aPosition;
                }
