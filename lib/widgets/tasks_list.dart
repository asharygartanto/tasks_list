import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasks_list/blocs/bloc_filter/bloc/task_filter_bloc.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';
import '../screens/detail_task_screen.dart';

///
///this class to split the list widget and blockbuilder to fill in the data.
///the description area will fit to maximum 30 characters.
///

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    List<Task> tasksListFilter;
    return BlocBuilder<TaskFilterBloc, TaskFilterState>(
      builder: (context, state) {
        if (state is TaskFilterLoaded) {
          tasksListFilter = state.listFilteredTasks;
          return Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: tasksListFilter.length,
              itemBuilder: (context, index) {
                var task = tasksListFilter[index];
                return Card(
                  elevation: 5,
                  child: Column(children: [
                    ListTile(
                      title: Text(
                        task.title,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        task.description.length > 30
                            ? '${task.description.substring(0, 30)}...'
                            : task.description,
                        style: const TextStyle(fontSize: 14),
                        textAlign: TextAlign.justify,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: task.isDone,
                            onChanged: (value) {
                              context
                                  .read<TasksBloc>()
                                  .add(UpdateTask(task: task));
                            },
                          ),
                          IconButton(
                            onPressed: () => context
                                .read<TasksBloc>()
                                .add(DeleteTask(task: task)),
                            icon: const Icon(Icons.cancel),
                            color: Colors.red,
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                DetailTaskScreen(task: task)));
                      },
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 15),
                      child: Text(
                        DateFormat('yyyy-MM-dd – kk:mm:ss')
                            .format(task.created),
                        style:
                            const TextStyle(fontSize: 10, color: Colors.grey),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 5),
                  ]),
                );
              },
            ),
          );
        }
        return const Text('something wrong');
      },
    );
  }
}
