import 'package:flutter/material.dart';
import 'package:tasks_list/blocs/bloc_exports.dart';

import '../blocs/bloc_filter/bloc/task_filter_bloc.dart';

///sort function should be calling an api
///in this sample not perfectly working because the equatable will see as the
///same data.
///it will working if we do hot reload or trigger by another action(add, filter)
///

class SortTask extends StatelessWidget {
  const SortTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
        ),
        child: const Text('Newest'),
        onPressed: () {
          context.read<TaskFilterBloc>().add(
                const SortNewestFilter(),
              );
          Navigator.pop(context);
        },
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
        ),
        child: const Text('Oldest'),
        onPressed: () {
          context.read<TaskFilterBloc>().add(
                const SortOldestFilter(),
              );
          Navigator.pop(context);
        },
      ),
    ]);
  }
}
