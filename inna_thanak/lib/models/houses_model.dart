class House{
  String id;
  int rooms;
  int bathrooms;
  bool isFurniture;
  bool isAC;
  String forWhome;
  int keyMoney;
  int rental;
  bool isNegotiable;
  String location;
  String contactNumber;
  String description;
  bool isKitchen;

  House(this.id,this.rooms,this.bathrooms,this.isAC,this.description,this.forWhome,this.isFurniture,this.isKitchen,this.isNegotiable,this.keyMoney,this.rental,this.location,this.contactNumber);

  static List<House> fetchAll(){
    return[
      House("1", 3, 2, true, "this is description", "Girls", true, true, true, 20000, 5000,"Borella","O71xxxxxxxx"),
      House("2", 4, 3, true, "this is description", "Girls", true, true, false, 30000, 6000,"Katana","O71xxxxxxxx"),
      House("3", 5, 4, false, "this is description", "Girls", true, true, true, 40000, 7000,"Baththaramulla","O71xxxxxxxx"),
      House("4", 6, 5, true, "this is description", "Girls", true, false, true, 50000, 8000,"Dehiwala","O71xxxxxxxx"),
      House("5", 7, 6, true, "this is description", "Girls", false, true, true, 60000, 9000,"Panadura","O71xxxxxxxx"),
    ];
  }

}