import 'package:get/get.dart';

class XOXController extends GetxController{
  var myXValue = "X".obs;
  var myOValue = "O".obs;
  var writtenValue = "".obs;
  var priority = false.obs;
  var winnerPlayer = "".obs;
  var player1Score = 0.obs;
  var player2Score = 0.obs;
  var changeSidesVisibility = true.obs;

  var myXOXList = [
    '', '', '',
    '', '', '',
    '', '', '',
  ].obs;


}