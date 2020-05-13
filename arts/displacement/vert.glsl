uniform sampler2D noise;

uniform mat4 transform;

attribute vec4 position;
attribute vec4 color;


varying vec4 vertColor;

float rand(vec2 n) { 
	return fract(sin(dot(n, vec2(12.9898, 4.1414))) * 43758.5453);
}

void main() {
	//vertColor = vec4(texture2D(noise, vec2(position.x, 0.5)).xy-vec2(0.5, 0.5), 0.0, 1.0);
	vertColor = color;
	gl_Position = transform*position;
	
}