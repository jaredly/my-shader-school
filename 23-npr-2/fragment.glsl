precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 warm;
uniform vec3 cool;
uniform vec3 lightDirection;

varying vec3 vnormal;

void main() {
  float goochWeight = 0.5 * (1.0 + dot(normalize(vnormal), normalize(lightDirection)));
  vec3 goochColor = (1.0 - goochWeight) * cool + goochWeight * warm;
  // float celIntensity = ceil(brightness * 4.0) / 4.0;
  // vec3 refl = celIntensity;
  gl_FragColor = vec4(goochColor, 1);
}
