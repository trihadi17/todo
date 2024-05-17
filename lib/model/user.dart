class UserModel {
  int id;
  String name;
  String email;

  // Constructor
  UserModel({
    this.id,
    this.name,
    this.email,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }
}
