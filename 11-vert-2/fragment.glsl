precision highp float;

varying vec3 vcolor;

void main() {
  gl_FragColor = vec4(vcolor, 1); // vec4(1,1,1,1);
}
