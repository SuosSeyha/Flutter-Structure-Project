import 'package:flutter/material.dart';
class GlobalContext {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext? getContext() {
    return navigatorKey.currentContext;
  }
}