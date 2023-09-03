import 'package:flutter/material.dart';
import 'package:todo_list/blocs/bloc_exports.dart';
import 'package:todo_list/res/localization/app_localizations.dart';
import 'package:todo_list/widgets/task_title.dart';

import '../models/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasksList,
  });

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    void _removeOrDelete(BuildContext context, Task task) {
      task.isDeleted!
          ? context.read<TasksBloc>().add(DeleteTask(task: task))
          : context.read<TasksBloc>().add(RemoveTask(task: task));
    }

    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          elevation: 0,
          children: tasksList
              .map(
                (task) => ExpansionPanelRadio(
                  canTapOnHeader: true,
                  value: task.id,
                  headerBuilder: (context, isOpen) => TaskTitle(task: task),
                  body: Column(
                    children: [
                      ListTile(
                        title: SelectableText.rich(
                          TextSpan(children: [
                            TextSpan(
                                text:
                                    '${AppLocalizations.of(context).translate('title')}\n',
                                style: Theme.of(context).textTheme.titleSmall),
                            TextSpan(
                                text: task.title,
                                style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(
                                text:
                                    '\n\n${AppLocalizations.of(context).translate('description')}\n',
                                style: Theme.of(context).textTheme.titleSmall),
                            TextSpan(
                                text: task.description,
                                style: Theme.of(context).textTheme.bodySmall),
                          ]),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          !task.isDeleted!
                              ? IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit))
                              : SizedBox(),
                          task.isDeleted!
                              ? IconButton(
                                  onPressed: () {
                                    context
                                        .read<TasksBloc>()
                                        .add(RestoreTask(task: task));
                                    context
                                        .read<TasksBloc>()
                                        .add(DeleteTask(task: task));
                                  },
                                  icon: const Icon(
                                    Icons.restore,
                                  ))
                              : SizedBox(),
                          IconButton(
                              onPressed: () {
                                _removeOrDelete(context, task);
                              },
                              icon: const Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
