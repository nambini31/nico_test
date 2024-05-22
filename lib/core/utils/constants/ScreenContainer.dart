import 'package:flutter/material.dart';

import 'circle_blur.dart';

class ScreenContainer extends StatelessWidget {
  final Widget child;
  final Alignment? alignment;
  const ScreenContainer({super.key, required this.child, this.alignment});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  color: Color(0xff000000),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: CustomPaint(
                      foregroundPainter: CircleBlurPainter(
                        circleWidth: 30,
                        blurSigma: 150.0,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 160,
                    height: 160,
                    child: CustomPaint(
                      foregroundPainter: CircleBlurPainter(
                        circleWidth: 30,
                        blurSigma: 150.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: alignment ?? Alignment.center,
            child: child,
          ),
        ],
      ),
    );
  }
}
