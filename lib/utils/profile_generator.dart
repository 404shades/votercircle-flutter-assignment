class UserProfileModel{
 final String name;
  final String image;

  UserProfileModel(this.name, this.image);
}
class ProfileGenerator{
    final allAvailableData = [
      UserProfileModel("Rohan Malik","assets/images/rohan.jpg"),
      UserProfileModel("Jennifer Lopez","assets/images/jloprofile.jpg"),
      UserProfileModel("Ed Sheeran","assets/images/edprofile.jpg"),
      UserProfileModel("Selena Gomez","assets/images/seprofile.jpg"),
      UserProfileModel("Selena Gomez","assets/images/secute.jpg"),
      UserProfileModel("Jennifer Lopez","assets/images/jlback.jpg"),
      UserProfileModel("Virat Kohli","assets/images/virat.jpg"),
      UserProfileModel("Marshmello","assets/images/maprofile.jpg"),
      UserProfileModel("Marshmello","assets/images/maback.jpg"),
      UserProfileModel("Marshmello","assets/images/mapost.jpg"),
      UserProfileModel("Taylor swift","assets/images/taprofile.jpg"),
      UserProfileModel("Taylor swift","assets/images/taback.jpg"),
    ];

   UserProfileModel getRandomUser(){
     return (allAvailableData..shuffle()).first;
    }
}