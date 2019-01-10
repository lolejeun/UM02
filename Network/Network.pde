ArrayList<Net> networks; 
Table table; 

color[] colors = {#4e2a62, #73d34c, #883ec8, #cccd4f, #736ecb, #7ed393, #cc4ea3, #587539, #d44944};

//SETUP
//définition de la fenêtre, creation des activités, recupération des artistes, ajout des couleurs
void setup() {
  size(800, 1000);
  background(255);
  
  networks = new ArrayList<Net>();
  table = loadTable("network.csv", "header");
  println(table.getRowCount() + " total Rows in a table");
  
  for (TableRow row : table.rows()) {
    networks.add(new Net(row));
  }
  
  for (int i=0; i<9; i++){
     Net network = networks.get(i);
     network.c = colors[i];
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
  
  int heightPerData = floor(vizHeight/networks.size()-5);
  
  nettoyer();
  //entete
  fill(0);
  textAlign(CENTER);
  textFont(Straight);
  textSize(32);
  text("NETWORK RACE", width/2, vMargin+ 30);
  textFont(Smooth);
  textSize(18);
  text("~ Will the king Facebook be dethroned someday? ~", width/2, vMargin + 55);
  strokeWeight(4);
  line(100, vMargin+ 80, 700, vMargin + 80);
  strokeWeight(1);
  textFont(Straight);
  textSize(17);
  text("Number of social network user during the past three years in MUA (month user activity) in millions ",width/2,vMargin+ 115);
  textAlign(LEFT);
  
  //graph  
  graph(vGraph, hMargin, vizHeight, vizWidth, heightPerData );
 
 //source 
 textSize(12);
 text("https://www.blogdumoderateur.com/50-chiffres-medias-sociaux-2016/",hMargin,vizHeight +200);
 
}


//FONCTIONS
void nettoyer() {  
  background(255);
}
