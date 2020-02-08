

uniform mat4 transform;
uniform vec4 viewport;

attribute vec4 position;
attribute vec4 color;
attribute vec4 direction;

varying vec4 vertColor;

flat out vec4 start;
flat out vec4 end;
flat out vec4 mid;

vec3 clipToWindow(vec4 clip) {
	vec3 dclip = clip.xyz / clip.w;
	vec2 xypos = (dclip.xy + vec2(1.0, 1.0)) * 0.5 * viewport.zw;
	return vec3(xypos, dclip.z * 0.5 + 0.5);
}

void main() {
	
	start = transform * position;
	end = start + transform * vec4(direction.xyz, 0);
	
	
	
	vec3 wStart = clipToWindow(start);
	vec3 wEnd = clipToWindow(end);
	
	vec2 tangent = end.xy-start.xy;
	
	vec2 normal = normalize(vec2(-tangent.y, tangent.x));
	
	mid = vec4((wStart + wEnd)/2, 0);
	
	gl_Position.xy = start.xy + (normal * direction.w).xy;
	gl_Position.zw = start.zw;
	vertColor = color;
}