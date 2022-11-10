import 'package:flutter/material.dart';
import 'package:tasks_list/blocs/bloc_exports.dart';

import '../models/task.dart';
import '../widgets/tasks_filter.dart';
import '../widgets/tasks_list.dart';
import '../widgets/tasks_sort.dart';
import 'add_task_screen.dart';

///
///this page is the main page
///this page will call bottom sheet widget, button filter, button sorting and
///call list page
///

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  // List<Task> tasksList = [
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        context: context,
        builder: ((context) => SingleChildScrollView(
                child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const AddTaskScreen(),
            ))));
  }

  void _filterTask(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        context: context,
        builder: ((context) => SingleChildScrollView(
                child: Container(
              padding: const EdgeInsets.all(40),
              //padding: EdgeInsets.only(
              //    bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const FilterTask(),
            ))));
  }

  void _sortTask(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        context: context,
        builder: ((context) => SingleChildScrollView(
                child: Container(
              padding: const EdgeInsets.all(40),
              child: const SortTask(),
            ))));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      if (state is TasksLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is TasksLoadedState) {
        List<Task> tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tasks Todo'),
            actions: [
              IconButton(
                onPressed: () => _addTask(context),
                icon: const Icon(Icons.add),
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Chip(
                  label: Text(
                    'Your Tasks:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                FloatingActionButton(
                  heroTag: '1',
                  backgroundColor: Colors.purple,
                  onPressed: () => _filterTask(context),
                  child: const Text('Filter'),
                ),
                FloatingActionButton(
                  heroTag: '2',
                  backgroundColor: Colors.purple,
                  onPressed: () => _sortTask(context),
                  child: const Text('Sort'),
                ),
              ]),
              TasksList(tasksList: tasksList)
            ],
          ),
        );
      }
      return const Text('gone wrong');
    });
  }
}
