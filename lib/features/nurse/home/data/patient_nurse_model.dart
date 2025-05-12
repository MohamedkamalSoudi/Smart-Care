class UserModelNurse {
  final num? id;
  final String? name;
  final String? room;
  final String? bed;
  final String? age;

  UserModelNurse( {
    required this.id,
    required this.name,
    required this.room,
    required this.bed,
    required this.age,
  });
  factory UserModelNurse.fromJson(Map<String, dynamic> json) {
    return UserModelNurse(
      id: json['id'],
      name: json['user']['name'],
      room : json['room_number'],
      bed: json['ped_room'],
      age: json['age'],

    );
  }
}