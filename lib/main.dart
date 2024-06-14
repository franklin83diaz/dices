import 'package:dice/src/logic.dart';
import 'package:dice/src/rolling.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final dice1 = Dice();
  int dice1Num = 0;
  final dice2 = Dice();
  int dice2Num = 0;
  bool rolling = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice',
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () async {
              setState(() {
                rolling = true;
              });
              await Future.delayed(Duration(milliseconds: 500));
              final n = await dice1.run(durationMiliSec: 1);
              final n2 = await dice2.run(durationMiliSec: 1);
              rolling = false;
              setState(() {
                dice1Num = n;
                dice2Num = n2;
              });
            },
            child: SizedBox(
              height: 450,
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    rolling
                        ? const Rolling()
                        : Icon(
                            getDiceIcon(dice1Num),
                            size: 180,
                          ),
                    const SizedBox(
                      height: 30,
                    ),
                    rolling
                        ? const Rolling()
                        : Icon(
                            getDiceIcon(dice2Num),
                            size: 180,
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
