// VARIABLE
ArrayList<Artist> artists;
Table table;

int choix = 6;

//SETUP
void setup() {
  size(800, 800);
  background(255);
  //classe définie dans un autre fichier
  artists = new ArrayList<Artist>();
  //prend les infos contenues dans notre csv
  table = loadTable("creative-routines.csv", "header");
  //frame.setResizable(true);
  //test verification de l'import des données 
  println(table.getRowCount() + " total Rows in a table");

  for (TableRow row : table.rows()) {
    artists.add(new Artist(row));
  }
}

//DRAW
void draw(){
  PFont Smooth = createFont("Segoe Print", 12);
  PFont Straight = createFont("Segoe UI", 12);
  
  //definition de l'espace de la fenetre
  int hMargin =50;
  int vMargin =180;
  int vizWidth = width-2*hMargin;
  int vizHeight = height-2*vMargin;

  int heightPerData = floor(vizHeight/artists.size());

  //taille maximale d'un histo (les autres sont calculés à partir du plus grand par règles de trois)
  int maxSleep = 20; // plus c'est grand, plus l'histo est petit
  
  nettoyer();
  //entete
  fill(0);
  textAlign(CENTER);
  textFont(Straight);
  textSize(32);
  text("CREATIVE ROUTINE", 400, 30);
  textFont(Smooth);
  textSize(17);
  text("~ Famous person ~", 400, 55);
  strokeWeight(3);
  line(100, 70, 700, 70);
  strokeWeight(1);
  
  //choix
  textAlign(LEFT);
  textFont(Smooth);
  text("A way to compare the different activities of the most famous creator people ",hMargin,110);
  textFont(Straight);
  text("Select activity: 0 - sleep, 1 - primary work, 2 - social meals, 3 - exercice, 4 - other works, 5 - making ends meet ", hMargin, 130);
  textSize(11);
  
  //histogramme
  histo(hMargin,  vMargin,  vizWidth, maxSleep,  heightPerData);
    
 
}


//FONCTIONS
 void histo(int hMargin, int vMargin, int vizWidth, int maxSleep, int heightPerData){ 
//construction de l'histogramme
  for (int i=0; i <artists.size(); i++) {
    Artist artist = artists.get(i);
    
    int currentWidth = 0;
    int currentActivity = 0;
    
    int sleepWidth = (int)(artist.sleep * vizWidth/maxSleep);
    int primaryWorkWidth  = (int)(artist.primaryWork * vizWidth/maxSleep);
    int socialMealWidth = (int)(artist.socialMeals * vizWidth/maxSleep);
    int exerciceWidth = (int)(artist.exercice * vizWidth/maxSleep);
    int otherWorkWidth = (int)(artist.otherWorks * vizWidth/maxSleep);
    int makingWidth = (int)(artist.makingEndsMeet * vizWidth/maxSleep);
    
    if (keyPressed) {
      if (key == '0') {
        choix=0;
        
      }
      else if (key == '1'){
        choix=1;
      }
      else if (key == '2'){
        choix=2;
      }
      else if (key == '3'){
        choix=3;
      }
      else if (key == '4'){
        choix=4;
      }  
      else if (key == '5'){
        choix=5;
      }
    }
    
    

    switch(choix) {
      case 0: 
        currentWidth = sleepWidth;
        currentActivity = (int)(artist.sleep);
        text("Sleep", hMargin, 150);
        break;
      case 1: 
        currentWidth = primaryWorkWidth;
        currentActivity = (int)(artist.primaryWork);
        text("Primary work", hMargin, 150);
        break;
      case 2: 
        currentWidth = socialMealWidth;
        currentActivity = (int)(artist.socialMeals);
        text("Social meals", hMargin, 150);
        break;
      case 3: 
        currentWidth = exerciceWidth;
        currentActivity = (int)(artist.exercice);
        text("Exercice", hMargin, 150);
        break;
      case 4: 
        currentWidth = otherWorkWidth;
        currentActivity = (int)(artist.otherWorks);
        text("Other works", hMargin, 150);
        break;
      case 5: 
        currentWidth = makingWidth;
        currentActivity = (int)(artist.makingEndsMeet);
        text("Making ends meet", hMargin, 150);
        break;
    }
        
    fill(93, 240, 220);
    stroke(43, 190, 170);
    rect(hMargin + 160, i* heightPerData + vMargin, currentWidth, heightPerData-2 );
    stroke(0);
    fill(0);
    textAlign(LEFT);
    strokeWeight(1);
    text(artist.name, hMargin, i* heightPerData + vMargin+20);
    
    if ( (mouseX> hMargin +160)&&(mouseX < hMargin+160+currentWidth)&&(mouseY>i* heightPerData + vMargin)&&(mouseY<i* heightPerData + vMargin+ heightPerData-2)) {
      fill(25, 127, 113);
      stroke(15, 117, 103);
      rect(hMargin +160, i* heightPerData + vMargin, currentWidth, heightPerData-2 );
      stroke(0);
      fill(0);
      text(currentActivity, hMargin+170+currentWidth, i* heightPerData + vMargin+20);
          
    }    
  }
}

void nettoyer() {  
  background(255);
}
