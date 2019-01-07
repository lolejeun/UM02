void graph(int vGraph, int hMargin, int vizHeight, int vizWidth, int heightPerData ){
  
  PFont Smooth = createFont("Segoe Print", 13);
  PFont Straight = createFont("Segoe UI", 20);
  
  fill(255);
  //rect(hMargin, vGraph, vizWidth, vizHeight);  
  
  //legende
  int hScale = hMargin+40; 
  int vScale = vGraph+ 10;
  int scaleHeight = vizHeight-2*10;
  int scaleWidth = (vizWidth/5);
  //fill(255);
  //rect(hScale, vScale, scaleWidth, scaleHeight);
  //fill(0);
  
  //graphique
  int hPlot = hScale+scaleWidth+10; 
  int vPlot = vGraph+ 10;
  int plotHeight = vizHeight-2*10;
  int plotWidth = 4*vizWidth/5-3*10;   
  //fill(255);
  //rect(hPlot, vPlot, plotWidth, plotHeight);
  
  //echelle
  fill(0);
  strokeWeight(0.1);
  text("0", hPlot, vPlot-2);
  line(hPlot,vPlot, hPlot, vPlot+plotHeight);
  text("5", hPlot+120, vPlot-2);
  line(hPlot+120,vPlot, hPlot+120, vPlot+plotHeight);
  text("10", hPlot+240, vPlot-2);
  line(hPlot+240,vPlot, hPlot+240, vPlot+plotHeight);
  text("15", hPlot+360, vPlot-2);
  line(hPlot+360,vPlot, hPlot+360, vPlot+plotHeight);
  text("20", hPlot+480, vPlot-2);
  line(hPlot+480,vPlot, hPlot+480, vPlot+plotHeight);
  
  //data
  if (keyPressed) {
      if (key == '1') {
        choix=1;
        
      }
      else if (key == '2'){
        choix=2;
      }
    }
  
  switch(choix){
    case 1: 
      temp = adjCourant;
      break;
    case 2: 
      temp = adjTheme;
      break;
  }
  
  for (int i=0; i< temp.size(); i++){
    fill(0);
    Adjectif adj = temp.get(i);
    
    textFont(Straight);
    text(adj.name, hScale+50, i* heightPerData + vScale+30);
    
    int adjWidth = (int)(adj.percentage * plotWidth/max);
    if ((choix ==2)&&((i % 2) == 0)){
      fill(90,230,171);
      stroke(141,218,203);
    }
    else {
      fill(93, 240, 220);
      stroke(43, 190, 170);
    }
    
    
    rect(hPlot, i* heightPerData + vPlot, adjWidth, heightPerData-2 );
   
    if ( (mouseX> hPlot)&&(mouseX < hPlot + adjWidth)&&(mouseY>i* heightPerData + vPlot)&&(mouseY<i* heightPerData + vPlot+ heightPerData)) {
      
      if ((choix ==2)&&((i % 2) == 0)){
        fill(71,133,115);
        stroke(141,218,203);
      }  
      else {
        fill(25, 127, 113);
        stroke(15, 117, 103);
      }
      rect(hPlot, i* heightPerData + vPlot, adjWidth, heightPerData-2);
      stroke(0);
      fill(0);
      text((adj.percentage) + "%", hPlot+adjWidth+10, i* heightPerData + vScale+30);
      
      //echelle
      strokeWeight(0.1);
      line(hPlot +adjWidth,vPlot, hPlot+adjWidth, vPlot+plotHeight);
          
    } 
  }
  
}
