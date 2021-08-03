import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xox/view/launch_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'XOX',
      home: LaunchScreen(),
      theme: ThemeData(
        primaryIconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
    );
  }
}
