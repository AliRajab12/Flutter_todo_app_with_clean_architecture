import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/domain/entites/todo.dart';
import 'package:flutter_clean_architecture/presentation/bloc/user_bloc/todo_bloc.dart';
import 'package:flutter_clean_architecture/presentation/bloc/user_bloc/todo_event.dart';
import 'package:flutter_clean_architecture/presentation/bloc/user_bloc/todo_state.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoInitial) {
            BlocProvider.of<TodoBloc>(context).add(LoadTodos());
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodosLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodosLoaded) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                final todo = state.todos[index];
                return ListTile(
                  title: Text(todo.title),
                  leading: Checkbox(
                    value: todo.isCompleted,
                    onChanged: (bool? value) {
                      BlocProvider.of<TodoBloc>(context).add(
                        UpdateTodoEvent(
                          TodoEntity(
                            id: todo.id,
                            title: todo.title,
                            description: todo.description,
                            isCompleted: value ?? false,
                          ),
                        ),
                      );
                    },
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      BlocProvider.of<TodoBloc>(context)
                          .add(DeleteTodoEvent(todo.id));
                    },
                  ),
                );
              },
            );
          } else if (state is TodoError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Show dialog to add new todo
          showDialog(
            context: context,
            builder: (context) {
              String newTodoTitle = '';
              String newTodoDescription = '';
              return AlertDialog(
                title: const Text('Add New Todo'),
                content: Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        newTodoTitle = value;
                      },
                      decoration:
                          const InputDecoration(hintText: "Enter todo title"),
                    ),
                    TextField(
                      onChanged: (value) {
                        newTodoDescription = value;
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter todo description"),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    child: const Text('Add'),
                    onPressed: () {
                      if (newTodoTitle.isNotEmpty) {
                        BlocProvider.of<TodoBloc>(context).add(AddTodoEvent(
                            title: newTodoTitle,
                            description: newTodoDescription));
                        Navigator.of(context).pop();
                      }
                    },
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
