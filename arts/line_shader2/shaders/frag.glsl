#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif



varying vec4 vertColor;

varying float depth;

void main() {
	
	
	
	gl_FragColor = vec4(1, 1, 1, 1-smoothstep(0, 1, 0.0009*depth));
}

