part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState({
    required this.themeMode,
    this.randomInt = 0,
  });

  //This is used to make sure that all thememode changes are reflected
  final int randomInt;
  final ThemeMode themeMode;

  @override
  List<Object> get props => [themeMode, randomInt];

  SettingsState copyWith({
    ThemeMode? themeMode,
  }) {
    return SettingsState(
        themeMode: themeMode ?? this.themeMode,
        randomInt: Random().nextInt(999));
  }
}

class SettingsInitial extends SettingsState {
  const SettingsInitial._({
    required ThemeMode themeMode,
  }) : super(themeMode: themeMode);

  factory SettingsInitial({
    required SharedPreferences prefs,
  }) {
    final settingsService = SettingsService(preferences: prefs);

    return SettingsInitial._(
      themeMode: settingsService.getThemeMode(),
    );
  }
}
