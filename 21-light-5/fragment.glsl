precision mediump float;

#pragma glslify: PointLight = require(./light.glsl)

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 ambient;

uniform PointLight lights[4];

varying vec3 fragNormal, fragPosition;
varying vec3 lightDirections[4];

void main() {
  vec3 eyeDirection = normalize(fragPosition);
  vec3 normal = normalize(fragNormal);
  vec3 lightColor = ambient; //  + diffuse * lambert + specular * phong;

  for (int i=0; i<4; i++) {
    PointLight light = lights[i];
    vec3 lightDir = normalize(lightDirections[i]);
    float lambert = dot(normal, lightDir);
    float phong = pow(max(dot(reflect(lightDir, normal), eyeDirection), 0.0), light.shininess);

    lightColor += light.diffuse * lambert + light.specular * phong;
  }

  gl_FragColor = vec4(lightColor, 1);
}
