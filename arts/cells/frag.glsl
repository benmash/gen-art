#define PROCESSING_COLOR_SHADER

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform vec3 points[100];

varying vec4 vertColor;
varying vec4 pos;



void main() {
	vec4 color = vec4(0);
	float dist = 10000;
	float dist2 = 10000;
	
	bool point = false;
	for(int i = 0; i < 100; i++){
		float d = distance(points[i], pos.xyz);
		if(d < dist){
			dist2 = dist;
			dist = d;
		}
		if(d < 3){
			point = true;
			i = 100;
		}	
		
	}
	
	
	
	color = vec4(1.5/(dist2-dist));
	
	if(point){
		color = vec4(0, 1, 0, 1);
	}
	
	gl_FragColor = color;
}

