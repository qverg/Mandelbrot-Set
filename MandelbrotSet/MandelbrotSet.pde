PShader sh;

float zoom;
PVector trans;
float speed;

ArrayList<Integer> keysDown;

void setup () {
  
  size(1050, 600, P2D);
  noStroke();
  
  sh = loadShader("mandelbrotFrag.glsl");
  zoom = 1.0;
  trans = new PVector(0.0, 0.0);
  speed = 15.0;
  
  keysDown = new ArrayList<Integer>();
  
  
  
  sh.set("color1", 0.0, 4.0, 13.0);
  sh.set("color2", 0.0, 49.0, 83.0);
  sh.set("color3", 80.0, 125.0, 42.0);
  sh.set("color4", 0.0, 15.0, 137.0);
  sh.set("color5", 18.0, 53.0, 36.0);
  sh.set("color6", 102.0, 66.0, 40.0);
  sh.set("color7", 227.0, 38.0, 54.0);
  sh.set("color8", 60.0, 20.0, 20.0);
  sh.set("color9", 203.0, 157.0, 6.0);
  sh.set("color10", 225.0, 6.0, 0.0);
  sh.set("color11", 255.0, 246.0, 0.0);
  sh.set("color12", 227.0, 168.0, 87.0);
  sh.set("color13", 243.0, 244.0, 247.0);
  
  
  
}

void draw () {
  for (int c : keysDown) {
    
    if (c == UP) {
      trans.y += speed / zoom;
    } else if (c == DOWN) {
      trans.y -= speed / zoom;
    } else if (c == LEFT) {
      trans.x -= speed / zoom;
    } else if (c == RIGHT) {
      trans.x += speed / zoom;
    }
    
  }
  
  if (mousePressed) {
    cursor(MOVE);
    trans.y += (mouseY - pmouseY) / zoom;
    trans.x -= (mouseX - pmouseX) / zoom;
  } else {
    cursor(ARROW);
  }
  
  sh.set("zoom", zoom);
  sh.set("trans", trans.x, trans.y);
  
  filter(sh);
  //rect(0,0,width,height);
  
  
}



void keyPressed () {
  
  if (!keysDown.contains(keyCode)) {
    keysDown.add(keyCode);
  }
  
}

void keyReleased () {
  
  if (keysDown.contains(keyCode)) {
    keysDown.remove(keysDown.indexOf(keyCode));
  }
  
}

void mouseWheel (MouseEvent e) {
  
  if (e.getCount() < 0 ) zoom *= 1.1;     // && zoom < 14000      <=== zoom limit
  else if (e.getCount() > 0 && zoom > 0.1) zoom /= 1.1;
  
}
