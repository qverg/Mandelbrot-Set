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
  
  sh = loadShader("mandelbrotFrag.glsl");
  zoom = 1.0;
  sc = 1;
  trans = new PVector(0.0, 0.0);
  speed = 25.0;
  
  keysDown = new ArrayList<Integer>();
  
  
  /*
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
  */
  
  sh.set("color1",128.0,0.0,0.0);
  sh.set("color2",139.0,0.0,0.0);
  sh.set("color3",165.0,42.0,42.0);
  sh.set("color4",178.0,34.0,34.0);
  sh.set("color5",220.0,20.0,60.0);
  sh.set("color6",255.0,0.0,0.0);
  sh.set("color7",255.0,99.0,71.0);
  sh.set("color8",255.0,127.0,80.0);
  sh.set("color9",205.0,92.0,92.0);
  sh.set("color10",240.0,128.0,128.0);
  sh.set("color11",233.0,150.0,122.0);
  sh.set("color12",250.0,128.0,114.0);
  sh.set("color13",255.0,160.0,122.0);
  sh.set("color14",255.0,69.0,0.0);
  sh.set("color15",255.0,140.0,0.0);
  sh.set("color16",255.0,165.0,0.0);
  sh.set("color17",255.0,215.0,0.0);
  sh.set("color18",184.0,134.0,11.0);
  sh.set("color19",218.0,165.0,32.0);
  sh.set("color20",238.0,232.0,170.0);
  sh.set("color21",189.0,183.0,107.0);
  sh.set("color22",240.0,230.0,140.0);
  sh.set("color23",128.0,128.0,0.0);
  sh.set("color24",255.0,255.0,0.0);
  sh.set("color25",154.0,205.0,50.0);
  sh.set("color26",85.0,107.0,47.0);
  sh.set("color27",107.0,142.0,35.0);
  sh.set("color28",124.0,252.0,0.0);
  sh.set("color29",127.0,255.0,0.0);
  sh.set("color30",173.0,255.0,47.0);
  sh.set("color31",0.0,100.0,0.0);
  sh.set("color32",0.0,128.0,0.0);
  sh.set("color33",34.0,139.0,34.0);
  sh.set("color34",0.0,255.0,0.0);
  sh.set("color35",50.0,205.0,50.0);
  sh.set("color36",144.0,238.0,144.0);
  sh.set("color37",152.0,251.0,152.0);
  sh.set("color38",143.0,188.0,143.0);
  sh.set("color39",0.0,250.0,154.0);
  sh.set("color40",0.0,255.0,127.0);
  sh.set("color41",46.0,139.0,87.0);
  sh.set("color42",102.0,205.0,170.0);
  sh.set("color43",60.0,179.0,113.0);
  sh.set("color44",32.0,178.0,170.0);
  sh.set("color45",47.0,79.0,79.0);
  sh.set("color46",0.0,128.0,128.0);
  sh.set("color47",0.0,139.0,139.0);
  sh.set("color48",0.0,255.0,255.0);
  sh.set("color49",0.0,255.0,255.0);
  sh.set("color50",224.0,255.0,255.0);
  sh.set("color51",0.0,206.0,209.0);
  sh.set("color52",64.0,224.0,208.0);
  sh.set("color53",72.0,209.0,204.0);
  sh.set("color54",175.0,238.0,238.0);
  sh.set("color55",127.0,255.0,212.0);
  sh.set("color56",176.0,224.0,230.0);
  sh.set("color57",95.0,158.0,160.0);
  sh.set("color58",70.0,130.0,180.0);
  sh.set("color59",100.0,149.0,237.0);
  sh.set("color60",0.0,191.0,255.0);
  sh.set("color61",30.0,144.0,255.0);
  sh.set("color62",173.0,216.0,230.0);
  sh.set("color63",135.0,206.0,235.0);
  sh.set("color64",135.0,206.0,250.0);
  sh.set("color65",25.0,25.0,112.0);
  sh.set("color66",0.0,0.0,128.0);
  sh.set("color67",0.0,0.0,139.0);
  sh.set("color68",0.0,0.0,205.0);
  sh.set("color69",0.0,0.0,255.0);
  sh.set("color70",65.0,105.0,225.0);
  sh.set("color71",138.0,43.0,226.0);
  sh.set("color72",75.0,0.0,130.0);
  sh.set("color73",72.0,61.0,139.0);
  sh.set("color74",106.0,90.0,205.0);
  sh.set("color75",123.0,104.0,238.0);
  sh.set("color76",147.0,112.0,219.0);
  sh.set("color77",139.0,0.0,139.0);
  sh.set("color78",148.0,0.0,211.0);
  sh.set("color79",153.0,50.0,204.0);
  sh.set("color80",186.0,85.0,211.0);
  sh.set("color81",128.0,0.0,128.0);
  sh.set("color82",216.0,191.0,216.0);
  sh.set("color83",221.0,160.0,221.0);
  sh.set("color84",238.0,130.0,238.0);
  sh.set("color85",255.0,0.0,255.0);
  sh.set("color86",218.0,112.0,214.0);
  sh.set("color87",199.0,21.0,133.0);
  sh.set("color88",219.0,112.0,147.0);
  sh.set("color89",255.0,20.0,147.0);
  sh.set("color90",255.0,105.0,180.0);
  sh.set("color91",255.0,182.0,193.0);
  sh.set("color92",255.0,192.0,203.0);
  sh.set("color93",250.0,235.0,215.0);
  sh.set("color94",245.0,245.0,220.0);
  sh.set("color95",255.0,228.0,196.0);
  sh.set("color96",255.0,235.0,205.0);
  sh.set("color97",245.0,222.0,179.0);
  sh.set("color98",255.0,248.0,220.0);
  sh.set("color99",255.0,250.0,205.0);
  sh.set("color100",250.0,250.0,210.0);
  sh.set("color101",255.0,255.0,224.0);
  sh.set("color102",139.0,69.0,19.0);
  sh.set("color103",160.0,82.0,45.0);
  sh.set("color104",210.0,105.0,30.0);
  sh.set("color105",205.0,133.0,63.0);
  sh.set("color106",244.0,164.0,96.0);
  sh.set("color107",222.0,184.0,135.0);
  sh.set("color108",210.0,180.0,140.0);
  sh.set("color109",188.0,143.0,143.0);
  sh.set("color110",255.0,228.0,181.0);
  sh.set("color111",255.0,222.0,173.0);
  sh.set("color112",255.0,218.0,185.0);
  sh.set("color113",255.0,228.0,225.0);
  sh.set("color114",255.0,240.0,245.0);
  sh.set("color115",250.0,240.0,230.0);
  sh.set("color116",253.0,245.0,230.0);
  sh.set("color117",255.0,239.0,213.0);
  sh.set("color118",255.0,245.0,238.0);
  sh.set("color119",245.0,255.0,250.0);
  sh.set("color120",112.0,128.0,144.0);
  sh.set("color121",119.0,136.0,153.0);
  sh.set("color122",176.0,196.0,222.0);
  sh.set("color123",230.0,230.0,250.0);
  sh.set("color124",255.0,250.0,240.0);
  sh.set("color125",240.0,248.0,255.0);
  sh.set("color126",248.0,248.0,255.0);
  sh.set("color127",240.0,255.0,240.0);
  sh.set("color128",255.0,255.0,240.0);
  sh.set("color129",240.0,255.0,255.0);
  sh.set("color130",255.0,250.0,250.0);
  sh.set("color131",0.0,0.0,0.0);
  sh.set("color132",105.0,105.0,105.0);
  sh.set("color133",128.0,128.0,128.0);
  sh.set("color134",169.0,169.0,169.0);
  sh.set("color135",192.0,192.0,192.0);
  sh.set("color136",211.0,211.0,211.0);
  sh.set("color137",220.0,220.0,220.0);
  sh.set("color138",245.0,245.0,245.0);
  
  
}

void draw () {
  background(0);
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
  
  shader(sh);
  rect(0,0,width,height);
  
  
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
