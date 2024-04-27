import 'package:flutter/material.dart';
import 'package:flutter_build_structure_project/constant/app_langauge.dart';
import 'package:flutter_build_structure_project/core/controllers/resuource_constroller.dart';
class SettingScreenController extends ChangeNotifier{
  late LanguageOption languageOption = LanguageOption.khmer;
  init()async{
    ResuourceController  resuourceController =  ResuourceController();
    print("===>APPLAN: ${resuourceController.local}");
    switch(resuourceController.local){
      case 'km': languageOption = LanguageOption.khmer;
      case 'en': languageOption = LanguageOption.english;
      case 'ko': languageOption = LanguageOption.korean;
      notifyListeners();
    }
    
  }
}