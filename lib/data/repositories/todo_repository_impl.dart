import 'package:flutter_clean_architecture/domain/entites/todo.dart';
import 'package:flutter_clean_architecture/domain/repositories/todo_repository.dart';
import '../data_sources/todo_local_data_source.dart';
import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;

  TodoRepositoryImpl({required this.localDataSource});

  @override
  Future<List<TodoModel>> getTodos() async {
    final todoModels = await localDataSource.getTodos();
    return todoModels;
  }

  @override
  Future<void> addTodo(TodoEntity todo) async {
    await localDataSource.addTodo(TodoModel(
      id: todo.id,
      title: todo.title,
      description: todo.description,
      isCompleted: todo.isCompleted,
    ));
  }

  @override
  Future<void> updateTodo(TodoEntity todo) async {
    await localDataSource.updateTodo(TodoModel(
      id: todo.id,
      title: todo.title,
      description: todo.description,
      isCompleted: todo.isCompleted,
    ));
  }

  @override
  Future<void> deleteTodo(int id) async {
    await localDataSource.deleteTodo(id);
  }
}
