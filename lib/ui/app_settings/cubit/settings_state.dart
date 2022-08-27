part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState({this.themeMode = ThemeMode.system});
  final ThemeMode themeMode;

  @override
  List<Object> get props => [themeMode];

  SettingsState copyWith({
    ThemeMode? themeMode,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}

class SettingsInitial extends SettingsState {}
