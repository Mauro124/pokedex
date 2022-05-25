import 'dart:async';

import 'package:flutter/material.dart';

class ArrowButtonWidget extends StatefulWidget {
  const ArrowButtonWidget({Key? key}) : super(key: key);

  @override
  State<ArrowButtonWidget> createState() => _ArrowButtonWidgetState();
}

class _ArrowButtonWidgetState extends State<ArrowButtonWidget> {
  final _animationDuration = const Duration(seconds: 1);
  late Timer _timer;
  late double _translate = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(_animationDuration, (timer) => _changePosition());
  }

  void _changePosition() {
    double newPosition = _translate == 0 ? -20 : 0;
    setState(() {
      _translate = newPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _animationDuration,
      curve: Curves.fastLinearToSlowEaseIn,
      transform: Transform.translate(
        offset: Offset(_translate, 0),
      ).transform,
      child: SizedBox(
        height: 50,
        width: 64,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              height: double.maxFinite,
              width: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).colorScheme.secondary.withAlpha(50),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Icon(Icons.arrow_forward_rounded, color: Colors.white),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
