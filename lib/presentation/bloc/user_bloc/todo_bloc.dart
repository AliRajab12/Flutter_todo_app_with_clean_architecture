import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/domain/entites/todo.dart';
import 'package:flutter_clean_architecture/presentation/bloc/user_bloc/todo_event.dart';
import 'package:flutter_clean_architecture/presentation/bloc/user_bloc/todo_state.dart';
import 'package:flutter_clean_architecture/domain/repositories/todo_repository.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository repository;

  TodoBloc({required this.repository}) : super(TodoInitial()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodoEvent>(_onAddTodo);
    on<UpdateTodoEvent>(_onUpdateTodo);
    on<DeleteTodoEvent>(_onDeleteTodo);
  }

  void _onLoadTodos(LoadTodos event, Emitter<TodoState> emit) async {
    emit(TodosLoading());
    try {
      final todos = await repository.getTodos();
      emit(TodosLoaded(todos));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  void _onAddTodo(AddTodoEvent event, Emitter<TodoState> emit) async {
    final currentState = state;
    if (currentState is TodosLoaded) {
      try {
        final newTodo = TodoEntity(
          id: DateTime.now().millisecondsSinceEpoch,
          title: event.title,
          description: event.description,
          isCompleted: false,
        );
        await repository.addTodo(newTodo);
        final updatedTodos = await repository.getTodos();
        emit(TodosLoaded(updatedTodos));
      } catch (e) {
        emit(TodoError(e.toString()));
      }
    }
  }

  void _onUpdateTodo(UpdateTodoEvent event, Emitter<TodoState> emit) async {
    final currentState = state;
    if (currentState is TodosLoaded) {
      try {
        await repository.updateTodo(event.todo);
        final updatedTodos = await repository.getTodos();
        emit(TodosLoaded(updatedTodos));
      } catch (e) {
        emit(TodoError(e.toString()));
      }
    }
  }

  void _onDeleteTodo(DeleteTodoEvent event, Emitter<TodoState> emit) async {
    final currentState = state;
    if (currentState is TodosLoaded) {
      try {
        await repository.deleteTodo(event.id);
        final updatedTodos = await repository.getTodos();
        emit(TodosLoaded(updatedTodos));
      } catch (e) {
        emit(TodoError(e.toString()));
      }
    }
  }
}
