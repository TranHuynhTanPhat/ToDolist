// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import './bloc/bloc_imports.dart';
// import 'package:todo_list/screen/task_screen.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

// final storage = await HydratedStorage.build(
//     storageDirectory: await getApplicationDocumentsDirectory());
//   HydratedBloc.storage = storage;
//   Bloc.observer=MyBlocObserver();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CounterBloc(),
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
// colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// useMaterial3: true,
//         ),
//         home: const HomeScreen(title: 'Flutter Demo Home Page'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'package:todo_list/screen/task_screen.dart';
import 'package:todo_list/services/app_route.dart';
import 'package:todo_list/services/route_paths.dart';

import 'blocs/bloc_exports.dart';
import 'package:path_provider/path_provider.dart';
// import 'models/task.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBloc.storage = storage;

  // BlocOverrides.runZoned(
  //   () => runApp(const MyApp()),
  // );
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TaskScreen(),
        onGenerateRoute: appRouter.onGenerateRoute,
        initialRoute: TaskScreenId,
      ),
    );
  }
}
