import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xox/controller/settings_controller.dart';

class SettingsScreen extends StatelessWidget {

  final SettingsController settings = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Settings", style: TextStyle(color: Colors.black),),
        elevation: 1,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx((){
                return ElevatedButton(
                onPressed: () {
                  settings.soundFx.value = !settings.soundFx.value;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sound FX"),
                    Icon(
                      settings.soundFx.value ? Icons.volume_up : Icons.volume_off,
                      ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: settings.soundFx.value ? Colors.green : Colors.grey[400],
                ),
              );
              }),
              Obx(
                (){
                  return ElevatedButton(
                onPressed: () {
                  settings.musicFx.value = !settings.musicFx.value;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Music FX"),
                    Icon(
                       settings.musicFx.value ? Icons.volume_up : Icons.volume_off,
                      ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary:  settings.musicFx.value ? Colors.green : Colors.grey[400],
                ),
              );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
