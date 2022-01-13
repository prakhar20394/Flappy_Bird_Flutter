import 'package:flutter/material.dart';

class MyBird extends StatelessWidget {
  const MyBird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('imageDirectory/birdy.gif'),
      width: 80,
      height: 80,
    );
  }
}
