import 'dart:convert';

class UserModel {
  final String name;
  final String? photoUrl;
//a foto pode vir nula, este é o null safety ?

  UserModel({required this.name, this.photoUrl});

//TRANSFORMANDO UM JSON EM STRING
  Map<String, dynamic> toMap() => {
        "name": name,
        "photoUrl": photoUrl,
      };
  String toJson() => jsonEncode(toMap());


//TRANSFORMANDO UMA STRING EM JSON
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(name: map['name'], photoUrl: map['photoUrl']);
  }
  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json));
}
