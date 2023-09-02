import 'package:flutter/material.dart';
import 'package:todo_list/blocs/bloc_exports.dart';
import 'package:todo_list/res/localization/app_localizations.dart';
import 'package:todo_list/services/guid_gen.dart';

import '../models/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    super.key,
  });

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  DateTimeRange? dateRange;
  TimeOfDay? timeAlert;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              AppLocalizations.of(context).translate('addtask'),
              style: const TextStyle(fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).translate('title'),
                hintText: AppLocalizations.of(context).translate('title'),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextField(
              controller: descriptionController,
              minLines: 3,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context).translate('description'),
                // labelText:
                //     AppLocalizations.of(context).translate('description'),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: dateController,
                    readOnly: true,
                    onTap: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      dateRange = await showDatetimeRagePicker(context);
                      if (dateRange != null) {
                        setState(() {
                          dateController.text =
                              "${dateRange?.duration.inDays.toString()} ${AppLocalizations.of(context).translate('days')}";
                        });
                        // "${DateFormat('dd/MM/yyyy').format(dateRange!.start)} - ${DateFormat('dd/MM/yyyy').format(dateRange!.end)}";
                      }
                    },
                    decoration: InputDecoration(
                      hintText:
                          AppLocalizations.of(context).translate('deadline'),
                      labelText:
                          AppLocalizations.of(context).translate('deadline'),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.alarm_rounded,
                    color: dateRange == null
                        ? Theme.of(context).colorScheme.onBackground
                        : Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: dateRange != null
                      ? () async {
                          timeAlert = await showTimePickerPopup(context);
                        }
                      : null,
                )
              ],
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(top: 10),
          //   child: TextField(
          //     controller: timeController,
          //     readOnly: true,
          //     onTap: () async {
          //       FocusManager.instance.primaryFocus?.unfocus();
          //       dateRange = await showDatetimeRagePicker(context);
          //       if (dateRange != null) {
          //         dateController.text =
          //             "${dateRange?.duration.inDays.toString()} ${AppLocalizations.of(context).translate('days')}";
          //         // "${DateFormat('dd/MM/yyyy').format(dateRange!.start)} - ${DateFormat('dd/MM/yyyy').format(dateRange!.end)}";
          //       }
          //     },
          //     decoration: InputDecoration(
          //       hintText: "--:--",
          //       labelText: AppLocalizations.of(context).translate('time'),
          //       border: const OutlineInputBorder(
          //           borderRadius: BorderRadius.all(Radius.circular(15))),
          //     ),
          //   ),
          // ),
          // DateRangePickerDialog(currentDate: DateTime.now(),
          //     firstDate: DateTime(1900), lastDate: DateTime(2100)),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppLocalizations.of(context).translate('cancel'),
                    )),
                ElevatedButton(
                  onPressed: () {
                    String begin = dateRange != null
                        ? dateRange!.start.toString()
                        : "";
                    String end =
                        dateRange != null ? dateRange!.end.toString() : "";
                    String alert = timeAlert != null
                        ? "${timeAlert?.hour.toString()}:${timeAlert?.minute.toString()}"
                        : "";
                    var task = Task(
                        title: titleController.text,
                        id: UUID().generate(),
                        description: descriptionController.text,
                        begin: begin,
                        end: end,
                        alert: alert);
                    context.read<TasksBloc>().add(AddTask(task: task));
                    Navigator.pop(context);
                  },
                  child: Text(
                    AppLocalizations.of(context).translate('add'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<TimeOfDay?> showTimePickerPopup(BuildContext context) async {
    return await showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  Future<DateTimeRange?> showDatetimeRagePicker(BuildContext context) async {
    return await showDateRangePicker(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
  }
}
