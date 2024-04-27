import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_build_structure_project/constant/app_color.dart';
import 'package:flutter_build_structure_project/constant/app_style.dart';
import 'package:flutter_build_structure_project/core/controllers/resuource_constroller.dart';
import 'package:flutter_build_structure_project/features/splash_screen/presentation/controller/slash_controller.dart';
import 'package:provider/provider.dart';
import 'package:typewritertext/typewritertext.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String title ="Welcome back again  ";
  initScreen(){
    Future.delayed(Duration(milliseconds: title.length * 100 )).then((value){
      SlashController().init();
    });
  }
  @override
  void initState() {
   initScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ResuourceController>(
      builder: (context, controller, child) {
        controller.init();
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                TypeWriterText(
                  repeat: false,
                  text: Text(title,
                      textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppStyle.fontSize,
                      fontWeight: AppStyle.medium,
                      color: AppColor.textColor
                    ),), 
                  duration: const Duration(milliseconds: 100)),
                ],
              ),
            ),
          ),
        );
      },);
  }
}