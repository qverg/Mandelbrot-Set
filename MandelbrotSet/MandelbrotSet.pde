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
  
  
  
  sh.set("color1", 0.0, 0.0, 0.0);           // midnight black
  sh.set("color2", 2.0, 30.0, 68.0);         // prussian blue
  sh.set("color3", 10.0, 52.0, 16.0);        // sap green
  sh.set("color4", 12.0, 0.0, 64.0);         // phthalo blue
  sh.set("color5", 16.0, 46.0, 60.0);        // phthalo green
  sh.set("color6", 34.0, 27.0, 21.0);        // van dyke brown
  sh.set("color7", 78.0, 21.0, 0.0);         // alizarin crimson
  sh.set("color8", 95.0, 46.0, 31.0);        // dark sienna
  sh.set("color9", 199.0, 155.0, 0.0);       // yellow ochre
  sh.set("color10", 219.0, 0.0, 0.0);        // bright red
  sh.set("color11", 255.0, 236.0, 0.0);      // cadmium yellow
  sh.set("color12", 255.0, 184.0, 0.0);     // indian yellow
  sh.set("color13", 255.0, 255.0, 255.0);    // titanium white
  
  
  
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
