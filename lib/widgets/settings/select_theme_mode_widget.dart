import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/strings.dart';
import '../../cubits/cubits.dart';

//builds the options for selecting app theme
class SelectThemeModeWidget extends StatefulWidget {
  const SelectThemeModeWidget({Key? key}) : super(key: key);

  @override
  State<SelectThemeModeWidget> createState() => _SelectThemeModeWidgetState();
}

class _SelectThemeModeWidgetState extends State<SelectThemeModeWidget> {
  late ThemeMode selectedValue;
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    selectedValue = context.read<SettingsCubit>().state.themeMode;
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  void didUpdateWidget(covariant SelectThemeModeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    selectedValue = context.watch<SettingsCubit>().state.themeMode;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Text(
                stringSelectThemeMode,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const Divider(),
            RadioListTile<ThemeMode>(
                value: ThemeMode.light,
                title: const Text(stringThemeModeLight),
                secondary: const Icon(Icons.light_mode),
                groupValue: selectedValue,
                onChanged: (value) => setState(() {
                      selectedValue = value!;
                      context
                          .read<SettingsCubit>()
                          .changeThemeMode(themeMode: selectedValue);
                    })),
            const Divider(),
            RadioListTile<ThemeMode>(
                value: ThemeMode.dark,
                title: const Text(stringThemeModeDark),
                secondary: const Icon(Icons.dark_mode),
                groupValue: selectedValue,
                onChanged: (value) => setState(() {
                      selectedValue = value!;
                      context
                          .read<SettingsCubit>()
                          .changeThemeMode(themeMode: selectedValue);
                    })),
            const Divider(),
            RadioListTile<ThemeMode>(
                value: ThemeMode.system,
                title: const Text(stringThemeModeSystem),
                secondary: const Icon(Icons.computer),
                groupValue: selectedValue,
                onChanged: (value) => setState(() {
                      selectedValue = value!;
                      context
                          .read<SettingsCubit>()
                          .changeThemeMode(themeMode: selectedValue);
                    })),
            const Divider()
          ],
        ),
      ),
    );
  }
}
