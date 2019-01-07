//VARIABLE
ArrayList<Adjectif> adjCourant;
ArrayList<Adjectif> adjTheme;
Table tableCourant; 
Table tableTheme;

//SETUP
void setup() {
  size(800, 800);
  background(255);
  //classe définie dans un autre fichier
  adjCourant = new ArrayList<Adjectif>();
  adjTheme = new ArrayList<Adjectif>();
  
  //prend les infos contenues dans notre csv
  tableCourant = loadTable("adjectifcourant.csv", "header");
  tableTheme = loadTable("adjectif.csv", "header");
  
  println(tableCourant.getRowCount() + " total Rows in a table1");

  for (TableRow row : tableCourant.rows()) {
    adjCourant.add(new Adjectif(row));
  }
  
  println(tableTheme.getRowCount() + " total Rows in a table2");

  for (TableRow row : tableTheme.rows()) {
    adjTheme.add(new Adjectif(row));
  }
  
}  
