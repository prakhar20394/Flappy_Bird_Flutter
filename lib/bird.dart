import 'package:flutter/material.dart';

class MyBird extends StatelessWidget {
  //double birdYaxis = 0;
  final double birdWidth = 0.5;
  final double birdHeight = 0.5;

  const MyBird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'imageDirectory/birdy.gif',
      width: MediaQuery.of(context).size.height * birdWidth / 4,
      height: MediaQuery.of(context).size.height * 3 / 4 * birdHeight / 2,
    );
  }
}
