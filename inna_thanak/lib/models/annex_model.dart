class Annex {
  String id;
  String bordingType;
  String recidentType;
  String ownerId;
  int rooms;
  int bathrooms;
  bool isFurniture;
  bool isKitchen;
  bool isAC;
  int keyMoney;
  int rental;
  bool isNegotiable;
  String description;
  String location;
  String contactNumber;

  Annex(
      this.id,
      this.rooms,
      this.bathrooms,
      this.isAC,
      this.description,
      this.isFurniture,
      this.isKitchen,
      this.isNegotiable,
      this.keyMoney,
      this.rental,
      this.location,
      this.contactNumber,
      this.bordingType,
      this.ownerId,
      this.recidentType);

  static List<Annex> fetchAll() {
    return [
     Annex("1", 2, 3, true, "This is annex", true,true,true,5000,3000,"Borella","071xxxxx","Annex", "dshk","Boys"),
    ];
  }
}
