import 'package:flutter/material.dart';
import 'package:todo_list/blocs/bloc_exports.dart';
import 'package:todo_list/res/localization/app_localizations.dart';

import '../models/task.dart';
import '../widgets/tasks_list.dart';

class CompletedTasksScreen extends StatefulWidget {
  const CompletedTasksScreen({super.key});

  @override
  State<CompletedTasksScreen> createState() => _CompletedTasksScreenState();
}

class _CompletedTasksScreenState extends State<CompletedTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.completedTasks;
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                      "${state.completedTasks.length}/${state.completedTasks.length+state.pendingTasks.length+state.favoritedTasks.length} ${AppLocalizations.of(context).translate('completed')}"),
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
