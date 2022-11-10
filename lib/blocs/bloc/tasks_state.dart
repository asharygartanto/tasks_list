part of 'tasks_bloc.dart';

///
///this is task state
///part of bloc in task CRUD
///

class TasksState extends Equatable {
  final List<Task> allTasks;
  const TasksState({this.allTasks = const <Task>[]});

  @override
  List<Object> get props => [allTasks];
}

class TasksLoadingState extends TasksState {}

class TasksLoadedState extends TasksState {
  final List<Task> allTasks;

  const TasksLoadedState({this.allTasks = const <Task>[]});

  @override
  List<Object> get props => [allTasks];
}
