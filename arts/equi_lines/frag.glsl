#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif



varying vec4 vertColor;

uniform vec3 p[500];
uniform float size[500];
uniform int nump;
uniform vec3 color;

void main() {
	float v = 0;

	for(int i = 0; i < nump; i++){
		v += size[i]/distance(gl_FragCoord.xy, p[i].xy);
	}
	
	//gl_FragColor = vec4(vec3(1-step(0.5, mod(v, 10))), 0.1);
	gl_FragColor = vec4(color, (1-step(0.5, mod(v, 10)))/50.0);
}

