import 'package:flutter/material.dart';
import 'package:todo_list/widgets/tasks_list.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';
import 'my_drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('Recycle Bin'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text("${state.removedTasks.length} Tasks"),
                ),
              ),
              TasksList(tasksList: state.removedTasks)
            ],
          ),
          drawer: MyDrawer(),
        );
      },
    );
  }
}
