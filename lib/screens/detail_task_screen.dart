import 'package:flutter/material.dart';

import '../models/task.dart';

///
///this page will be called after tap the card in the list
///it will show the title, description and completed(done/checked) or uncompleted
///

class DetailTaskScreen extends StatelessWidget {
  // In the constructor, require a Todo.
  const DetailTaskScreen({super.key, required this.task});

  // Declare a field that holds the Todo.
  final Task task;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(task.description, style: const TextStyle(fontSize: 16)),
          ),
          Container(
            alignment: Alignment.center,
            color: task.isDone == true ? Colors.green[500] : Colors.grey[400],
            child: SizedBox(
                width: 200,
                height: 70,
                child: Center(
                  child: task.isDone == true
                      ? const Text(
                          'Completed',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )
                      : const Text(
                          'Uncompleted',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                )),
          )
        ],
      ),
    );
  }
}
