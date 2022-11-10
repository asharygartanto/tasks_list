import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_list/blocs/bloc_filter/bloc/task_filter_bloc.dart';
import 'package:tasks_list/models/task_filter_model.dart';

///
///this function to split for filter function
///3 category, all, completed(checked), uncompleted(unchecked)
///

class FilterTask extends StatelessWidget {
  const FilterTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
        ),
        child: const Text('All', style: TextStyle(fontSize: 16)),
        onPressed: () {
          context.read<TaskFilterBloc>().add(
                const UpdateTasks(
                  taskFilter: TaskFilter.all,
                ),
              );
          Navigator.pop(context);
        },
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
        ),
        child: const Text('Completed'),
        onPressed: () {
          context.read<TaskFilterBloc>().add(
                const UpdateTasks(
                  taskFilter: TaskFilter.completed,
                ),
              );
          Navigator.pop(context);
        },
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
        ),
        child: const Text('Uncompleted'),
        onPressed: () {
          context.read<TaskFilterBloc>().add(
                const UpdateTasks(
                  taskFilter: TaskFilter.uncompleted,
                ),
              );
          Navigator.pop(context);
        },
      ),
    ]);
  }
}
