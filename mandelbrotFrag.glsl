#ifdef GL_ES
precision highp float;
#endif

uniform vec3 color1;
uniform vec3 color2;
uniform vec3 color3;
uniform vec3 color4;
uniform vec3 color5;
uniform vec3 color6;
uniform vec3 color7;
uniform vec3 color8;
uniform vec3 color9;
uniform vec3 color10;
uniform vec3 color11;
uniform vec3 color12;
uniform vec3 color13;

uniform float zoom;
uniform vec2 trans;

void main () {
  
  vec3 colors[13] = {color1/255, color2/255, color3/255, color4/255, color5/255, color6/255, color7/255, color8/255, color9/255, color10/255, color11/255, color12/255, color13/255};
  
  vec2 pos0 = vec2(((gl_FragCoord.x)/300.0 - 2.5)/zoom + (trans.x/300.0), ((gl_FragCoord.y)/300.0 - 1.0)/zoom + (trans.y/300.0));
  vec2 pos = vec2(0.0, 0.0);
  
  int iteration = 0;
  int max_iteration = 1000;
  
  while (length(pos) <= 2.0 && iteration < max_iteration) {
    
    float xtemp = pos.x*pos.x - pos.y*pos.y + pos0.x;
    pos.y = 2.0 * pos.x * pos.y + pos0.y;
    pos.x = xtemp;
    iteration += 1;
    
  }
  
  int index = (iteration * 13) / max_iteration;
  
  gl_FragColor = vec4(colors[index], 1.0);
  
}
