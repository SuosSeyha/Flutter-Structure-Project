// ignore_for_file: use_build_context_synchronously
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_build_structure_project/features/no_internet/presentation/widget/no_internet_widget.dart';
import 'package:flutter_build_structure_project/helper/global_context.dart';
enum MobileConnection {offline,online}
class ConnectionManagerController extends ChangeNotifier{
int connectionState=0;
bool isConnection=false;
final Connectivity connectivityResult = Connectivity();
Future<void> initializeConnection() async{
  await getConnection();
  connectivityResult.onConnectivityChanged.listen((result) {
      _updateState(result);
  });
  notifyListeners();
}
Future<void> getConnection()async{
 try {
      final connectivityResult = await Connectivity().checkConnectivity();
      _updateState(connectivityResult);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(kDebugMode.toString());
      }
    }
    notifyListeners();
}
void _updateState(ConnectivityResult result){
  BuildContext? globalContext = GlobalContext.getContext();
  switch (result) {
      case ConnectivityResult.wifi:{
       isConnection?Navigator.of(globalContext!,rootNavigator: true).pop():null;
      // isConnection?Get.back():null;
        print("WIFI CONNECTED");
      }break; 
      case ConnectivityResult.mobile:{
        isConnection?Navigator.of(globalContext!,rootNavigator: true).pop():null;
        //isConnection?Get.back():null;
        print("INTERNET CONNECTED");
      }break;
      case ConnectivityResult.none:{
        print("NO CONNECTION");
        isConnection=true;
        showDialog(
          context: globalContext!, 
          builder: (globalContext) {
            return offlinePage();
          },
        );
        print("NO CCCCCCCCCC");
      }break;
      default:
        break;
    }
    notifyListeners();
}
  
}