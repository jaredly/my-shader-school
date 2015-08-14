precision mediump float;

uniform vec3 ambient;
uniform vec3 diffuse;
uniform vec3 lightDirection;

varying vec3 vnormal;

vec3 reflectedLight(
    vec3 normal,
    vec3 lightDirection,
    vec3 ambient,
    vec3 diffuse
    ) {
  float brightness = dot(normalize(normal), normalize(lightDirection));
  return ambient + diffuse * max(brightness, 0.0);
}

void main() {
  vec3 refl = reflectedLight(vnormal, lightDirection, ambient, vec3(diffuse));
  gl_FragColor = vec4(refl, 1);
}
