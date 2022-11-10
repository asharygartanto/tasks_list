part of 'task_filter_bloc.dart';

///
///this is filter state
///part of bloc in filter
///

abstract class TaskFilterState extends Equatable {
  const TaskFilterState();

  @override
  List<Object> get props => [];
}

class TaskFilterLoading extends TaskFilterState {}

class TaskFilterLoaded extends TaskFilterState {
  final List<Task> listFilteredTasks;
  final TaskFilter taskFilter;

  const TaskFilterLoaded({
    required this.listFilteredTasks,
    this.taskFilter = TaskFilter.all,
  });

  //const TaskFilterLoaded([this.listFilteredTasks = const []]) : super([listFilteredTasks]);

  @override
  List<Object> get props => [listFilteredTasks, taskFilter];
}
