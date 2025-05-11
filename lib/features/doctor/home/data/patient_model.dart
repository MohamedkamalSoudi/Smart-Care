class UserModel {
  final num? id;
  final String? name;
  final String? room;
  final String? bed;
  final String? age;

  UserModel( {
    required this.id,
    required this.name,
    required this.room,
    required this.bed,
    required this.age,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['user']['name'],
      room : json['room_number'],
      bed: json['ped_room'],
      age: json['age'],

    );
  }
}