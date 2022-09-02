// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState({this.themeMode = ThemeMode.system, this.randomInt = 0});
  final ThemeMode themeMode;
  //This is used to make sure that all thememode changes are reflected
  final int randomInt;

  @override
  List<Object> get props => [themeMode, randomInt];

  SettingsState copyWith({ThemeMode? themeMode, int? randomInt}) {
    return SettingsState(
        themeMode: themeMode ?? this.themeMode,
        randomInt: randomInt ?? this.randomInt);
  }
}

class SettingsInitial extends SettingsState {}
