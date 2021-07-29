PShader sh;

float zoom;
float sc;
PVector trans;
float speed;

float nmx, nmy;

ArrayList<Integer> keysDown;

void setup () {
  
  size(1050, 600, P2D);
  noStroke();
  
  sh = loadShader("optimisedMandelbrotFrag.glsl");
  zoom = 1.0;
  sc = 1;
  trans = new PVector(0.0, 0.0);
  speed = 25.0;
  
  keysDown = new ArrayList<Integer>();
  
  // https://www.rapidtables.com/web/color/html-color-codes.html
    
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
  
  if (e.getCount() < 0 && zoom < 60000) {
    zoom *= 1.05;
  } else if (e.getCount() > 0 && zoom > 0.1) {
    zoom /= 1.05;
  }
  
}
