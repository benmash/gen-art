#define PROCESSING_COLOR_SHADER

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform float random;

varying vec4 vertColor;
varying vec4 pos;

//in vec4 loc[16];


void main() {
	
	float c = fract(pos.x) + fract(pos.y) + random;
	gl_FragColor = vec4(vertColor.rgb, 0.5*step(1.8, c));
}

