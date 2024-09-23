import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/data/data_sources/todo_local_data_source.dart';
import 'package:flutter_clean_architecture/presentation/bloc/user_bloc/todo_event.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'data/repositories/todo_repository_impl.dart';
import 'domain/repositories/todo_repository.dart';
import 'presentation/bloc/user_bloc/todo_bloc.dart';
import 'presentation/screens/home_screen.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<TodoLocalDataSource>(
      () => TodoLocalDataSourceImpl());
  getIt.registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImpl(localDataSource: getIt()));

  getIt.registerFactory(() => TodoBloc(repository: getIt()));
}

void main() {
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TodoBloc>()..add(LoadTodos()),
      child: MaterialApp(
        title: 'Flutter Todo With Clean Architecture',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
