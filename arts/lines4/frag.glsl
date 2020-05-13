varying vec4 vertColor;

flat in vec4 start;
flat in vec4 end;


//uniform float k;


void main(){
	
	
	float d = distance(gl_FragCoord.xy, start.xy) + distance(gl_FragCoord.xy, end.xy);
	d -= distance(start.xy, end.xy);
		
		
		//float h = max(k-abs(d-d2), 0.0)/k;
		//d = min(d, d2) - h*h*h*k*1/6.0;
	
	
	
	gl_FragColor = vec4(vec3(1), 1.0-step(0.05, d));

}