#define PROCESSING_COLOR_SHADER

uniform mat4 transform;

attribute vec4 position;
attribute vec4 color;

varying vec4 vertColor;
varying vec4 pos;

//out vec4 loc[16];

void main() {
  gl_Position = transform * position;
  //loc[gl_VertexID] = gl_Position;
  pos = position;
  vertColor = color;
}