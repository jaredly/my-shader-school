highp vec2 func(highp vec2 a, highp vec2 b) {

  //TODO: Implement the exercise here

  //return vec2(1, 0);
  return normalize(length(b) * a + length(a) * b);
}

//Do not change this line
#pragma glslify: export(func)
