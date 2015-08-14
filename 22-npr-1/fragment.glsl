precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 diffuse;
uniform vec3 lightDirection;
uniform float numBands;

varying vec3 vnormal;

vec3 reflectedLight(
    vec3 normal,
    vec3 lightDirection,
    vec3 diffuse
    ) {
  float brightness = max(dot(normalize(normal), normalize(lightDirection)), 0.0);
  float celIntensity = ceil(brightness * numBands) / numBands;
  return diffuse * celIntensity;
}

void main() {
  vec3 refl = reflectedLight(vnormal, lightDirection, vec3(diffuse));
  gl_FragColor = vec4(refl, 1);
}
