uniform sampler2D screen;
uniform vec3 nodes[1000];
uniform int n;

void main(){

	
	vec4 loc = vec4(gl_FragCoord.x, 1000.0-gl_FragCoord.y, 0, 0);

	vec2 close = nodes[0].xy;
	vec2 close2 = nodes[1].xy;
	for(int i = 0; i < n; i++){
		if(distance(loc.xy, nodes[i].xy) < distance(loc.xy, close)){
			close2 = close;
			close = nodes[i].xy;
		}
		
	}
	
	float d = distance(loc.xy, close);
	float ratio = d/(d + distance(loc.xy, close2));
	
	vec4 color = mix(texture2D(screen, close/1000.0), texture2D(screen, close2/1000.0), ratio);
	
	gl_FragColor = vec4(color.rgb, 0.1);

}