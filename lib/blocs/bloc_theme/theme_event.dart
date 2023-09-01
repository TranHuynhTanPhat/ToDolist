part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class SwitchOnEvent extends ThemeEvent{}
class SwitchOffEvent extends ThemeEvent{}
