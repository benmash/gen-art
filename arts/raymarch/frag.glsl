varying vec4 vertColor;

float trace_d(vec3 loc){
	float d1 = distance(loc, vec3(500, 500, 2000))-1000;
	float d2 = distance(mod(loc, 100), vec3(50, 50, 50))-50;
	
	return min(d1, d2);

}

void main() {
	vec3 pos = vec3(gl_FragCoord.xy, 0);

	vec3 ray = normalize(pos - vec3(500, 500, -1000));
	
	float d = trace_d(pos);
	int i = 0;
	while(d > 0 && i < 100){
		pos += ray * d;
		d = trace_d(pos);
		i++;
	}
	
	float depth = 1-smoothstep(0, 2000, pos.z);
	gl_FragColor = vec4(vec3(1-step(1, d))*depth, 1);
}



