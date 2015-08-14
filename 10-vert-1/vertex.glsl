precision highp float;

uniform float theta;

attribute vec2 position;

void main() {

  //TODO: rotate position by theta radians about the origin

  float x = position[0];
  float y = position[1];
  mat2 rot = mat2(cos(-theta), -sin(-theta),
                  sin(-theta), cos(-theta));
  gl_Position = vec4(rot * position, 0, 1.0);
}
