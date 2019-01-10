class Net {
  String name; 
  int a2016;
  int a2017;
  int a2018;
  color c;

  Net(TableRow row){
    name = row.getString("network");
    a2016 = row.getInt("2016");
    a2017 = row.getInt("2017");
    a2018 = row.getInt("2018");
  }
}
