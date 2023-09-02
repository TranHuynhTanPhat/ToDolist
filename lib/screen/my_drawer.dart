import 'package:flutter/material.dart';
import 'package:todo_list/blocs/bloc_exports.dart';
import 'package:todo_list/res/localization/app_localizations.dart';
import 'package:todo_list/services/route_paths.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Drawer(
        backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              child: Text(AppLocalizations.of(context).translate('taskdrawer'),
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(MainScreenId),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: Text(
                      AppLocalizations.of(context).translate('mytasks'),
                    ),
                    trailing: Text("${state.pendingTasks.length}"),
                  ),
                );
              },
            ),
            Divider(
              color: Theme.of(context).dividerColor,
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, RecycleBinId),
                  child: ListTile(
                    leading: const Icon(Icons.delete),
                    title: Text(AppLocalizations.of(context).translate('bin')),
                    trailing: Text("${state.removedTasks.length}"),
                  ),
                );
              },
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.language_rounded),
              title: ElevatedButton(
                onPressed: () {
                  AppLocalizations.of(context).isVnLocale
                      ? context.read<ResCubit>().toEnglish()
                      : context.read<ResCubit>().toVietnamese();
                },
                child: Text(
                  AppLocalizations.of(context).isVnLocale
                      ? AppLocalizations.of(context).translate('en')
                      : AppLocalizations.of(context).translate('vi'),
                ),
              ),
            ),
            BlocBuilder<ResCubit, ResState>(
              builder: (context, state) {
                return Switch(
                    trackOutlineColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.primary),
                    inactiveThumbColor: Theme.of(context).colorScheme.primary,
                    thumbIcon: MaterialStatePropertyAll(
                      state.switchTheme
                          ? Icon(
                              Icons.brightness_2_rounded,
                              color: Theme.of(context).colorScheme.primary,
                            )
                          : const Icon(
                              Icons.brightness_7_rounded,
                            ),
                    ),
                    value: state.switchTheme,
                    onChanged: (newValue) {
                      newValue
                          ? context.read<ResCubit>().toDartTheme()
                          : context.read<ResCubit>().toLightTheme();
                    });
              },
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
