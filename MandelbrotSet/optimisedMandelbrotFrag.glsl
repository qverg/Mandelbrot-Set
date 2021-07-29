#ifdef GL_ES
precision highp float;
#endif


vec3 colors[] = vec3[](
  vec3(1.0, 0.09999999999999998, 0.0),
  vec3(1.0, 0.30000000000000004, 0.0),
  vec3(1.0, 0.5, 0.0),
  vec3(1.0, 0.7, 0.0),
  vec3(1.0, 0.9, 0.0),
  vec3(0.8999999999999999, 1.0, 0.0),
  vec3(0.7, 1.0, 0.0),
  vec3(0.5, 1.0, 0.0),
  vec3(0.30000000000000004, 1.0, 0.0),
  vec3(0.10000000000000009, 1.0, 0.0),
  vec3(0.10000000000000009, 1.0, 0.0),
  vec3(0.2999999999999998, 1.0, 0.0),
  vec3(0.5, 1.0, 0.0),
  vec3(0.7000000000000002, 1.0, 0.0),
  vec3(0.8999999999999999, 1.0, 0.0),
  vec3(0.0, 0.8999999999999999, 1.0),
  vec3(0.0, 0.7000000000000002, 1.0),
  vec3(0.0, 0.5, 1.0),
  vec3(0.0, 0.2999999999999998, 1.0),
  vec3(0.0, 0.10000000000000009, 1.0),
  vec3(0.09999999999999964, 0.0, 1.0),
  vec3(0.2999999999999998, 0.0, 1.0),
  vec3(0.5, 0.0, 1.0),
  vec3(0.7000000000000002, 0.0, 1.0),
  vec3(0.9000000000000004, 0.0, 1.0),
  vec3(1.0, 0.0, 0.9000000000000004),
  vec3(1.0, 0.0, 0.7000000000000002),
  vec3(1.0, 0.0, 0.5),
  vec3(1.0, 0.0, 0.2999999999999998),
  vec3(1.0, 0.0, 0.09999999999999964));

uniform float zoom;
uniform vec2 trans;

void main () {
  
  if ((length(gl_FragCoord-vec2(750.5, 300.5)) < 10) && (gl_FragCoord.x == 750.5 || gl_FragCoord.y == 300.5)) {
    gl_FragColor = vec4(1.0,1.0,1.0,1.0);
  }
  
  else {
    
    
    vec2 scaledPos = vec2(gl_FragCoord.x/300.0 - 2.5, gl_FragCoord.y/300.0 - 1.0);
    vec2 scaledTrans = trans * zoom/300.0;
    vec2 pos0 = vec2((scaledPos.x + scaledTrans.x)/zoom, (scaledPos.y + scaledTrans.y)/zoom);
    
    float x = 0.0;
    float y = 0.0;
    float x2 = 0.0;
    float y2 = 0.0;
    
    
    int iteration = 0;
    int max_iteration = 1000;
    
    while (x2 + y2 <= 4.0 && iteration < max_iteration) {
      
      y = (x + x) * y + pos0.y;
      x = x2 - y2 + pos0.x;
      x2 = x * x;
      y2 = y * y;
      
      iteration += 1;
      
    }
    
    float fl_iteration = float(iteration);
    float fl_max_iteration = float(max_iteration);
    if (iteration < max_iteration) {
      
      float log_zn = log(x*x + y*y) / 2;
      float nu = log(log_zn / log(2)) / log(2);
      
      fl_iteration += 1 - nu;
      
    }
    
    int index = int(mod((fl_iteration) / (0.5 * log(zoom)+1.0) , colors.length())); // 
    vec3 c1 = colors[index];
    vec3 c2 = colors[int(mod(index + 1, colors.length()))];
    
    vec3 c = mix(c1, c2, mod(fl_iteration, 1.0)); // a - (b * floor(a/b))
    gl_FragColor = (iteration == max_iteration) ? vec4(0.0,0.0,0.0,1.0) : vec4(c, 1.0);
    
  }
  
}
