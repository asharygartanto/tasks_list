import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
    //required this.titleController,
  }) : super(key: key);

  //final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text('Add Task', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 10),
          TextField(
              controller: titleController,
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Title'),
              )),
          const SizedBox(height: 10),
          TextField(
              controller: descController,
              autofocus: true,
              maxLines: 5,
              maxLength: 200,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Description'),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('cancel')),
              ElevatedButton(
                onPressed: () {
                  var task = Task(
                      title: titleController.text,
                      description: descController.text.length > 30
                          ? '${descController.text.substring(0, 30)}...'
                          : descController.text,
                      created: DateTime.now());
                  //print('print button : ' + task.title);
                  context.read<TasksBloc>().add(AddTask(task: task));

                  Navigator.pop(context);
                },
                child: const Text('add'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
