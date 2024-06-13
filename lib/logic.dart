import 'dart:async';
import 'dart:math';
import 'package:dice_icons/dice_icons.dart';
import 'package:flutter/widgets.dart';

final random = Random();

class Dice {
  bool _running = false;
  var numberUp = 0;
  Future<int> run({int durationMiliSec = 1000}) async {
    _running = true;
    numberUp = 0;
    await Future.delayed(Duration(milliseconds: durationMiliSec));
    numberUp = random.nextInt(5) + 1;
    _running = false;
    return numberUp;
  }

  bool get running => _running;
}

IconData getDiceIcon(int n) {
  switch (n) {
    case 1:
      return DiceIcons.dice1;
    case 2:
      return DiceIcons.dice2;
    case 3:
      return DiceIcons.dice3;
    case 4:
      return DiceIcons.dice4;
    case 5:
      return DiceIcons.dice5;
    default:
      return DiceIcons.dice6;
  }
}
