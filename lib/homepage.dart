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

  double birdYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = 0;
  bool startGame = false;
  static double barrierXaxis1 = 0.6;
  static double barrierXaxis2 = barrierXaxis1 + 1;
  static double barrierXaxis3 = barrierXaxis2 + 1;
  static double barrierXaxis4 = barrierXaxis3 + 1;
  static double barrierXaxis5 = barrierXaxis4 + 1;
  double speed = 0.02;

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
                        alignment: Alignment(0, birdYaxis),
                        child: MyBird(),
                      ),
                      Container(
                        alignment: const Alignment(0, -0.3),
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
                        alignment: Alignment(barrierXaxis1, 1.1),
                        duration: Duration(
                          milliseconds: 0,
                        ),
                        child: Barrier(
                          size: 150,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXaxis1, -1.1),
                        duration: Duration(
                          milliseconds: 0,
                        ),
                        child: Barrier(
                          size: 200,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXaxis2, 1.1),
                        duration: Duration(
                          milliseconds: 0,
                        ),
                        child: Barrier(
                          size: 20,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXaxis2, -1.1),
                        duration: Duration(
                          milliseconds: 0,
                        ),
                        child: Barrier(
                          size: 300,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXaxis3, 1.1),
                        duration: Duration(
                          milliseconds: 0,
                        ),
                        child: Barrier(
                          size: 200,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXaxis3, -1.1),
                        duration: Duration(
                          milliseconds: 0,
                        ),
                        child: Barrier(
                          size: 200,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXaxis4, 1.1),
                        duration: Duration(
                          milliseconds: 0,
                        ),
                        child: Barrier(
                          size: 110,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXaxis4, -1.1),
                        duration: Duration(
                          milliseconds: 0,
                        ),
                        child: Barrier(
                          size: 30,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXaxis5, 1.1),
                        duration: Duration(
                          milliseconds: 0,
                        ),
                        child: Barrier(
                          size: 250,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXaxis5, -1.1),
                        duration: Duration(
                          milliseconds: 0,
                        ),
                        child: Barrier(
                          size: 150,
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
                                Text(
                                  'Score: ',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text('0',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 20,
                                    )),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Best Score: ',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  '10',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            )
                          ])))
            ],
          ),
        ));
  }

  void startJumpGame() {
    startGame = true;
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      time += 0.05;
      height = ((-8.9) * time * time + (3 * time));
      setState(() {
        barrierXaxis1 -= speed;
        barrierXaxis2 -= speed;
        barrierXaxis3 -= speed;
        barrierXaxis4 -= speed;
        barrierXaxis5 -= speed;
        birdYaxis = initialHeight - height;
      });
      if (barrierXaxis1 < -1.2) {
        setState(() {
          barrierXaxis1 += 5;
        });
      }
      if (barrierXaxis2 < -1.2) {
        setState(() {
          barrierXaxis2 += 5;
        });
      }
      if (barrierXaxis3 < -1.2) {
        setState(() {
          barrierXaxis3 += 5;
        });
      }
      if (barrierXaxis4 < -1.2) {
        setState(() {
          barrierXaxis4 += 5;
        });
      }
      if (barrierXaxis5 < -1.2) {
        setState(() {
          barrierXaxis5 += 5;
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
      if (birdYaxis > 1.1) {
        timer.cancel();
        startGame = false;
        _showDialog();
      }
    });
  }

  bool birdIsDead() {
    if ((birdYaxis > 1) || (birdYaxis < -1)) {
      return true;
    } else {
      return false;
    }
  }
  void _showDialog(){
    showDialog(context: context, barrierDismissible: false, builder: (BuilderContext context))
  }
  jump() {
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
    });
  }
}

