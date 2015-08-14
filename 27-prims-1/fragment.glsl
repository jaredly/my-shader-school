precision highp float;

varying vec3 vcolor;

void main() {
  if (pow(gl_PointCoord.x - 0.5, 2.0) + pow(gl_PointCoord.y - 0.5, 2.0) < .25) {
    gl_FragColor = vec4(vcolor, 1);//gl_PointCoord.x * gl_PointCoord.y);
  } else {
    discard;
  }
}
