precision mediump float;

#define OUTSIDE_COLOR   vec4(1.0)

void main() {

  //TODO: Replace this with a function that draws a checkerboard
  
  vec4 tile = step(0.5, fract(0.5 * gl_FragCoord / 16.0));
  if (tile.x != tile.y) {
    discard;
  } else {
    gl_FragColor = OUTSIDE_COLOR;
  }
}
