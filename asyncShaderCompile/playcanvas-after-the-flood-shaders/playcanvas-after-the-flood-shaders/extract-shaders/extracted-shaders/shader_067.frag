precision highp float;

varying vec3 worldPos;

uniform vec3 view_position;

uniform float light_radius;

vec2 encodeFloatRG( float v ) {

                     vec2 enc = vec2(1.0, 255.0) * v;

                     enc = fract(enc);

                     enc -= enc.yy * vec2(1.0/255.0, 1.0/255.0);

                     return enc;

                    }
void main(void)
{
   float depth = min(distance(view_position, worldPos) / light_radius, 0.99999);
   gl_FragColor = vec4(encodeFloatRG(depth), encodeFloatRG(depth*depth));
  gl_FragColor.x += 0.8841162363448489;
}


