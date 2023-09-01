import 'package:flutter/material.dart';
import 'package:todo_list/screen/recycle_bin.dart';
import 'package:todo_list/screen/task_screen.dart';
import 'package:todo_list/services/route_paths.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBinId:
        return MaterialPageRoute(builder: (_) => const RecycleBin());
      case TaskScreenId:
        return MaterialPageRoute(builder: (_) => const TaskScreen());
      default:
        return null;
    }
  }
}
