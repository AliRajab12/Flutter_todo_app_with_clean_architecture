import '../../domain/entites/todo.dart';

class TodoModel extends TodoEntity {
  TodoModel(
      {required super.id,
      required super.title,
      required super.description,
      required super.isCompleted});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      description: json['description'],
      title: json['title'],
      isCompleted: json['isCompleted'] == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'title': title,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }
}
