import '../../../domain/entites/todo.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodosLoading extends TodoState {}

class TodosLoaded extends TodoState {
  final List<TodoEntity> todos;

  TodosLoaded(this.todos);
}

class TodoError extends TodoState {
  final String message;
  TodoError(this.message);
}
