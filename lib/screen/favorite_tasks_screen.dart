import 'package:flutter/material.dart';
import 'package:todo_list/blocs/bloc_exports.dart';
import 'package:todo_list/res/localization/app_localizations.dart';

import '../models/task.dart';
import '../widgets/tasks_list.dart';

class FavoriteTasksScreen extends StatefulWidget {
  const FavoriteTasksScreen({super.key});

  @override
  State<FavoriteTasksScreen> createState() => _FavoriteTasksScreenState();
}

class _FavoriteTasksScreenState extends State<FavoriteTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.favoritedTasks;
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                      "${tasksList.length} ${AppLocalizations.of(context).translate('tasks')}"),
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
