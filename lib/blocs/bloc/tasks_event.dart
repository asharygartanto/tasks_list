// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasks_bloc.dart';

///
///this is task event
///part of bloc in task CRUD
///

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class LoadTasks extends TasksEvent {
  final List<Task> tasks;

  const LoadTasks({this.tasks = const <Task>[]});
}

class AddTask extends TasksEvent {
  final Task task;
  const AddTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class UpdateTask extends TasksEvent {
  final Task task;
  const UpdateTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class DeleteTask extends TasksEvent {
  final Task task;
  const DeleteTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}
