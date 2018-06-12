#version 100
precision mediump float;
uniform sampler2D tex;
uniform float alpha;
uniform bool premAlpha;
varying vec2 texCoord;
void main(){
   vec4 color = texture2D(tex, texCoord);
   if(premAlpha){
       gl_FragColor = vec4(clamp( color.r * alpha, 0.0, 1.0), clamp( color.g * alpha, 0.0, 1.0), clamp( color.b * alpha, 0.0, 1.0), clamp( color.a * alpha, 0.0, 1.0) );
   }else{
       gl_FragColor = vec4(color.rgb, clamp( color.a * alpha, 0.0, 1.0) );
   }
}

