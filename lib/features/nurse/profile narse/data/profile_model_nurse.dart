class ProfileModelNurse {
  final String userName;
  final String? image;
  final String email;
  //final String specialty;

  ProfileModelNurse({
    required this.image,
    required this.email,
    required this.userName,
    //required this.specialty
  });

  factory ProfileModelNurse.fromJson(json) {
    return ProfileModelNurse(
      userName: json['nurse']['user']['name'],
      email: json['nurse']['user']['email'],
      image: json['nurse']['user']['image'],
      //specialty: json['nurse']['specialty'],
    );
  }
}
