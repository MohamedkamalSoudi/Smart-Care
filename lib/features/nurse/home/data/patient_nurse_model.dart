class UserModelNurse {
  final num? id;
  final String? name;
  final String? room;
  final String? ped;
  final String? age;

  UserModelNurse({
    required this.id,
    required this.name,
    required this.room,
    required this.ped,
    required this.age,
  });
  factory UserModelNurse.fromJson(Map<String, dynamic> json) {
    return UserModelNurse(
      id: json['id'],
      name: json['user']['name'],
      room: json['room_number'],
      ped: json['ped'],
      age: json['age'],
    );
  }
}
