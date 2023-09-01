import 'package:equatable/equatable.dart';

import '../bloc_exports.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeInitial(switchTheme: false)) {
    on<SwitchOnEvent>((event, emit) {
      emit(const ThemeState(switchTheme: true));
    });
    on<SwitchOffEvent>((event, emit) {
      emit(const ThemeState(switchTheme: false));
    });
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toMap();
  }
}
