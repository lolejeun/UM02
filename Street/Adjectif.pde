class Adjectif{

  String name;
  int number;
  float percentage;
  
  Adjectif(TableRow row){
    number = row.getInt("Number");
    percentage = row.getFloat("Pourcentage");
    name = row.getString("Name");
  }
}
