import 'dart:async';
import 'package:equatable/equatable.dart';

import '../../models/task.dart';
import '../bloc_exports.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
    on<RestoreTask>(_onRestoreTask);
  }

  FutureOr<void> _onAddTask(AddTask event, Emitter<TasksState> emit) {
    emit(
      TasksState(
        pendingTasks: List.from(state.pendingTasks)..add(event.task),
        removedTasks: state.removedTasks,
        favoritedTasks: state.favoritedTasks,
        completedTasks: state.completedTasks,
      ),
    );
  }

  FutureOr<void> _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final Task task = event.task;
    // final int index = state.pendingTasks.indexOf(task);
    List<Task> pendingTasks = List.from(state.pendingTasks);
    List<Task> completedTasks = List.from(state.completedTasks);
    task.isDone == false
        ? {
            pendingTasks = List.from(state.pendingTasks)..remove(task),
            completedTasks = List.from(state.completedTasks)
              ..insert(0, task.copyWith(isDone: true)),
          }
        : {
            completedTasks = List.from(state.completedTasks)..remove(task),
            pendingTasks = List.from(state.pendingTasks)
              ..insert(0, task.copyWith(isDone: false)),
          };
    emit(
      TasksState(
        pendingTasks: pendingTasks,
        removedTasks: state.removedTasks,
        favoritedTasks: state.favoritedTasks,
        completedTasks: completedTasks,
      ),
    );
  }

  FutureOr<void> _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    emit(
      TasksState(
        pendingTasks: state.pendingTasks,
        removedTasks: List.from(state.removedTasks)..remove(event.task),
        favoritedTasks: state.favoritedTasks,
        completedTasks: state.completedTasks,
      ),
    );
  }

  FutureOr<void> _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    emit(
      TasksState(
        pendingTasks: List.from(state.pendingTasks)..remove(event.task),
        removedTasks: List.from(state.removedTasks)
          ..add(event.task.copyWith(isDeleted: true)),
        favoritedTasks: List.from(state.favoritedTasks)..remove(event.task),
        completedTasks: List.from(state.completedTasks)..remove(event.task),
      ),
    );
  }

  FutureOr<void> _onRestoreTask(RestoreTask event, Emitter<TasksState> emit) {
    final Task task = event.task;
    List<Task> removedTasks = List.from(state.completedTasks)..remove(task);
    List<Task> pendingTasks = List.from(state.pendingTasks);
    List<Task> completedTasks = List.from(state.completedTasks);
    task.isDone == true
        ? {
            completedTasks = List.from(state.completedTasks)
              ..add(task.copyWith(isDeleted: false)),
          }
        : {
            pendingTasks = List.from(state.pendingTasks)
              ..add(task.copyWith(isDeleted: false)),
          };
        print(completedTasks);
    emit(
      TasksState(
        pendingTasks: pendingTasks,
        removedTasks: removedTasks,
        favoritedTasks: state.favoritedTasks,
        completedTasks: completedTasks,
      ),
    );
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
