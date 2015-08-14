precision highp float;

uniform sampler2D texture;
uniform vec2 screenSize;

void main() {
  vec2 coord = gl_FragCoord.xy / screenSize;

  //TODO: Swap red and blue color channels of image

  gl_FragColor = texture2D(texture, coord);
  float red = gl_FragColor[0];
  gl_FragColor[0] = gl_FragColor[2];
  gl_FragColor[2] = red;
}
