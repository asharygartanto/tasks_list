part of 'task_filter_bloc.dart';

///
///this is evemt state
///part of bloc in filter
///

abstract class TaskFilterEvent extends Equatable {
  const TaskFilterEvent();

  @override
  List<Object> get props => [];
}

class LoadFilter extends TaskFilterEvent {
  const LoadFilter();
  @override
  List<Object> get props => [];
}

class UpdateFilter extends TaskFilterEvent {
  const UpdateFilter();

  @override
  List<Object> get props => [];
}

class UpdateTasks extends TaskFilterEvent {
  final TaskFilter taskFilter;

  const UpdateTasks({this.taskFilter = TaskFilter.all});

  @override
  List<Object> get props => [taskFilter];
}

class SortNewestFilter extends TaskFilterEvent {
  const SortNewestFilter();

  @override
  List<Object> get props => [];
}

class SortOldestFilter extends TaskFilterEvent {
  const SortOldestFilter();

  @override
  List<Object> get props => [];
}
