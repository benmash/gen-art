

uniform mat4 transform;

attribute vec4 position;
attribute vec4 color;


varying vec4 vertColor;

varying float depth;

void main() {
	gl_Position = transform * position;
	depth = gl_Position.z;
	
}