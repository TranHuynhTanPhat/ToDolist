import 'package:flutter/material.dart';
import 'package:todo_list/blocs/bloc_exports.dart';
import 'package:todo_list/screen/my_drawer.dart';

import '../models/task.dart';
import '../widgets/tasks_list.dart';
import 'add_task_screen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddTaskScreen(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              'Task App',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            actions: [
              IconButton(
                  onPressed: () => _addTask(context),
                  icon: const Icon(Icons.add))
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text("${tasksList.length} Tasks"),
                ),
              ),
              TasksList(tasksList: tasksList)
            ],
          ),
          drawer: const MyDrawer(),
          floatingActionButton: FloatingActionButton(
            elevation: 1,
            onPressed: () => _addTask(context),
            tooltip: "Add Task",
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
