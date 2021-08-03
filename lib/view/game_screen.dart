import 'package:audioplayers/audioplayers.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xox/controller/xox_controller.dart';

class GameScreen extends StatelessWidget {
  final XOXController xox = Get.put(XOXController());
  final playerX = AudioCache();
  final playerO = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "XOX",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(21.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(() {
                    return AvatarGlow(
                      endRadius: 50,
                      glowColor: Colors.green.shade800,
                      curve: Curves.easeInOutCubic,
                      animate: xox.priority.value == false ? true : false,
                      repeat: true,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color.fromARGB(100, 0, 200, 0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("P1"),
                            Obx(() {
                              return Text(
                                xox.player1Score.value.toString(),
                                style: TextStyle(fontSize: 48),
                              );
                            }),
                          ],
                        ),
                      ),
                    );
                  }),
                  Text(
                    "vs",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                  Obx(() {
                    return AvatarGlow(
                      endRadius: 50,
                      glowColor: Colors.red,
                      curve: Curves.easeInOutCubic,
                      repeat: true,
                      animate: xox.priority.value == false ? false : true,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color.fromARGB(100, 255, 0, 0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("P2"),
                            Obx(() {
                              return Text(
                                xox.player2Score.value.toString(),
                                style: TextStyle(fontSize: 48),
                              );
                            }),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        xox.changeSidesVisibility.value = false;
                        if (xox.priority.value == false &&
                            xox.myXOXList[index] == '') {
                          xox.myXOXList[index] = xox.myXValue.value;
                          winningStates(context);
                          xox.priority.value = !xox.priority.value;
                          
                          playerX.play("x_sound.mp3");
                        } else if (xox.priority.value == true &&
                            xox.myXOXList[index] == '') {
                          xox.myXOXList[index] = xox.myOValue.value;
                          winningStates(context);
                          xox.priority.value = !xox.priority.value;
                          
                          playerO.play("o_sound.mp3");
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black87,


                        ),
                        child: Center(
                          child: Obx(() {
                            return Text(
                              xox.myXOXList[index],
                              style: TextStyle(
                                color: xox.myXOXList[index] == 'X'
                                    ? Colors.green
                                    : Colors.red,
                                fontSize: 48,
                              ),
                            );
                          }),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(() {
                    return Visibility(
                      visible: xox.changeSidesVisibility.value,
                      child: ElevatedButton.icon(
                          onPressed: () {
                            changeSides();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.yellow[800],
                          ),
                          icon: Icon(
                            Icons.change_circle_rounded,
                            color: Colors.white,
                          ),
                          label: Text("Change Sides")),
                    );
                  }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      restartGame();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.greenAccent[700],
                    ),
                    icon: Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                    label: Text("Refresh"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      clearScores();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent[700],
                    ),
                    icon: Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                    label: Text("Clear Scores"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void winningStates(context) {
    if (xox.myXOXList[0] == xox.myXOXList[1] &&
        xox.myXOXList[1] == xox.myXOXList[2] &&
        xox.myXOXList[2] == xox.myXOXList[0] &&
        (xox.myXOXList[2] == 'X' || xox.myXOXList[2] == 'O')) {
      xox.winnerPlayer.value = xox.myXOXList[1];
      increaseScore(context);
    } else if (xox.myXOXList[3] == xox.myXOXList[4] &&
        xox.myXOXList[4] == xox.myXOXList[5] &&
        xox.myXOXList[5] == xox.myXOXList[3] &&
        (xox.myXOXList[5] == 'X' || xox.myXOXList[5] == 'O')) {
      xox.winnerPlayer.value = xox.myXOXList[4];
      increaseScore(context);
    } else if (xox.myXOXList[6] == xox.myXOXList[7] &&
        xox.myXOXList[7] == xox.myXOXList[8] &&
        xox.myXOXList[8] == xox.myXOXList[6] &&
        (xox.myXOXList[7] == 'X' || xox.myXOXList[7] == 'O')) {
      xox.winnerPlayer.value = xox.myXOXList[7];
      increaseScore(context);
    } else if (xox.myXOXList[0] == xox.myXOXList[3] &&
        xox.myXOXList[3] == xox.myXOXList[6] &&
        xox.myXOXList[6] == xox.myXOXList[0] &&
        (xox.myXOXList[6] == 'X' || xox.myXOXList[6] == 'O')) {
      xox.winnerPlayer.value = xox.myXOXList[3];
      increaseScore(context);
    } else if (xox.myXOXList[1] == xox.myXOXList[4] &&
        xox.myXOXList[4] == xox.myXOXList[7] &&
        xox.myXOXList[7] == xox.myXOXList[1] &&
        (xox.myXOXList[4] == 'X' || xox.myXOXList[4] == 'O')) {
      xox.winnerPlayer.value = xox.myXOXList[4];
      increaseScore(context);
    } else if (xox.myXOXList[2] == xox.myXOXList[5] &&
        xox.myXOXList[5] == xox.myXOXList[8] &&
        xox.myXOXList[8] == xox.myXOXList[2] &&
        (xox.myXOXList[5] == 'X' || xox.myXOXList[5] == 'O')) {
      xox.winnerPlayer.value = xox.myXOXList[5];
      increaseScore(context);
    } else if (xox.myXOXList[0] == xox.myXOXList[4] &&
        xox.myXOXList[4] == xox.myXOXList[8] &&
        xox.myXOXList[8] == xox.myXOXList[0] &&
        (xox.myXOXList[4] == 'X' || xox.myXOXList[4] == 'O')) {
      xox.winnerPlayer.value = xox.myXOXList[4];
      increaseScore(context);
    } else if (xox.myXOXList[2] == xox.myXOXList[4] &&
        xox.myXOXList[4] == xox.myXOXList[6] &&
        xox.myXOXList[6] == xox.myXOXList[2] &&
        (xox.myXOXList[4] == 'X' || xox.myXOXList[4] == 'O')) {
      xox.winnerPlayer.value = xox.myXOXList[4];
      increaseScore(context);
    } else if (xox.myXOXList[0] != '' &&
        xox.myXOXList[1] != '' &&
        xox.myXOXList[2] != '' &&
        xox.myXOXList[3] != '' &&
        xox.myXOXList[4] != '' &&
        xox.myXOXList[5] != '' &&
        xox.myXOXList[6] != '' &&
        xox.myXOXList[7] != '' &&
        xox.myXOXList[8] != '') {
      xox.winnerPlayer.value = "DRAW";
      increaseScore(context);
    }
  }

  void increaseScore(context) {
    if (xox.winnerPlayer.value == 'X') {
      xox.player1Score.value++;
      debugPrint(
          "brocum x kazandığundaki statedeki winnerPlayer: ${xox.winnerPlayer.value}");
          playerX.play('victory_sound.mp3');
      dialogPopup(context, 'X');
      restartGame();
      xox.winnerPlayer.value = '';
    } else if (xox.winnerPlayer.value == 'O') {
      xox.player2Score.value++;
      debugPrint(
          "brocum x kazandığundaki statedeki winnerPlayer: ${xox.winnerPlayer.value}");
          playerO.play('victory_sound.mp3');
      dialogPopup(context, 'O');
      restartGame();
      xox.winnerPlayer.value = '';
    } else if (xox.winnerPlayer.value == 'DRAW') {
      debugPrint("brocum bu draw");
      playerX.play('draw_sound.mp3');
      dialogPopup(context, "NOBODY");
      restartGame();
    }
  }

  void dialogPopup(context, String winnerPlayer) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.all(30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: Colors.white,
            elevation: 14,
            title: Center(
              child: Text(
                winnerPlayer == "NOBODY" ? "DRAW!" :  winnerPlayer + " WON!",
                style: TextStyle(
                  color: winnerPlayer == 'X' ? Colors.green : Colors.red,
                  fontSize: 24,
                  ),
              ),
            ),
          );
        });
  }

  void restartGame() {
    for (int i = 0; i < 9; i++) {
      xox.myXOXList[i] = '';
    }
    xox.changeSidesVisibility.value = true;
  }

  void changeSides() {
    if (xox.myXOXList[0] == '' &&
        xox.myXOXList[1] == '' &&
        xox.myXOXList[2] == '' &&
        xox.myXOXList[3] == '' &&
        xox.myXOXList[4] == '' &&
        xox.myXOXList[5] == '' &&
        xox.myXOXList[6] == '' &&
        xox.myXOXList[7] == '' &&
        xox.myXOXList[8] == '') {
      xox.priority.value = !xox.priority.value;
    }
  }

  void clearScores() {
    xox.player1Score.value = 0;
    xox.player2Score.value = 0;
  }
}
