import 'package:flutter/material.dart';
import 'package:flutter_build_structure_project/constant/app_langauge.dart';
import 'package:flutter_build_structure_project/core/widget_custom/general_appbar.dart';
import 'package:flutter_build_structure_project/features/setting/presentation/controllers/setting_screen_controller.dart';
import 'package:flutter_build_structure_project/helper/localization_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:provider/provider.dart';
class SettingScreen extends StatefulWidget {
   const SettingScreen({super.key});
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        SettingScreenController settingScreenController = SettingScreenController();
        settingScreenController.init();
        return settingScreenController;
      },
      child: Consumer<SettingScreenController>(builder: (context, value, child) {
        return Scaffold(
          appBar: const General_AppBar(
            title: "SETTING LANGUAGE",
          ),
          body: Column(
            children: [
              ListTile(
                title:  Text(AppLocalizations.of(context)!.khmer),
                leading: Radio<LanguageOption>(
                  value: LanguageOption.khmer,
                  groupValue: SettingScreenController().languageOption,
                  onChanged: (value) {
                    setState(() {
                      LocalizationHelper.setLanguage(language: 'km');
                      SettingScreenController().languageOption = value!;
                    });
                  },
                )
              ),
              ListTile(
                title:  Text(AppLocalizations.of(context)!.enlish),
                leading: Radio<LanguageOption>(
                  value: LanguageOption.english,
                  groupValue: SettingScreenController().languageOption,
                  onChanged: (value) {
                    setState(() {
                      LocalizationHelper.setLanguage(language: 'en');
                      SettingScreenController().languageOption = value!;
                    });
                  },
                )
              ),
              ListTile(
              title:  Text(AppLocalizations.of(context)!.korean),
              leading: Radio<LanguageOption>(
                value: LanguageOption.korean,
                groupValue: SettingScreenController().languageOption,
                onChanged: (value) {
                  setState(() {
                    LocalizationHelper.setLanguage(language: 'ko');
                    SettingScreenController().languageOption = value!;
                  });
                },
              )
            )
            ],
          ),
        );
      },),
    );
  }
}