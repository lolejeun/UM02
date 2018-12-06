  
void graph(int vGraph, int hMargin, int vizHeight, int vizWidth, int heightPerData ){
  
  PFont Smooth = createFont("Segoe Print", 13);
  PFont Straight = createFont("Segoe UI", 13);
  
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
  text("ARTISTS:", hScale+20, vScale + 25);
  for (int i=0; i <artists.size(); i++) {
    Artist artist = artists.get(i);
    fill(artist.c);
    
    if ( (mouseX> hScale+25)&&(mouseX < scaleWidth)&&(mouseY>i* heightPerData + vScale+45)&&(mouseY<i* heightPerData + vScale+65)) {
      textFont(Smooth);
    }
    text(artist.name, hScale+25, i* heightPerData + vScale+55);
    textFont(Straight);
  }
  
  //graphique
  int hPlot = hScale+scaleWidth+10; 
  int vPlot = vGraph+ 10;
  int plotHeight = vizHeight-2*10;
  int plotWidth = 3*vizWidth/4-3*10;   
  fill(255);
  rect(hPlot, vPlot, plotWidth, plotHeight);
  
  //echelle 
  for (int i=0; i<6;i++){
    float t = plotWidth/6; 
    Activity activity = activities[i];
    activity.x = hPlot+40+ t*i;
    fill(0);
    textAlign(CENTER);
    text(activity.name, hPlot+40+ t*i, vPlot+25);
    line(hPlot+40+ t*i, vPlot+30, hPlot+40+ t*i, vPlot+plotHeight);    
  }
  strokeWeight(0.1);
  float init = 85; 
  float x = 52.7;
  text("13.5", hPlot + plotWidth - 20, vPlot+init);
  line(hPlot +40,vPlot+init, hPlot + plotWidth - 40, vPlot+init);
  text("12", hPlot + plotWidth - 20, vPlot+init+x);
  line(hPlot +40,vPlot+init+x, hPlot + plotWidth - 40, vPlot+init+x);
  text("10.5", hPlot + plotWidth - 20, vPlot+init+2*x);
  line(hPlot +40,vPlot+init+2*x, hPlot + plotWidth - 40, vPlot+init+2*x);
  text("9", hPlot + plotWidth - 20, vPlot+init+3*x);
  line(hPlot +40,vPlot+init+3*x, hPlot + plotWidth - 40, vPlot+init+3*x);
  text("7.5", hPlot + plotWidth - 20, vPlot+init+4*x);
  line(hPlot +40,vPlot+init+4*x, hPlot + plotWidth - 40, vPlot+init+4*x);
  text("6", hPlot + plotWidth - 20, vPlot+init+5*x);
  line(hPlot +40,vPlot+init+5*x, hPlot + plotWidth - 40, vPlot+init+5*x);
  text("4.5", hPlot + plotWidth - 20, vPlot+init+6*x);
  line(hPlot +40,vPlot+init+6*x, hPlot + plotWidth - 40, vPlot+init+6*x);
  text("3", hPlot + plotWidth - 20, vPlot+init+7*x);
  line(hPlot +40,vPlot+init+7*x, hPlot + plotWidth - 40, vPlot+init+7*x);
  text("1.5", hPlot + plotWidth - 20, vPlot+init+8*x);
  line(hPlot +40,vPlot+init+8*x, hPlot + plotWidth - 40, vPlot+init+8*x);
  text("0", hPlot + plotWidth - 20, vPlot+init+9*x -10);
  line(hPlot +40,vPlot+init+9*x, hPlot + plotWidth - 40, vPlot+init+9*x);  
  println(plotHeight);
  
  //courbe
  int coef = 35;
  for (int i= 0 ; i<artists.size(); i ++){
    Artist artist = artists.get(i);
    stroke(artist.c);
    if ( (mouseX> hScale+25)&&(mouseX < scaleWidth)&&(mouseY>i* heightPerData + vScale+45)&&(mouseY<i* heightPerData + vScale+65)) {
      strokeWeight(6);
    }
    else{
      strokeWeight(2);
    }
    line(activities[0].x, vPlot+plotHeight- artist.sleep*coef, activities[1].x, vPlot+plotHeight- artist.primaryWork*coef);
    line(activities[1].x, vPlot+plotHeight- artist.primaryWork*coef, activities[2].x, vPlot+plotHeight- artist.socialMeals*coef);
    line(activities[2].x, vPlot+plotHeight- artist.socialMeals*coef, activities[3].x, vPlot+plotHeight- artist.exercice*coef);
    line(activities[3].x, vPlot+plotHeight- artist.exercice*coef, activities[4].x, vPlot+plotHeight- artist.otherWorks*coef);
    line(activities[4].x, vPlot+plotHeight- artist.otherWorks*coef, activities[5].x, vPlot+plotHeight- artist.makingEndsMeet*coef);
  }
  stroke(0);
  strokeWeight(1);
}
