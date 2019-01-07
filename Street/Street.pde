//VARIABLE
ArrayList<Adjectif> adjCourant;
Table tableCourant; 

ArrayList<Adjectif> adjTheme;
Table tableTheme;

ArrayList<Adjectif> temp;

int choix =0;
int max = 30;

//SETUP
void setup() {
  size(1000, 800);
  background(255);
  
  temp = new ArrayList<Adjectif>();
  //classe définie dans un autre fichier
  adjCourant = new ArrayList<Adjectif>();  
  //prend les infos contenues dans notre csv
  tableCourant = loadTable("adjectifcourant.csv", "header");
  
  println(tableCourant.getRowCount() + " total Rows in a table1");

  for (TableRow row : tableCourant.rows()) {
    adjCourant.add(new Adjectif(row));
  }
  
  //classe définie dans un autre fichier
  adjTheme = new ArrayList<Adjectif>();  
  //prend les infos contenues dans notre csv
  tableTheme = loadTable("adjectif.csv", "header");
  
  println(tableTheme.getRowCount() + " total Rows in a table1");

  for (TableRow row : tableTheme.rows()) {
    adjTheme.add(new Adjectif(row));
  }
  
}
  
//DRAW
void draw(){

  PFont Smooth = createFont("Segoe Print", 20);
  PFont Straight = createFont("Segoe UI", 16);

  //definition de l'espace de la fenetre
  int hMargin =30; //x
  int vMargin =30; //y
  int vGraph = vMargin + 250; 
  int vizWidth = (width-2*hMargin);
  int vizHeight = (height-2*vMargin) - 300;
  
  int heightPerData = floor(vizHeight/adjCourant.size()-2);
  
  nettoyer();
  //entete
  stroke(0);
  fill(0);
  textAlign(CENTER);
  textFont(Straight);
  textSize(32);
  text("ADJECTIFS COURANTS DANS LES RUES FRANCAISES", 500, vMargin+ 30);
  textFont(Smooth);
  textSize(22);
  text("~ Tradition et ancienneté avant la beauté ~", 500, vMargin + 85);
  textSize(16);
  text("Adjectifs les plus employés pour désigner les odonymes ou voie de communication en France ",500,vMargin+ 115);
  strokeWeight(4);
  line(100, vMargin+ 150, 900, vMargin + 150);
  strokeWeight(1);
  textAlign(LEFT);
  textFont(Straight);
  text("Pourcentage de présence de l'adjectif : PRESS 1 - les plus présents, PRESS 2 - thèmes opposés  ",hMargin+90,vMargin+ 200);
  
  //graph  
  graph(vGraph, hMargin, vizHeight, vizWidth, heightPerData );


}  
  
//FONCTIONS
void nettoyer() {  
  background(255);
}  
