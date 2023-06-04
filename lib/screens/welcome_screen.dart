import 'package:flutter/material.dart';
import 'package:music_app/widgets/wel_widgets/wel_body.dart';
import 'package:music_app/widgets/wel_widgets/wel_circle_painter.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // back back cover
          Positioned.fill(
            child: Image.asset(
              'assets/images/cover4.jpg',
              colorBlendMode: BlendMode.colorBurn,
              fit: BoxFit.cover,
            ),
          ),
          // Middle yellow Circle
          Positioned(
            top: size.height * .4,
            left: -size.height * .2,
            height: size.height * .4,
            width: size.height * .4,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(10),
              child: ClipPath(
                clipper: WelCircleClipper(),
                child: Container(
                  color: Colors.yellow[700],
                  child: Image.asset('assets/images/people2.jpg',
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          // bottom yellow circl
          Positioned(
            bottom: -size.height * .06,
            right: -size.height * .06,
            height: size.height * .2,
            width: size.height * .2,
            child: ClipPath(
              clipper: WelCircleClipper(),
              child: Container(
                color: Colors.yellow[700],
                child:
                    Image.asset('assets/images/people1.jpg', fit: BoxFit.cover),
              ),
            ),
          ),
          // texts & signin button
          const WelBody(),
        ],
      ),
    );
  }
}
