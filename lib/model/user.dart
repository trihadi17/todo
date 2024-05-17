class UserModel {
  int id;
  String name;
  String email;
  String token;

  // Constructor
  UserModel({
    this.id,
    this.name,
    this.email,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }
}
