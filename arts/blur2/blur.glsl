uniform int n;
uniform vec3 nodes[100];

uniform sampler2D screen;



void main(){

	float distances[100];
	float d = 0;
	
	for(int i = 0; i < n; i++){
		distances[i] = distance(gl_FragCoord.xy, nodes[i].xy);
		d += distances[i];
	}
	
	vec3 color = vec3(0);
	
	for(int i = 0; i < n; i++){
		color += texture2D(screen, nodes[i].xy/1000.0).rgb * (d-distances[i])/d;
		
	
	}

	gl_FragColor = vec4(color/(n-1), 1.0);
	//gl_FragColor = texture2D(screen, gl_FragCoord.xy/1000.0);

}