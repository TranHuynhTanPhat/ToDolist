import 'package:flutter/material.dart';

import 'package:todo_list/models/task.dart';

import '../blocs/bloc_exports.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle({
    Key? key,
    required this.task,
  }) : super(key: key);
  final Task task;

  void _removeOrDelete(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
            decoration: task.isDone! ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: task.isDeleted == false
            ? (value) {
                context.read<TasksBloc>().add(UpdateTask(task: task));
              }
            : null,
      ),
      onLongPress: () => _removeOrDelete(context, task),
    );
    ;
  }
}
