import 'package:flutter/material.dart';
import 'package:flutter_build_structure_project/features/home/presentation/view/home_screen.dart';

import 'package:flutter_build_structure_project/helper/global_context.dart';

class SlashController {
  BuildContext? globalContext = GlobalContext.getContext();
  Future <void> init()async{
    Future.delayed(const Duration(seconds: 2)).then((value){
    //Get.off(()=>const HomeScreen());
    // Get.off(()=> SettingScreen());
      Navigator.pushReplacement(globalContext!, MaterialPageRoute(builder: (context) {
        return  const HomeScreen();
      },));
    });
  }
}