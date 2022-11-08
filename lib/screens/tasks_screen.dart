import 'package:flutter/material.dart';
import 'package:tasks_list/blocs/bloc_exports.dart';

import '../models/task.dart';
import '../widgets/tasks_list.dart';
import 'add_task_screen.dart';

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
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                      ),
                      child: Text('All', style: TextStyle(fontSize: 16)),
                      onPressed: () {
                        print('all');
                        Navigator.pop(context);
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                      ),
                      child: Text('Completed'),
                      onPressed: () {
                        print('completed');
                        Navigator.pop(context);
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                      ),
                      child: Text('Uncompleted'),
                      onPressed: () {
                        print('completed');
                        Navigator.pop(context);
                      },
                    ),
                  ]),
            ))));
  }

  void _sortTask(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        context: context,
        builder: ((context) => SingleChildScrollView(
                child: Container(
              padding: const EdgeInsets.all(40),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                      ),
                      child: Text('Newest'),
                      onPressed: () {
                        print('completed');
                        Navigator.pop(context);
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                      ),
                      child: Text('Oldest'),
                      onPressed: () {
                        print('oldest');
                        Navigator.pop(context);
                      },
                    ),
                  ]),
            ))));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
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
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: () => _filterTask(context),
                  child: const Text('Filter'),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: () => _sortTask(context),
                  child: const Text('Sort'),
                ),
              ]),
              TasksList(tasksList: tasksList)
            ],
          ),
        );
      },
    );
  }
}
