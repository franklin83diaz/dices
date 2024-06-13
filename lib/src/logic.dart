import 'dart:async';
import 'dart:math';
import 'package:dice_icons/dice_icons.dart';
import 'package:flutter/widgets.dart';

final random = Random();

class Dice {
  Future<int> run({int durationMiliSec = 1000}) async {
    await Future.delayed(Duration(milliseconds: durationMiliSec));
    return random.nextInt(5) + 1;
  }
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
