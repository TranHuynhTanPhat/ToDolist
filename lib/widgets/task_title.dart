import 'package:flutter/material.dart';

import 'package:todo_list/models/task.dart';
import 'package:todo_list/res/localization/app_localizations.dart';

import '../blocs/bloc_exports.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle({
    Key? key,
    required this.task,
  }) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context) {
    DateTimeRange? dateRange = (task.begin != "" && task.end != "")
        ? DateTimeRange(
            start: DateTime.parse(task.begin!), end: DateTime.parse(task.end!))
        : null;
    return Row(
      children: [
        Expanded(
          child: ListTile(
            leading: const Icon(Icons.star_border_rounded),
            title: Text(
              task.title,
              textScaleFactor: 1,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(overflow: TextOverflow.ellipsis, decoration: task.isDone!? TextDecoration.lineThrough:null),
            ),
            subtitle: dateRange != null
                ? Text(
                    task.alert == ""
                        ? "${dateRange.duration.inDays.toString()} ${AppLocalizations.of(context).translate('dayslater')}"
                        : "${dateRange.duration.inDays.toString()} ${AppLocalizations.of(context).translate('dayslaterat')} ${task.alert}",
                    textScaleFactor: 1,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                : null,
            // onLongPress: () => _removeOrDelete(context, task),
          ),
        ),
        Checkbox(
          value: task.isDone,
          onChanged: task.isDeleted == false
              ? (value) {
                  context.read<TasksBloc>().add(UpdateTask(task: task));
                }
              : null,
        ),
      ],
    );
  }
}
