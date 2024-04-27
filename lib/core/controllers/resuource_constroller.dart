import 'package:flutter/material.dart';
import 'package:flutter_build_structure_project/helper/localization_helper.dart';
class ResuourceController extends ChangeNotifier{
  LocalizationHelper localizationHelper = LocalizationHelper();
  String _local='km';
  Future<void> init()async{
    _local = await localizationHelper.getLanguage();
    notifyListeners();
  }
  String get local => _local;
}