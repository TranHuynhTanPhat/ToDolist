import 'package:flutter/material.dart';
import 'package:todo_list/screen/main_screen.dart';

import 'package:todo_list/services/app_route.dart';
import 'package:todo_list/services/app_theme.dart';
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
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TasksBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        )
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemes.appThemeData[AppTheme.lightTheme],
            darkTheme: AppThemes.appThemeData[AppTheme.dartTheme],
            themeMode: state.switchTheme ? ThemeMode.dark : ThemeMode.light,
            home: const MainScreen(),
            onGenerateRoute: appRouter.onGenerateRoute,
            initialRoute: MainScreenId,
          );
        },
      ),
    );
  }
}
