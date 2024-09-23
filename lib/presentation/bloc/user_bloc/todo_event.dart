import '../../../domain/entites/todo.dart';

abstract class TodoEvent {}

class LoadTodos extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final String title;
  final String description;

  AddTodoEvent({required this.title, required this.description});
}

class UpdateTodoEvent extends TodoEvent {
  final TodoEntity todo;

  UpdateTodoEvent(this.todo);
}

class DeleteTodoEvent extends TodoEvent {
  final int id;

  DeleteTodoEvent(this.id);
}
