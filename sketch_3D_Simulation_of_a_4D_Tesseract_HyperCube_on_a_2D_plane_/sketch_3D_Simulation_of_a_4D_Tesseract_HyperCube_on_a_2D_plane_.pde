int dimentions = 3;
float[][] rawPoints;
float[][] scaledPoints;
float angle = 0;

void setup() {
  size(2000, 2000, P2D);

  scaledPoints = new float[(int)pow(2, dimentions)][];
  rawPoints = new float[(int)pow(2, dimentions)][];
  for(int i = 0; i < rawPoints.length; i++){
    rawPoints[i] = new float[dimentions];
  }
  
  rawPoints[0] = new float[]{-0.5, -0.5, -0.5};
  rawPoints[1] = new float[]{0.5, -0.5, -0.5};
  rawPoints[2] = new float[]{0.5, 0.5, -0.5};
  rawPoints[3] = new float[]{-0.5, 0.5, -0.5};
  rawPoints[4] = new float[]{-0.5, -0.5, 0.5};
  rawPoints[5] = new float[]{0.5, -0.5, 0.5};
  rawPoints[6] = new float[]{0.5, 0.5, 0.5};
  rawPoints[7] = new float[]{-0.5, 0.5, 0.5};
}

void draw() {
  translate(width / 2, height / 2);
  background(0); 
  stroke(255);
  strokeWeight(20);

  float[][] rotationMatrixX = {
    { 1, 0, 0},
    { 0, cos(angle), -sin(angle)},
    { 0, sin(angle), cos(angle)}
  };

  float[][] rotationMatrixY = {
    { cos(angle), 0, sin(angle)},
    { 0, 1, 0},
    { -sin(angle), 0, cos(angle)}
  };
  
  float[][] rotationMatrixZ = {
    { cos(angle), -sin(angle), 0},
    { sin(angle), cos(angle), 0},
    { 0, 0, 1}
  };
  
  for (int i = 0; i < rawPoints.length; i++) {
    float[][] point = new float[1][1]; //<>//
    point[0] = rawPoints[i];
    point = formatPoint(point);
    point = multiplyMatrices(rotationMatrixX, point);
    point = multiplyMatrices(rotationMatrixY, point);
    point = multiplyMatrices(rotationMatrixZ, point);
    point = multiplyMatrices(projectionMatrix(point, 2), point);
    point = formatPoint(point);
    scaledPoints[i] = point[0]; //<>//
  } //<>//
  
  for (int i = 0; i < scaledPoints.length; i++){
    scaledPoints[i][0] *= 1500;
    scaledPoints[i][1] *= 1500;
    point(scaledPoints[i][0], scaledPoints[i][1]); //<>//
  } 
  
  for (int i = 0; i < 4; i++) {
    connect(i, (i+1) % 4, scaledPoints);
    connect(i+4, ((i+1) % 4)+4, scaledPoints);
    connect(i, i+4, scaledPoints);
  }
  
  angle += 0.02;
}

float[][] projectionMatrix(float[][] point, float scale){
  float z = 1 / (scale - point[2][0]);
  
  float[][] projectionMatrix = {
    {z, 0, 0},
    {0, z, 0}    
  };
  return projectionMatrix;
}

void connect(int i, int j, float[][] points) {
  strokeWeight(1);
  line(points[i][0], points[i][1], points[j][0], points[j][1]);
}

float[][] formatPoint(float[][] raw){
  float[][] output = new float[raw[0].length][];
  for (int i = 0; i < output.length; i++){
    output[i] = new float[raw.length];
  }
  for (int x = 0; x < output.length; x++){
    for (int y = 0; y < output[0].length; y++){
      output[x][y] = raw[y][x];
    }    
  }
  return output;
}

float[][] multiplyMatrices(float[][] a, float[][] b){
  float[][] productMatrix = new float[a.length][];
  for(int i = 0; i < productMatrix.length; i++){
    productMatrix[i] = new float[b[0].length];
  }
  for (int x = 0; x < productMatrix.length; x++){
    for (int y = 0; y < productMatrix[0].length; y++){
      productMatrix[x][y] = 0;
      for (int i = 0; i < b.length; i++){
        productMatrix[x][y] += a[x][i] * b[i][y];
      }
    }    
  }
  return productMatrix;
}

// 1D
// 2 points
// 1 line
//
// 2D
// 4 points
// 4 lines
// 
// 3D
// 8 points
// 12 lines
// 4 planes
// 
// 4D
// 
// 
// 
// 
// 
