import 'dart:math';

import 'package:dice/src/logic.dart';
import 'package:flutter/material.dart';

class Rolling extends StatefulWidget {
  const Rolling({super.key});

  @override
  State<Rolling> createState() => _RollingState();
}

class _RollingState extends State<Rolling> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  final random = Random();

  double val = 0.0;
  double val1 = 1.0;
  double val2 = 1.0;
  double size1 = 1.0;
  double size2 = 1.0;

  continueAnimation(AnimationController controller) async {
    while (true) {
      controller.forward();
      await Future.delayed(const Duration(milliseconds: 70));
      controller.reverse();
      await Future.delayed(const Duration(milliseconds: 70));
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 1).animate(controller);

    continueAnimation(controller);
  }

  @override
  Widget build(BuildContext context) {
    var diceIconsRand = getDiceIcon(random.nextInt(5) + 1);
    var diceIconsRand2 = getDiceIcon(random.nextInt(5) + 1);
    return AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          if (animation.value < 0.2) {
            diceIconsRand = getDiceIcon(random.nextInt(5) + 1);
            diceIconsRand2 = getDiceIcon(random.nextInt(5) + 1);
            val1 = 0.58;
            val2 = 0.90;
            size1 = 1.0;
            size2 = 0.9;
          } else if (animation.value < 0.4) {
            val1 = 0.73;
            val2 = 0.80;
            size1 = 1.0;
            size2 = 1.0;
          } else if (animation.value < 0.6) {
            val1 = 0.81;
            val2 = 0.70;
            size1 = 0.95;
            size2 = 1.0;
          } else if (animation.value < 0.8) {
            val1 = 0.90;
            val2 = 0.56;
            size1 = 0.86;
            size2 = 1.0;
          }

          return Center(
            child: Stack(children: [
              Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(val1 * 3.1415926535897932 / 2)
                  ..scale(size1),
                alignment: Alignment.centerLeft,
                child: Container(
                  color: Colors.white,
                  child: Icon(
                    diceIconsRand,
                    size: 180,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, -0.001)
                    ..rotateY(val2 * 3.1415926535897932 / 2)
                    ..scale(size2),
                  alignment: Alignment.centerRight,
                  child: Container(
                    color: Colors.white,
                    child: Icon(
                      diceIconsRand2,
                      size: 180,
                    ),
                  ),
                ),
              ),
            ]),
          );
        });
  }
}
