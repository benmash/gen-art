#define PROCESSING_COLOR_SHADER

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

//uniform float random;

uniform vec3 loc;

varying vec4 vertColor;
varying vec4 pos;

//in vec4 loc[16];


void main() {
	
	float d = distance(pos.xy, loc.xy);
	
	float c = smoothstep(0.6, 0.25, 10.0/d);
	
	gl_FragColor = vec4(vec3(c), 1.0);
}

