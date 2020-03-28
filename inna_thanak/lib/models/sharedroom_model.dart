class SharedRoom {
  String id;
  String location;
  int beds;
  int bathrooms;
  bool isfans;
  int rental;
  bool isAC;
  String forWhome;
  int keymoney;
  bool isNegotiable;
  String description;
  String contactNumber;

  SharedRoom(
      this.id,
      this.bathrooms,
      this.beds,
      this.description,
      this.forWhome,
      this.isAC,
      this.isfans,
      this.isNegotiable,
      this.keymoney,
      this.location,
      this.rental,
      this.contactNumber);

      static List<SharedRoom> fetchAll(){
        return [
          SharedRoom("1", 1,5,"This is description","Girls",true, false, false,90000,"Wattala",30000,"071xxxxxxxxx"),
          SharedRoom("2", 1,5,"This is description","boys",false,true, false,90000,"Borella",30000,"071xxxxxxxxx"),
          SharedRoom("3", 1,5,"This is description","Girls",true, false, false,90000,"Dehiwala",30000,"071xxxxxxxxx"),
          SharedRoom("4", 1,5,"This is description","boys",false,true, false,90000,"Panadura",30000,"071xxxxxxxxx"),
          SharedRoom("5", 1,5,"This is description","Girls",true, false, false,90000,"Colombo",30000,"071xxxxxxxxx"),
        ];
      }
}
