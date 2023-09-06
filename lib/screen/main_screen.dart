// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:todo_list/res/localization/app_localizations.dart';
import 'package:todo_list/screen/favorite_tasks_screen.dart';
import 'package:todo_list/screen/add_task_screen.dart';
import 'package:todo_list/screen/completed_tasks_screen.dart';
import 'package:todo_list/screen/my_drawer.dart';
import 'package:todo_list/screen/pending_tasks_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        enableDrag: true,
        isScrollControlled: true,
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 50),
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddTaskScreen(),
              ),
            ));
  }

  var _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _pageDetail = [
      {
        "pageName": const PendingTasksScreen(),
        "title": AppLocalizations.of(context).translate('pendingtasks'),
      },
      {
        "pageName": const FavoriteTasksScreen(),
        "title": AppLocalizations.of(context).translate('favoritetasks')
      },
      {
        "pageName": const CompletedTasksScreen(),
        "title": AppLocalizations.of(context).translate('completedtasks')
      },
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          _pageDetail[_selectedPage]["title"],
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
              onPressed: () => _addTask(context), icon: const Icon(Icons.add))
        ],
      ),
      body: _pageDetail[_selectedPage]["pageName"],
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: () => _addTask(context),
        tooltip: "Add Task",
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (value) {
          setState(() {
            _selectedPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.pending_actions_rounded),
              label: "Pending Tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_rounded),
              label: "Favorite Tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_all_rounded), label: "Completed Tasks"),
        ],
      ),
    );
  }
}
