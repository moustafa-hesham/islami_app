import 'package:flutter/material.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:islami_app/ui/Utilities/app_colors.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SettingsTab extends StatefulWidget {
  SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool languageSwitch = false;
  bool darkModeSwitch = false;

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Text(
          AppLocalizations.of(context)!.settings,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        buildSettingsRow(
            title: 'العربيه',
            switchValue: languageSwitch,
            onChange: (newValue) {
              languageSwitch = newValue;
              if (languageSwitch) {
                provider.setCurrentLocal('ar');
              } else {
                provider.setCurrentLocal('en');
              }
            }),
        buildSettingsRow(
            title: AppLocalizations.of(context)!.darkmode,
            switchValue: darkModeSwitch,
            onChange: (newValue) {
              darkModeSwitch = newValue;
              if (darkModeSwitch) {
                provider.setCurrentMode(ThemeMode.dark);
              } else {
                provider.setCurrentMode(ThemeMode.light);
              }
            })
      ],
    );
  }

  Widget buildSettingsRow(
      {required String title,
      required bool switchValue,
      required Function(bool) onChange}) {
    return Row(
      children: [
        const SizedBox(
          width: 12,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const Spacer(),
        Switch(
          value: switchValue,
          onChanged: onChange,
          activeColor: AppColor.primary,
        )
      ],
    );
  }
}
