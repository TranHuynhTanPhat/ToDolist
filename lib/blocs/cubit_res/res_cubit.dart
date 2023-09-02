import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_list/blocs/bloc_exports.dart';

part 'res_state.dart';

class ResCubit extends HydratedCubit<ResState> {
  ResCubit() : super(const ResInit(locale: Locale("vi"), switchTheme: false));

  void toVietnamese() => emit(
      ResState(locale: const Locale('vi'), switchTheme: state.switchTheme));
  void toEnglish() => emit(
      ResState(locale: const Locale('en'), switchTheme: state.switchTheme));
  void toLightTheme() =>
      emit(ResState(locale: state.locale, switchTheme: false));
  void toDartTheme() => emit(ResState(locale: state.locale, switchTheme: true));

  @override
  ResState? fromJson(Map<String, dynamic> json) {
    return ResState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ResState state) {
    return state.toMap();
  }
}
