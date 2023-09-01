part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> favoritedTasks;
  final List<Task> removedTasks;
  final List<Task> pendingTasks;
  final List<Task> completedTasks;

  const TasksState(
      {this.favoritedTasks = const <Task>[],
      this.removedTasks = const <Task>[],
      this.pendingTasks = const <Task>[],
      this.completedTasks = const <Task>[]});

  @override
  List<Object?> get props =>
      [favoritedTasks, removedTasks, pendingTasks, completedTasks];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({
      'pendingTasks': pendingTasks.map((x) => x.toMap()).toList(),
      'removedTasks': removedTasks.map((x) => x.toMap()).toList(),
      'favoritedTasks': favoritedTasks.map((x) => x.toMap()).toList(),
      'completedTasks': completedTasks.map((x) => x.toMap()).toList(),
    });
    return result;
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      pendingTasks:
          List<Task>.from(map['pendingTasks']?.map((x) => Task.fromMap(x))),
      removedTasks:
          List<Task>.from(map['removedTasks']?.map((x) => Task.fromMap(x))),
      favoritedTasks:
          List<Task>.from(map['favoritedTasks']?.map((x) => Task.fromMap(x))),
      completedTasks:
          List<Task>.from(map['completedTasks']?.map((x) => Task.fromMap(x))),
    );
  }
}
