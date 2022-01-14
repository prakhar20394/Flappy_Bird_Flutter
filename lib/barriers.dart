import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  final BarrierWidth;
  final BarrierHeight;
  final barrierX;
  final size;
  final bool isBottomBarrier;

  Barrier(
      {Key? key,
      this.BarrierHeight,
      this.BarrierWidth,
      required this.isBottomBarrier,
      this.barrierX,
      this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment((2 * barrierX + BarrierWidth) / (2 - BarrierWidth),
            isBottomBarrier ? 1 : -1),
        child: Container(
            color: Colors.green,
            width: MediaQuery.of(context).size.width * BarrierWidth / 2,
            height: MediaQuery.of(context).size.height *
                3 /
                4 *
                BarrierHeight /
                2));
  }
}
