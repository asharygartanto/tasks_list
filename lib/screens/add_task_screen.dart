import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';

///
///this screen will called after + button in the top right corner tap/click.
///it will send data id(using uuid v1), title, description, created(date time)
///

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
    //required this.titleController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descController = TextEditingController();
    var uuid = const Uuid();
    return BlocListener<TasksBloc, TasksState>(
      listener: (context, state) {
        //messages if need
      },
      child: Stack(
          alignment: AlignmentDirectional.topCenter,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -15,
              child: Container(
                width: 60,
                height: 7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
              ),
            ),
            Container(
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
                  BlocBuilder<TasksBloc, TasksState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('cancel')),
                          ElevatedButton(
                            onPressed: () {
                              var task = Task(
                                  id: uuid.v1(),
                                  title: titleController.text,
                                  description: descController.text,
                                  created: DateTime.now());
                              context
                                  .read<TasksBloc>()
                                  .add(AddTask(task: task));

                              Navigator.pop(context);
                            },
                            child: const Text('add'),
                          )
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ]),
    );
    //);
  }
}
