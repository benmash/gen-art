varying vec4 vertColor;

flat in vec4 start;
flat in vec4 end;

uniform float t;

//uniform float k;


void main(){
	
	
	vec2 tangent = end.xy-start.xy;
	vec2 normal = vec2(-tangent.y, tangent.x);
	
	vec2 v = gl_FragCoord.xy-start.xy;
	
	float loc = length(v);
	
	v += 50 * normalize(normal) * sin((v/length(tangent) + t) * radians(360));
		
		
		//float h = max(k-abs(d-d2), 0.0)/k;
		//d = min(d, d2) - h*h*h*k*1/6.0;
	
	float d = distance(normalize(tangent), normalize(v));
	if(loc > length(tangent)){
		d = 1000;
	}
	
	gl_FragColor = vec4(vec3(1), 1.0-step(0.01, d));

}