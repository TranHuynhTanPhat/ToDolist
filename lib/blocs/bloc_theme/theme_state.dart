part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final bool switchTheme;
  const ThemeState({required this.switchTheme});

  @override
  List<Object> get props => [switchTheme];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'switchTheme': switchTheme});

    return result;
  }

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(
      switchTheme: map['switchTheme'] ?? false,
    );
  }
}

final class ThemeInitial extends ThemeState {
  const ThemeInitial({required super.switchTheme});
}
