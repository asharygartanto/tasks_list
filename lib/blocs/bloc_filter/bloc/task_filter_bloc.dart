import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:tasks_list/blocs/bloc_exports.dart';
import 'package:tasks_list/models/task.dart';

import '../../../models/task_filter_model.dart';

part 'task_filter_event.dart';
part 'task_filter_state.dart';

///
///this is bloc main
///
///

class TaskFilterBloc extends Bloc<TaskFilterEvent, TaskFilterState> {
  final TasksBloc _tasksBloc;
  late StreamSubscription _tasksSubscription;

  TaskFilterBloc({required TasksBloc tasksBloc})
      : _tasksBloc = tasksBloc,
        super(TaskFilterLoading()) {
    on<UpdateFilter>(_onUpdateFilter);
    on<UpdateTasks>(_onUpdateTasks);
    on<LoadFilter>(_onLoadFilter);
    on<SortNewestFilter>(_onSortNewestFilter);
    on<SortOldestFilter>(_onSortOldestFilter);

    _tasksSubscription = tasksBloc.stream.listen((state) {
      add(
        const UpdateTasks(),
      );
    });
  }

  void _onLoadFilter(LoadFilter event, Emitter<TaskFilterState> emit) async {
    final state = _tasksBloc.state;

    if (state is TasksLoadedState) {
      List<Task> tasks = state.allTasks.toList();
      emit(
        TaskFilterLoaded(listFilteredTasks: tasks),
      );
    }
  }

  void _onUpdateTasks(UpdateTasks event, Emitter<TaskFilterState> emit) {
    final state = _tasksBloc.state;

    List<Task> tasksCompleted = <Task>[];
    List<Task> tasksUncompleted = <Task>[];
    List<Task> tasks = <Task>[];
    if (state is TasksLoadedState) {
      if (event.taskFilter == TaskFilter.completed) {
        for (var i in state.allTasks) {
          if (i.isDone == true) tasksCompleted.add(i);
        }
        tasks = tasksCompleted;
      } else if (event.taskFilter == TaskFilter.uncompleted) {
        for (var i in state.allTasks) {
          if (i.isDone == false) tasksUncompleted.add(i);
        }
        tasks = tasksUncompleted;
      } else {
        tasks = state.allTasks;
      }

      emit(
        TaskFilterLoaded(listFilteredTasks: tasks),
      );
    }
  }

  void _onUpdateFilter(UpdateFilter event, Emitter<TaskFilterState> emit) {
    if (state is TaskFilterLoading) {
      add(
        const UpdateTasks(taskFilter: TaskFilter.all),
      );
    }

    if (state is TaskFilterLoading) {
      final state = this.state as TaskFilterLoaded;
      add(
        UpdateTasks(taskFilter: state.taskFilter),
      );
    }
  }

  void _onSortNewestFilter(
      SortNewestFilter event, Emitter<TaskFilterState> emit) {
    final state = _tasksBloc.state;
    List<Task> tasks = <Task>[];
    List<Task> tasksSort = <Task>[];
    if (state is TasksLoadedState) {
      tasks = state.allTasks;
      tasks.sort(
        (a, b) => b.created.microsecondsSinceEpoch
            .compareTo(a.created.microsecondsSinceEpoch),
      );
      for (var i in tasks) {
        tasksSort.add(i);
      }

      emit(
        TaskFilterLoaded(listFilteredTasks: tasksSort),
      );
    }
  }

  void _onSortOldestFilter(
      SortOldestFilter event, Emitter<TaskFilterState> emit) {
    final state = _tasksBloc.state;
    List<Task> tasks = <Task>[];
    List<Task> tasksSort = <Task>[];
    if (state is TasksLoadedState) {
      tasks = state.allTasks;
      tasks.sort(
        (a, b) => a.created.microsecondsSinceEpoch
            .compareTo(b.created.microsecondsSinceEpoch),
      );
      for (var i in tasks) {
        tasksSort.add(i);
      }
      emit(
        TaskFilterLoaded(listFilteredTasks: tasksSort),
      );
    }
  }
}
