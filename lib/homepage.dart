import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sample_project/barriers.dart';
import 'package:sample_project/bird.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double birdYaxis = 0.0;
  double time = 0.0;
  double height = 0.0;
  double initialHeight = 0.0;
  bool startGame = false;
  List<double> barrierXaxis = [0.6, 2.1, 3.6, 5.1, 6.6];
  List<List<double>> barrierHeight = [
    [0.5, 1, 0.6, 0.3, 0.7],
    [0.3, 0.2, 0.4, 1.0, 0.5],
  ];
  double barrierWidth = 0.4;
  double speed = 0.02;
  int score = 0;
  double birdWidth = 0.5;
  double birdHeight = 0.5;
  int highScore = 0;

  void resetGame() {
    Navigator.pop(context);
    //print('Test');
    setState(() {
      if (score > highScore) {
        setState(() {
          highScore = score;
        });
      }
      score = 0;
      birdYaxis = 0;
      startGame = false;
      time = 0;
      speed = 0.02;
      initialHeight = birdYaxis;
      barrierXaxis = [0.6, 1.6, 2.6, 3.6, 4.6];
    });
  }

  void _showDialog() {
    //print('Test2');
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.brown,
            title: const Center(
                child: Text('GAME OVER',
                    style: TextStyle(
                      color: Colors.white70,
                    ))),
            actions: [
              GestureDetector(
                  onTap: resetGame,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                        padding: const EdgeInsets.all(7),
                        color: Colors.white70,
                        child: const Text(
                          'PLAY AGAIN',
                          style: TextStyle(color: Colors.brown),
                        )),
                  ))
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (startGame) {
            jump();
          } else {
            startJumpGame();
          }
        },
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                  flex: 10,
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        color: Colors.lightBlueAccent,
                        // ignore: prefer_const_constructors
                        duration: Duration(milliseconds: 0),
                        alignment: Alignment(0.0, birdYaxis),
                        child: const MyBird(),
                      ),
                      Container(
                        alignment: const Alignment(0.0, -0.3),
                        child: startGame
                            ? const Text('')
                            : const Text(
                                'TAP TO PLAY',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white70,
                                ),
                              ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXaxis[0], 1.1),
                        duration: const Duration(
                          milliseconds: 0,
                        ),
                        child: Barrier(
                          barrierX: barrierXaxis[0],
                          BarrierWidth: barrierWidth,
                          BarrierHeight: barrierHeight[0][0],
                          isBottomBarrier: true,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXaxis[0], -1.1),
                        duration: const Duration(
                          milliseconds: 0,
                        ),
                        child: Barrier(
                          barrierX: barrierXaxis[0],
                          BarrierWidth: barrierWidth,
                          BarrierHeight: barrierHeight[1][0],
                          isBottomBarrier: false,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXaxis[1], 1.1),
                        duration: const Duration(
                          milliseconds: 0,
                        ),
                        child: Barrier(
                          barrierX: barrierXaxis[1],
                          BarrierWidth: barrierWidth,
                          BarrierHeight: barrierHeight[0][1],
                          isBottomBarrier: true,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXaxis[1], -1.1),
                        duration: const Duration(
                          milliseconds: 0,
                        ),
                        child: Barrier(
                          barrierX: barrierXaxis[1],
                          BarrierWidth: barrierWidth,
                          BarrierHeight: barrierHeight[1][1],
                          isBottomBarrier: false,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXaxis[2], 1.1),
                        duration: const Duration(
                          milliseconds: 0,
                        ),
                        child: Barrier(
                          barrierX: barrierXaxis[2],
                          BarrierWidth: barrierWidth,
                          BarrierHeight: barrierHeight[0][2],
                          isBottomBarrier: true,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXaxis[2], -1.1),
                        duration: const Duration(
                          milliseconds: 0,
                        ),
                        child: Barrier(
                          barrierX: barrierXaxis[2],
                          BarrierWidth: barrierWidth,
                          BarrierHeight: barrierHeight[1][2],
                          isBottomBarrier: false,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXaxis[3], 1.1),
                        duration: const Duration(
                          milliseconds: 0,
                        ),
                        child: Barrier(
                          barrierX: barrierXaxis[3],
                          BarrierWidth: barrierWidth,
                          BarrierHeight: barrierHeight[0][3],
                          isBottomBarrier: true,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXaxis[3], -1.1),
                        duration: const Duration(
                          milliseconds: 0,
                        ),
                        child: Barrier(
                          barrierX: barrierXaxis[3],
                          BarrierWidth: barrierWidth,
                          BarrierHeight: barrierHeight[1][3],
                          isBottomBarrier: false,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXaxis[4], 1.1),
                        duration: const Duration(
                          milliseconds: 0,
                        ),
                        child: Barrier(
                          barrierX: barrierXaxis[4],
                          BarrierWidth: barrierWidth,
                          BarrierHeight: barrierHeight[0][4],
                          isBottomBarrier: true,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXaxis[4], -1.1),
                        duration: const Duration(
                          milliseconds: 0,
                        ),
                        child: Barrier(
                          barrierX: barrierXaxis[4],
                          BarrierWidth: barrierWidth,
                          BarrierHeight: barrierHeight[1][4],
                          isBottomBarrier: false,
                        ),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.lightGreen,
                    height: 1,
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                      color: Colors.brown,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  'Score     ',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(score.toString(),
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 40,
                                    )),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  'Top Score',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  highScore.toString(),
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 40,
                                  ),
                                ),
                              ],
                            )
                          ])))
            ],
          ),
        ));
  }

  bool birdIsDead() {
    if (birdYaxis < -1.4 || birdYaxis > 1.4) {
      print("Border Touch");
      return true;
    }
    for (int i = 0; i < barrierXaxis.length; i++) {
      print(i);
      if (barrierXaxis[i] <= birdWidth) {
        print('D2');
        if (barrierXaxis[i] + barrierWidth >= -birdWidth) {
          print('D3');
          if (birdYaxis <= -2 + barrierHeight[0][i] ||
              birdYaxis + birdHeight >= 2 - barrierHeight[1][i]) {
            print(birdWidth);
            print(barrierXaxis);
            print(birdYaxis);
            print(birdHeight);
            print(barrierHeight[0][i]);
            print(barrierHeight[1][i]);
            print(i);
            return true;
          }
        }
      }
    }
    return false;
  }

  void startJumpGame() {
    startGame = true;
    score = 0;
    int counter = 0;
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      time += 0.05;
      height = ((-8.9) * time * time + (3 * time));
      counter += 1;
      setState(() {
        barrierXaxis[0] -= speed;
        barrierXaxis[1] -= speed;
        barrierXaxis[2] -= speed;
        barrierXaxis[3] -= speed;
        barrierXaxis[4] -= speed;
        birdYaxis = initialHeight - height;
        if (counter % 69 == 0) {
          score += 1;
          //print("Score +1");
        }
      });
      if (barrierXaxis[0] < -1.2) {
        setState(() {
          barrierXaxis[0] += 5;
        });
      }
      if (barrierXaxis[1] < -1.2) {
        setState(() {
          barrierXaxis[1] += 5;
        });
      }
      if (barrierXaxis[2] < -1.2) {
        setState(() {
          barrierXaxis[2] += 5;
        });
      }
      if (barrierXaxis[3] < -1.2) {
        setState(() {
          barrierXaxis[3] += 5;
        });
      }
      if (barrierXaxis[4] < -1.2) {
        setState(() {
          barrierXaxis[4] += 5;
        });
      }
      Timer.periodic(
          const Duration(
            seconds: 69,
          ), (speedup) {
        setState(() {
          speed += 0.0001;
        });
      });
      //print(birdYaxis);
      if (birdIsDead()) {
        _showDialog();
        print('Test 1');
        timer.cancel();
      }
    });
  }

  jump() {
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
    });
  }
}
