int dimentions = 3;
float[][] rawPoints;
float[][] scaledPoints;
float angle = 0;

void setup() {
  size(1000, 1000, P2D);

  scaledPoints = new float[(int)pow(2, dimentions)][];
  rawPoints = new float[(int)pow(2, dimentions)][];
  for(int i = 0; i < rawPoints.length; i++){
    rawPoints[i] = new float[dimentions];
    scaledPoints[i] = new float[2];
  }
  
  
  rawPoints[0] = new float[]{-0.5, -0.5, -0.5};
  rawPoints[1] = new float[]{0.5, -0.5, -0.5};
  rawPoints[2] = new float[]{0.5, 0.5, -0.5};
  rawPoints[3] = new float[]{-0.5, 0.5, -0.5};
  rawPoints[4] = new float[]{-0.5, -0.5, 0.5};
  rawPoints[5] = new float[]{0.5, -0.5, 0.5};
  rawPoints[6] = new float[]{0.5, 0.5, 0.5};
  rawPoints[6] = new float[]{-0.5, 0.5, 0.5};
  
}


void draw() {
  translate(width / 2, height / 2);
  
  background(0); 
  stroke(255);
  strokeWeight(10);
  
  
  float[][] projectionMatrix = {
    {1, 0, 0},
    {0, 1, 0}    
  };
  
  float[][] rotationMatrixZ = {
    { cos(angle), -sin(angle), 0},
    { sin(angle), cos(angle), 0},
    { 0, 0, 1}
  };

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
  
  for (int i = 0; i < rawPoints.length; i++) {
    
  }

  
  for (int i = 0; i < scaledPoints.length; i++){
    point(scaledPoints[i][0], scaledPoints[i][1]);
  } 
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
