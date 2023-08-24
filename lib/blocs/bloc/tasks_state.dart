part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;
  final List<Task> removedTasks;

  const TasksState(
      {this.allTasks = const <Task>[], this.removedTasks = const <Task>[]});

  @override
  List<Object?> get props => [allTasks, removedTasks];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({
      'allTasks': allTasks.map((x) => x.toMap()).toList(),
      'removedTasks': removedTasks.map((x) => x.toMap()).toList()
    });

    return result;
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      allTasks: List<Task>.from(map['allTasks']?.map((x) => Task.fromMap(x))),
      removedTasks:
          List<Task>.from(map['removedTasks']?.map((x) => Task.fromMap(x))),
    );
  }
}
