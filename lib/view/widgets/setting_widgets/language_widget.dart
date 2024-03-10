import 'package:better_one/core/enum/language_enum.dart';
import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('setting.language.title'.tr()),
          const SizedBox(width: 10),
          DropdownMenu<String>(
            initialSelection: SettingViewModel.get(context)
                .state
                .currentLanguage!
                .languageCode,
            onSelected: (value) {
              SettingViewModel.get(context).changeLanguage(Locale(value!));
              context.setLocale(Locale(value));
            },
            dropdownMenuEntries: List.generate(
              Language.values.length,
              (index) {
                return DropdownMenuEntry(
                  label: Language.values[index].langName,
                  value: Language.values[index].name,
                  labelWidget: Text(
                    Language.values[index].langName,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
