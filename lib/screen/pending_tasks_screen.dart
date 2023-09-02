import 'package:flutter/material.dart';
import 'package:todo_list/blocs/bloc_exports.dart';
import 'package:todo_list/res/localization/app_localizations.dart';

import '../models/task.dart';
import '../widgets/tasks_list.dart';

class PendingTasksScreen extends StatefulWidget {
  const PendingTasksScreen({super.key});

  @override
  State<PendingTasksScreen> createState() => _PendingTasksScreenState();
}

class _PendingTasksScreenState extends State<PendingTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.pendingTasks;
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    "${state.completedTasks.length}/${state.completedTasks.length + state.pendingTasks.length + state.favoritedTasks.length} ${AppLocalizations.of(context).translate('tasks')}",
                  ),
                ),
              ),
              TasksList(tasksList: tasksList)
            ],
          ),
        );
      },
    );
  }
}
