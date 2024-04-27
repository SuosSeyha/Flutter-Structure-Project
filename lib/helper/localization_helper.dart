import 'package:flutter/material.dart';
import 'package:flutter_build_structure_project/constant/app_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LocalizationHelper extends ChangeNotifier{  
 static Future <void> setLanguage({required String language})async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    switch(language){
      case 'km': await prefs.setString(AppStyle.KEY_LANGUAGE, 'km');
      case 'en': await prefs.setString(AppStyle.KEY_LANGUAGE, 'en');
      case 'ko': await prefs.setString(AppStyle.KEY_LANGUAGE, 'ko');
    }
  }
  String? _local;
  Future<String> getLanguage()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.getString(AppStyle.KEY_LANGUAGE)!;
  }
  String? get local => _local;

}