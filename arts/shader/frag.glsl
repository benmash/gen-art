#define PROCESSING_COLOR_SHADER

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D screen;
uniform sampler2D random;

varying vec4 vertColor;
varying vec4 pos;



void main() {
	//vec2 loc = pos.xy * sin(length(pos.xy)) * 2;// + (random*100f);
	vec4 r = texture2D(random, pos.xy/1000)*10;
	r -= vec4(5.0);
	//loc.x = clamp(loc.x, 0, 600);
	//loc.y = clamp(loc.y, 0, 600);
	
	vec4 color = texture2D(screen, (pos.xy+r.xy)/1000);
	gl_FragColor = color;
}

