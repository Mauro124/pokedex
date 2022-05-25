import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _whiteLines(0, 0, -300),
        _whiteLines(0, -300, 0),
        Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: const AssetImage("assets/images/sand_texture.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Theme.of(context).primaryColor.withAlpha(250),
              BlendMode.xor,
            ),
          )),
        ),
      ],
    );
  }

  SizedBox _whiteLines(double angle, double positionX, double positionY) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Transform.translate(
        offset: Offset(positionX, positionY),
        child: Transform.rotate(
          angle: angle,
          child: Opacity(
              opacity: 0.02,
              child: Image.asset(
                "assets/images/white_lines.png",
                fit: BoxFit.contain,
                centerSlice: const Rect.fromLTRB(0, 0, 0, 0),
              )),
        ),
      ),
    );
  }
}
