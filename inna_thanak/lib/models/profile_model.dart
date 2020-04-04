class Profile {
  String uid;
  String email;
  String displayname;
  String password;
  String profilePicUrl;



Profile(this.uid,this.displayname,this.email,this.password,this.profilePicUrl);


static _profileDetails(){
  return Profile("1", "John doe", "Jhon.doe.gmail.com","xxxxxx", "www.google.com");
}


}
