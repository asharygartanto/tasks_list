import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: tasksList.length,
        itemBuilder: (context, index) {
          var task = tasksList[index];
          return Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    const SizedBox(height: 5),
                    Text(
                      task.title,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Row(children: [
                      const SizedBox(width: 10),
                      Text(
                        task.description,
                        style: const TextStyle(fontSize: 14),
                        textAlign: TextAlign.left,
                      ),
                    ]),
                    Text(
                      DateFormat('yyyy-MM-dd – kk:mm').format(task.created),
                      style: const TextStyle(fontSize: 10, color: Colors.grey),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 5),
                  ]),
                  Row(
                    children: [
                      Checkbox(
                        value: task.isDone,
                        onChanged: (value) {
                          context.read<TasksBloc>().add(UpdateTask(task: task));
                        },
                      ),
                      IconButton(
                          onPressed: () => context
                              .read<TasksBloc>()
                              .add(DeleteTask(task: task)),
                          icon: const Icon(Icons.cancel))
                    ],
                  )
                ]),
          );
        },
      ),
    );
  }
}
