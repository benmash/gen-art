#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif



varying vec4 vertColor;

flat in vec4 start;
flat in vec4 end;
flat in vec4 mid;

void main() {
	
	float d = distance(gl_FragCoord.x, mid.x);
	
	gl_FragColor = vec4(vec3(0), 1-(120.0/d));
}

