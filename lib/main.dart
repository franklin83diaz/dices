import 'package:dice/logic.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice',
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () async {
              final n = await dice1.run(durationMiliSec: 1);
              final n2 = await dice2.run(durationMiliSec: 1);
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
                    Icon(
                      getDiceIcon(dice1Num),
                      size: 180,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Icon(
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
