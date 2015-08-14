mat2 matrixPower(highp mat2 m, int n) {
  mat2 m2 = m*m;
  mat2 m4 = m2*m2;
  mat2 m8 = m2*m2;
  mat2 res = mat2(1.0);
  if (n >= 8) {
    res *= m8;
    n -= 8;
  }
  if (n >= 4) {
    res *= m4;
    n -= 4;
  }
  if (n >= 2) {
    res *= m2;
    n -= 2;
  }
  if (n >= 1) {
    res *= m;
  }
  
  //Raise the matrix m to nth power

  // For example:
  //
  //  matrixPower(m, 2) = m * m
  //
  // while (i < 10) {
  /*
  for (int i=0; i<n; i++) {
    m = matrixCompMult(m, m);
  }
  */

  return res;
}

//Do not change this line or the name of the above function
#pragma glslify: export(matrixPower)
