class Adjectif{

  String name;
  int number;
  
  Adjectif(TableRow row){
    name = row.getString("Adjectif");
    number = row.getInt("Number");
  }
}
