// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_clean_architecture/domain/entites/todo.dart';
// import 'package:flutter_clean_architecture/presentation/bloc/user_bloc/todo_bloc.dart';
// import 'package:flutter_clean_architecture/presentation/bloc/user_bloc/todo_event.dart';

// class AddTodoForm extends StatefulWidget {
//   const AddTodoForm({super.key});

//   @override
//   _AddTodoFormState createState() => _AddTodoFormState();
// }

// class _AddTodoFormState extends State<AddTodoForm> {
//   final _formKey = GlobalKey<FormState>();
//   String _title = '';
//   String _description = '';
//   bool _isDone = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add New Todo'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'Title'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a title';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _title = value!;
//                 },
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'Description'),
//                 onSaved: (value) {
//                   _description = value!;
//                 },
//               ),
//               SwitchListTile(
//                 title: const Text('Is Done'),
//                 value: _isDone,
//                 onChanged: (value) {
//                   setState(() {
//                     _isDone = value;
//                   });
//                 },
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     _addTodo(context); // Call the method to add todo
//                   }
//                 },
//                 child: const Text('Add Todo'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _addTodo(BuildContext context) async {
//     final todo = TodoEntity(
//       title: _title,
//       description: _description,
//       isCompleted: _isDone,
//     );

//     // Dispatch the AddTodoEvent with the new Todo
//     BlocProvider.of<TodoBloc>(context).add(AddTodoEvent(todo: todo));

//     // Show a SnackBar to notify the user
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('Todo added successfully!'),
//         duration: Duration(seconds: 2),
//       ),
//     );

//     // After adding, go back to the previous screen
//     Navigator.pop(context);
//   }
// }
