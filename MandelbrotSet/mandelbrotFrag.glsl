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
uniform vec3 color14;
uniform vec3 color15;
uniform vec3 color16;
uniform vec3 color17;
uniform vec3 color18;
uniform vec3 color19;
uniform vec3 color20;
uniform vec3 color21;
uniform vec3 color22;
uniform vec3 color23;
uniform vec3 color24;
uniform vec3 color25;
uniform vec3 color26;
uniform vec3 color27;
uniform vec3 color28;
uniform vec3 color29;
uniform vec3 color30;
uniform vec3 color31;
uniform vec3 color32;
uniform vec3 color33;
uniform vec3 color34;
uniform vec3 color35;
uniform vec3 color36;
uniform vec3 color37;
uniform vec3 color38;
uniform vec3 color39;
uniform vec3 color40;
uniform vec3 color41;
uniform vec3 color42;
uniform vec3 color43;
uniform vec3 color44;
uniform vec3 color45;
uniform vec3 color46;
uniform vec3 color47;
uniform vec3 color48;
uniform vec3 color49;
uniform vec3 color50;
uniform vec3 color51;
uniform vec3 color52;
uniform vec3 color53;
uniform vec3 color54;
uniform vec3 color55;
uniform vec3 color56;
uniform vec3 color57;
uniform vec3 color58;
uniform vec3 color59;
uniform vec3 color60;
uniform vec3 color61;
uniform vec3 color62;
uniform vec3 color63;
uniform vec3 color64;
uniform vec3 color65;
uniform vec3 color66;
uniform vec3 color67;
uniform vec3 color68;
uniform vec3 color69;
uniform vec3 color70;
uniform vec3 color71;
uniform vec3 color72;
uniform vec3 color73;
uniform vec3 color74;
uniform vec3 color75;
uniform vec3 color76;
uniform vec3 color77;
uniform vec3 color78;
uniform vec3 color79;
uniform vec3 color80;
uniform vec3 color81;
uniform vec3 color82;
uniform vec3 color83;
uniform vec3 color84;
uniform vec3 color85;
uniform vec3 color86;
uniform vec3 color87;
uniform vec3 color88;
uniform vec3 color89;
uniform vec3 color90;
uniform vec3 color91;
uniform vec3 color92;
uniform vec3 color93;
uniform vec3 color94;
uniform vec3 color95;
uniform vec3 color96;
uniform vec3 color97;
uniform vec3 color98;
uniform vec3 color99;
uniform vec3 color100;
uniform vec3 color101;
uniform vec3 color102;
uniform vec3 color103;
uniform vec3 color104;
uniform vec3 color105;
uniform vec3 color106;
uniform vec3 color107;
uniform vec3 color108;
uniform vec3 color109;
uniform vec3 color110;
uniform vec3 color111;
uniform vec3 color112;
uniform vec3 color113;
uniform vec3 color114;
uniform vec3 color115;
uniform vec3 color116;
uniform vec3 color117;
uniform vec3 color118;
uniform vec3 color119;
uniform vec3 color120;
uniform vec3 color121;
uniform vec3 color122;
uniform vec3 color123;
uniform vec3 color124;
uniform vec3 color125;
uniform vec3 color126;
uniform vec3 color127;
uniform vec3 color128;
uniform vec3 color129;
uniform vec3 color130;
uniform vec3 color131;
uniform vec3 color132;
uniform vec3 color133;
uniform vec3 color134;
uniform vec3 color135;
uniform vec3 color136;
uniform vec3 color137;
uniform vec3 color138;

vec3 colors[] = vec3[](color1/256,color2/256,color3/256,color4/256,color5/256,color6/256,color7/256,color8/256,color9/256,color10/256,color11/256,color12/256,color13/256,color14/256,color15/256,color16/256,color17/256,color18/256,color19/256,color20/256,color21/256,color22/256,color23/256,color24/256,color25/256,color26/256,color27/256,color28/256,color29/256,color30/256,color31/256,color32/256,color33/256,color34/256,color35/256,color36/256,color37/256,color38/256,color39/256,color40/256,color41/256,color42/256,color43/256,color44/256,color45/256,color46/256,color47/256,color48/256,color49/256,color50/256,color51/256,color52/256,color53/256,color54/256,color55/256,color56/256,color57/256,color58/256,color59/256,color60/256,color61/256,color62/256,color63/256,color64/256,color65/256,color66/256,color67/256,color68/256,color69/256,color70/256,color71/256,color72/256,color73/256,color74/256,color75/256,color76/256,color77/256,color78/256,color79/256,color80/256,color81/256,color82/256,color83/256,color84/256,color85/256,color86/256,color87/256,color88/256,color89/256,color90/256,color91/256,color92/256,color93/256,color94/256,color95/256,color96/256,color97/256,color98/256,color99/256,color100/256,color101/256,color102/256,color103/256,color104/256,color105/256,color106/256,color107/256,color108/256,color109/256,color110/256,color111/256,color112/256,color113/256,color114/256,color115/256,color116/256,color117/256,color118/256,color119/256,color120/256,color121/256,color122/256,color123/256,color124/256,color125/256,color126/256,color127/256,color128/256,color129/256,color130/256,color131/256,color132/256,color133/256,color134/256,color135/256,color136/256,color137/256,color138/256);

uniform float zoom;
uniform vec2 trans;

void main () {
  
  if ((length(gl_FragCoord-vec2(750.5, 300.5)) < 10) && (gl_FragCoord.x == 750.5 || gl_FragCoord.y == 300.5)) {
    gl_FragColor = vec4(1.0,1.0,1.0,1.0);
  }
  
  else {
    
    
    vec2 scaledPos = vec2(gl_FragCoord.x/300.0 - 2.5, gl_FragCoord.y/300.0 - 1.0);
    vec2 scaledTrans = trans * zoom/300.0;
    //vec2 pos0 = vec2(((gl_FragCoord.x)/300.0 - 2.5)/zoom + (trans.x/300.0), ((gl_FragCoord.y)/300.0 - 1.0)/zoom + (trans.y/300.0));
    vec2 pos0 = vec2((scaledPos.x + scaledTrans.x)/zoom, (scaledPos.y + scaledTrans.y)/zoom);
    
    vec2 pos = vec2(0.0, 0.0);
    
    int iteration = 0;
    int max_iteration = 1000;
    
    while (length(pos) <= 2.0 && iteration < max_iteration) {
      
      float xtemp = pos.x*pos.x - pos.y*pos.y + pos0.x;
      pos.y = 2.0 * pos.x * pos.y + pos0.y;
      pos.x = xtemp;
      iteration += 1;
      
    }
    
    //int index = (iteration * 138) / max_iteration;
    
    float fl_iteration = float(iteration);
    float fl_max_iteration = float(max_iteration);
    
    
    int index = int(((1.5 * fl_iteration) * 138.0)/ (1.0 * fl_iteration + 500.0));
    
    float ratio = fl_iteration / fl_max_iteration;
    
    gl_FragColor = vec4(colors[index], 1.0);
}
  
  
}
