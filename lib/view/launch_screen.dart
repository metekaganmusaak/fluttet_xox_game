import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xox/view/game_screen.dart';
import 'package:xox/view/settings_screen.dart';

class LaunchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "xox",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 100,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.red
                  ),
            ),
            SizedBox(
              height: Get.height/5,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                fixedSize: Size.fromWidth(300),
              ),
              onPressed: () {},
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.account_circle_rounded),
                  Text(" vs "),
                  Icon(Icons.computer_rounded),
                  Text("  |"),
                ],
              ),
              label: Text("Singleplayer"),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                fixedSize: Size.fromWidth(300),
              ),
              onPressed: () => Get.to(GameScreen()),
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.account_circle_rounded),
                  Text(" vs "),
                  Icon(Icons.account_circle_rounded),
                  Text("  |"),
                ],
              ),
              label: Text("Co-op"),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                fixedSize: Size.fromWidth(300),
              ),
              onPressed: () {},
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.account_circle_rounded),
                  Text(" vs "),
                  Icon(Icons.supervisor_account_rounded),
                  Text("  |"),
                ],
              ),
              label: Text("Multiplayer"),
            ),
            Divider(),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                fixedSize: Size.fromWidth(300),
              ),
              onPressed: () => Get.to(SettingsScreen()),
              icon: Icon(Icons.settings),
              label: Text("Settings"),
            ),
          ],
        ),
      ),
    );
  }
}
