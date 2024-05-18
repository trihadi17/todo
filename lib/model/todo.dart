class TodoModel {
  int id;
  int user_id;
  String task;
  int isDone;
  DateTime createdAt;
  DateTime updatedAt;

  // Constructor
  TodoModel({
    this.id,
    this.user_id,
    this.task,
    this.isDone,
    this.createdAt,
    this.updatedAt,
  });

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    task = json['task'];
    isDone = json['isDone'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }
}
