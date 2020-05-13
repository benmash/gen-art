varying vec4 vertColor;

uniform sampler2D frame;

uniform vec3 colors[3];

//uniform float t;

float rand(vec2 n) { 
	return fract(sin(dot(n, vec2(12.9898, 4.1414))) * 43758.5453);
}
void main(){
	
	vec2 v = gl_FragCoord.xy - vec2(500.0, 500.0);
	//float a = atan(v.y, v.x) + radians(90);
	//vec2 delta = vec2(cos(a), sin(a));
	
	vec2 delta = normalize(vec2(-v.y, v.x));
	
	//gl_FragColor = vec4(delta,0, 1);
	float r = floor(1 + (length(v)/500.0)*10.0)/10.0;
	vec2 loc = (gl_FragCoord.xy * (1+0.001*(0.5-rand(delta))) + delta * radians(300) * r*r)/1000.0;
	gl_FragColor = texture2D(frame, vec2(loc.x, 1-loc.y), -2.0);

	/*
	int c = -1;
	float d = 100000;
	
	for(int i = 0; i < 3; i++){
		if(distance(color.rgb, colors[i]) < d){
			d = distance(color.rgb, colors[i]);
			c = i;
		}
	}
	
	gl_FragColor = vec4(colors[c].rgb, 0.15);
	*/
}