// VARIABLE
ArrayList<Artist> artists;
Table table;
Activity[] activities = new Activity[6];

color[] colors = {#4e2a62, #73d34c, #883ec8, #cccd4f, #736ecb, #7ed393, #cc4ea3, #587539, #d44944, #7ec6c4,
              #c68239, #678cb5, #7e3c38, #ccb590, #3b3e39, #cb94b7};

int choix = 6;

//SETUP
//définition de la fenêtre, creation des activités, recupération des artistes, ajout des couleurs
void setup() {
  size(1000, 800);
  background(255);
  
  activities[0] = new Activity("Sleep");
  activities[1] = new Activity("Primary Work");
  activities[2] = new Activity("Social and meals");
  activities[3] = new Activity("Exercise");
  activities[4] = new Activity("Other works");
  activities[5] = new Activity("Making ends meet");
  
  artists = new ArrayList<Artist>();
  table = loadTable("creative-routines.csv", "header");
  println(table.getRowCount() + " total Rows in a table");
  
  for (TableRow row : table.rows()) {
    artists.add(new Artist(row));
  }
  
  for (int i=0; i<16; i++){
     Artist artist = artists.get(i);
     artist.c = colors[i];
  }  
}

//DRAW
//dessine la fenêtre, le titre, la légende, défini l'espace pour le contenu et appelle la fonction graph
void draw(){

  PFont Smooth = createFont("Segoe Print", 13);
  PFont Straight = createFont("Segoe UI", 13);

  //definition de l'espace de la fenetre
  int hMargin =30; //x
  int vMargin =30; //y
  int vGraph = vMargin + 150; 
  int vizWidth = (width-2*hMargin);
  int vizHeight = (height-2*vMargin) - 160;
  
  int heightPerData = floor(vizHeight/artists.size()-5);
  
  nettoyer();
  //entete
  fill(0);
  textAlign(CENTER);
  textFont(Straight);
  textSize(32);
  text("CREATIVE ROUTINE", 500, vMargin+ 30);
  textFont(Smooth);
  textSize(18);
  text("~ Famous person ~", 500, vMargin + 55);
  strokeWeight(4);
  line(100, vMargin+ 80, 900, vMargin + 80);
  strokeWeight(1);
  textFont(Smooth);
  textSize(18);
  text("A way to compare the different activities of the most famous creator people ",500,vMargin+ 115);
  textAlign(LEFT);
  textFont(Straight);
  
  //graph  
  graph(vGraph, hMargin, vizHeight, vizWidth, heightPerData );
 
}


//FONCTIONS
void nettoyer() {  
  background(255);
}
