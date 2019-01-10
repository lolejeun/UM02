void graph(int vGraph, int hMargin, int vizHeight, int vizWidth, int heightPerData ){
  
  PFont Smooth = createFont("Segoe Print", 13);
  PFont Straight = createFont("Segoe UI", 15);
  
  fill(0);
  rect(hMargin, vGraph, vizWidth, vizHeight);  
  
  //legende
  int hScale = hMargin+10; 
  int vScale = vGraph+ 10;
  int scaleHeight = vizHeight-2*10;
  int scaleWidth = (vizWidth/4);
  fill(255);
  rect(hScale, vScale, scaleWidth, scaleHeight);
  fill(0);
  text("SOCIAL NETWORK:", hScale+20, vScale + 25);
  for (int i=0; i <networks.size(); i++) {
    Net network = networks.get(i);
    fill(network.c);
    
    if ( (mouseX> hScale+25)&&(mouseX < scaleWidth)&&(mouseY>i* heightPerData + vScale+45)&&(mouseY<i* heightPerData + vScale+65)) {
      textFont(Smooth);
    }
    text(network.name, hScale+25, i* heightPerData + vScale+55);
    textFont(Straight);
  }
  
  //graphique
  int hPlot = hScale+scaleWidth+10; 
  int vPlot = vGraph+ 10;
  int plotHeight = vizHeight-2*10;
  int plotWidth = 3*vizWidth/4-3*10;   
  fill(255);
  rect(hPlot, vPlot, plotWidth, plotHeight);
  
  //courbe
  float coef = 0.35;
  for (int i= 0 ; i<networks.size(); i ++){
    Net network = networks.get(i);
    stroke(network.c);
    if ( (mouseX> hScale+25)&&(mouseX < scaleWidth)&&(mouseY>i* heightPerData + vScale+45)&&(mouseY<i* heightPerData + vScale+65)) {
      strokeWeight(6);
    }
    else{
      strokeWeight(3);
    }
    line(hPlot+50, vPlot+plotHeight- network.a2016*coef, hPlot+plotWidth/2, vPlot+plotHeight- network.a2017*coef);
    line(hPlot+plotWidth/2, vPlot+plotHeight- network.a2017*coef, hPlot+plotWidth-50, vPlot+plotHeight- network.a2018*coef);

  }
  stroke(0);
  strokeWeight(0.5);
  
  //echelle
  fill(0);
  textAlign(CENTER);
  text("2016", hPlot+50, vPlot+20);
  line(hPlot+50, vPlot+30,hPlot+50, vPlot+plotHeight-10);
  text("2017", hPlot+plotWidth/2, vPlot+20);
  line(hPlot+plotWidth/2, vPlot+30,hPlot+plotWidth/2, vPlot+plotHeight-10);
  text("2018", hPlot+plotWidth -50, vPlot+20);
  line(hPlot+plotWidth-50, vPlot+30,hPlot+plotWidth-50, vPlot+plotHeight-10);  
  
  textAlign(LEFT);
  text("2000", hPlot + 10, vPlot +40);
  line(hPlot +45, vPlot+40, hPlot + plotWidth -50, vPlot+40 );
  text("1500", hPlot + 10, vPlot +40+ plotHeight/4);
  line(hPlot +45, vPlot+40+ plotHeight/4, hPlot + plotWidth -50, vPlot+40+ plotHeight/4 );
  text("1000", hPlot + 10, vPlot +40+ plotHeight/2);
  line(hPlot +45, vPlot+40+ plotHeight/2, hPlot + plotWidth -50, vPlot +40+ plotHeight/2 );
  text("500", hPlot + 10, vPlot +40+ 3*plotHeight/4);
  line(hPlot +45, vPlot+40+ 3*plotHeight/4, hPlot + plotWidth -50, vPlot+40+ 3*plotHeight/4 );
  
}
