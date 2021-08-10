PShader sh;

float zoom;
float sc;
PVector trans;
float speed;

float magnification;

boolean showJulia;

void settings () {
  size(1050, 600, P2D); // maintain 7:4 ratio
}

void setup () {
  magnification = width/3.5;
  
  noStroke();
  
  sh = loadShader("MandelbrotWithJuliaFrag.glsl");
  zoom = 1.0;
  sc = 1;
  trans = new PVector(0.0, 0.0);
  speed = 25.0;
  
  showJulia = false;
  
  sh.set("magnification", magnification);
  sh.set("windowSize", float(width), float(height));
}

void draw () {
  
  if (mousePressed) {
    cursor(MOVE);
    trans.y += (mouseY - pmouseY) / zoom;
    trans.x -= (mouseX - pmouseX) / zoom;
  } else {
    cursor(ARROW);
  }
  
  if (keyPressed) {
    
    switch (key) {
      
      case 'i' : zoomIn(); break;
      case 'o' : zoomOut(); break;
      
    }
    
  }
  
  sh.set("showJulia", showJulia);
  sh.set("zoom", zoom);
  sh.set("trans", trans.x, trans.y);
  
  filter(sh);  
  
}



void keyPressed () {
  if (key == ' ') {
    zoom = 1.0;
    trans = new PVector();
  } else if (key == 'j') {
    showJulia = !showJulia;    
  }
}



void mouseWheel (MouseEvent e) {
  
  if (e.getCount() < 0) {
    zoomIn();
  } else if (e.getCount() > 0 && zoom > 0.1) {
    zoomOut();
  }
  
}

void zoomIn () {
  
  zoom *= 1.05;
  
}

void zoomOut () {
  
  zoom /= 1.05;
  
}
