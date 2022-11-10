import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

///
///this is task main bloc
///bloc in task CRUD
///

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  void _onLoadTasks(LoadTasks event, Emitter<TasksState> emit) {
    emit(
      TasksLoadedState(allTasks: event.tasks),
    );
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    if (state is TasksLoadedState) {
      emit(TasksLoadedState(
          allTasks: List.from(state.allTasks)..add(event.task)));
    }
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    final int index = state.allTasks.indexOf(task);

    if (state is TasksLoadedState) {
      List<Task> allTasks = List.from(state.allTasks)..remove(task);
      task.isDone == false
          ? allTasks.insert(index, task.copyWith(isDone: true))
          : allTasks.insert(index, task.copyWith(isDone: false));

      emit(TasksLoadedState(allTasks: allTasks));
    }
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    if (state is TasksLoadedState) {
      emit(TasksLoadedState(
          allTasks: List.from(state.allTasks)..remove(event.task)));
    }
  }
}
