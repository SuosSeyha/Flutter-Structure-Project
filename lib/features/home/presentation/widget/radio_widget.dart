import 'package:flutter/material.dart';
import 'package:flutter_build_structure_project/constant/app_langauge.dart';
// ignore: must_be_immutable
class RadioWidget extends StatelessWidget {
  final String title;
  final void Function(LanguageOption? value) onChanged;
   RadioWidget({
    super.key,
    required this.title,
    required this.onChanged
  });
  
  LanguageOption _languageOption = LanguageOption.khmer;
  @override
  Widget build(BuildContext context) {
    return ListTile(
          title:  Text(title),
          leading: Radio<LanguageOption>(
            value: LanguageOption.khmer,
            groupValue: _languageOption,
            onChanged: onChanged
          )
        );
  }
}