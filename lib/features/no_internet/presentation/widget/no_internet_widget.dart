import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
Widget offlinePage() {
  return Scaffold(
   // backgroundColor: Colors.amber,
    body: Container(
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
      //color: Colors.pinkAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/jsons/no_connection.json',
            height: 300,
            width: 400,
            fit: BoxFit.cover, 
          ),
        ],
      ),
    ),
  );
}