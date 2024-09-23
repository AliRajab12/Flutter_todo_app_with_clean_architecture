// import '../../entites/todo.dart';
// import '../../repositories/todo_repository.dart';

// class GetTodos {
//   final TodoRepository todoRepository;

//   GetTodos({required this.todoRepository});

//   Future<List<TodoEntity>> call() async {
//     return await todoRepository.getTodos();
//   }
// }

// class AddTodo {
//   final TodoRepository todoRepository;

//   AddTodo({required this.todoRepository});

//   Future<void> call(TodoEntity todo) {
//     return todoRepository.addTodo(todo);
//   }
// }

// class UpdateTodo {
//   final TodoRepository repository;

//   UpdateTodo(this.repository);

//   Future<void> call(TodoEntity todo) async {
//     return await repository.updateTodo(todo);
//   }
// }

// class DeleteTodo {
//   final TodoRepository repository;

//   DeleteTodo(this.repository);

//   Future<void> call(int id) async {
//     return await repository.deleteTodo(id);
//   }
// }
