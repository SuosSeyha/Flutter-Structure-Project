import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_build_structure_project/core/controllers/resuource_constroller.dart';
import 'package:flutter_build_structure_project/features/no_internet/presentation/controllers/connection_manager_controller.dart';
import 'package:flutter_build_structure_project/features/splash_screen/presentation/view/splash_screen.dart';
import 'package:flutter_build_structure_project/helper/global_context.dart';
import 'package:flutter_build_structure_project/l10n/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ConnectionManagerController(),),
        ChangeNotifierProvider(create: (context) => ResuourceController(),),
      ],
      child: const MyApp(),
    )
  );
  checkConnection();
  // loadLanguage();
}
void checkConnection(){
  Future.delayed(const Duration(seconds: 8)).then((value){
  ConnectionManagerController connectionManagerController = ConnectionManagerController();
  connectionManagerController.initializeConnection();
  });
}
// void   loadLanguage()async{
//   await LocalizationHelper().getLanguage();
//   print("Language: ${LocalizationHelper().local}");
// }
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
   // loadLanguage();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ResuourceController>(
      builder: (context, controller, child) {
        print("LOCALLL: ${controller.local}");
       // controller.init();
          return MaterialApp(
            locale:  Locale(controller.local),
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalizations.delegate,
            ],
            navigatorKey: GlobalContext.navigatorKey,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home: const SplashScreen()
          ); 
      },
    );
  
  }
}

