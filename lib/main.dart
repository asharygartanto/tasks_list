import 'package:flutter/material.dart';
import 'package:tasks_list/blocs/bloc_exports.dart';
import 'package:tasks_list/blocs/bloc_filter/bloc/task_filter_bloc.dart';

import 'screens/tasks_screen.dart';

///
///this is main application
///will call the task_screen
///it used multiBlocProvider to absorb  multi providers(add, update, list, remove and filter, sorting)
///

void main() {
  // ignore: deprecated_member_use
  BlocOverrides.runZoned(() => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TasksBloc()..add(const LoadTasks()),
        ),
        BlocProvider(
          create: (context) => TaskFilterBloc(
            tasksBloc: context.read<TasksBloc>(),
          )..add(const LoadFilter()),
        ),
      ],
      child: MaterialApp(
        title: 'Tasks Todo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const TasksScreen(),
      ),
    );
  }
}
