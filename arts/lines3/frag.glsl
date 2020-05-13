varying vec4 vertColor;

uniform vec2 start[100];
uniform vec2 end[100];
uniform int count;
uniform float k;


void main(){
	float d = 1000000;
	
	for(int i = 0; i < count; i++){
	
		float d2 = distance(gl_FragCoord.xy, start[i]) + distance(gl_FragCoord.xy, end[i]);
		d2 -= distance(start[i], end[i]);
		
		
		float h = max(k-abs(d-d2), 0.0)/k;
		d = min(d, d2) - h*h*h*k*1/6.0;
	
	}
	
	gl_FragColor = vec4(vec3(1), 1-smoothstep(0.0, 0.01, d));

}