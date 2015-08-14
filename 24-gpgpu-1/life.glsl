precision highp float;

uniform sampler2D prevState;
uniform vec2 stateSize;

float state(vec2 coord) {
  float me = texture2D(prevState, fract(coord / stateSize)).r;
  float neighbors = 0.0;

  for (int dx = -1; dx < 2; dx++) {
    for (int dy = -1; dy < 2; dy++) {
      if (dx == 0 && dy == 0) {
        continue;
      }
      vec2 ncoord = coord;
      ncoord.x += float(dx);
      ncoord.y += float(dy);
      neighbors += texture2D(prevState, fract(ncoord / stateSize)).r;
    }
  }

  if (neighbors == 3.0) {
    return 1.0;
  }

  if (me == 1.0 && neighbors == 2.0) {
    return 1.0;
  }

  return 0.0;
}

void main() {
  vec2 coord = gl_FragCoord.xy;

  //TODO: Compute the next state for the cell at coord
  float s = state(coord);

  gl_FragColor = vec4(s,s,s, 1.0);
}
