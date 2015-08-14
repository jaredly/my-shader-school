precision mediump float;

uniform sampler2D prevState;
uniform vec2 stateSize;
uniform float kdiffuse;
uniform float kdamping;

float prevStateVal(float x, float y) {
  return texture2D(prevState, fract(vec2(x, y) / stateSize)).r;
}

float laplace(float x, float y) {
  return (
    prevStateVal(x-1.0,y) +
    prevStateVal(x+1.0,y) +
    prevStateVal(x,y-1.0) +
    prevStateVal(x,y+1.0)
  ) - 4.0 * prevStateVal(x,y);
}

float state(vec2 c) {
  return (1.0 - kdamping) * (kdiffuse * laplace(c.x, c.y) + prevStateVal(c.x, c.y));
}

void main() {
  vec2 coord = gl_FragCoord.xy;

  //TODO: Compute next state using a 5-point Laplacian stencil and the rule

  float y = state(coord);

  gl_FragColor = vec4(y,y,y,1);
}
