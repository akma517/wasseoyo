class User {
  final String id;
  final String name;
  final String nickName;

  User({
    required this.id,
    required this.name,
    required this.nickName,
  });

  factory User.nullToInit() => User(
        id: "",
        name: "",
        nickName: "",
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        nickName: json["nickName"],
      );

  static List<User> modelsFromSnapshot(List modelSnapshot) {
    return modelSnapshot.map((e) => User.fromJson(e)).toList();
  }
}
