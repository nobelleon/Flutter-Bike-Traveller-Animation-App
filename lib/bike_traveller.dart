import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';

import 'road_painter.dart';
import 'sticky_man_painter.dart';
import 'wheel_one_painter.dart';
import 'wheel_two_painter.dart';

class BikeTraveller extends StatefulWidget {
  const BikeTraveller({super.key});

  @override
  State<BikeTraveller> createState() => _BikeTravellerState();
}

class _BikeTravellerState extends State<BikeTraveller>
    with TickerProviderStateMixin {
  AnimationController? legOneController;
  AnimationController? legTwoController;
  AnimationController? wheelRotationController;
  AnimationController? wheelShakeController;
  AnimationController? manShakeController;

  Animation<double>? legOneAnimation;
  Animation<double>? legTwoAnimation;
  Animation<double>? wheelRotationAnimation;
  Animation<double>? wheelMoveAnimation;
  Animation<double>? manMoveAnimation;

  @override
  void initState() {
    legOneController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 280));
    legTwoController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 280));
    wheelRotationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400))
      ..repeat();
    manShakeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 280))
      ..repeat(reverse: true);
    wheelShakeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 280))
      ..repeat(reverse: true);

    legOneAnimation =
        Tween<double>(begin: 0.0, end: 20.0).animate(legOneController!);
    legTwoAnimation =
        Tween<double>(begin: 0.0, end: 20.0).animate(legTwoController!);
    wheelRotationAnimation = Tween<double>(begin: 0.0, end: math.pi * 2)
        .animate(wheelRotationController!);
    manMoveAnimation =
        Tween<double>(begin: 0.0, end: 10.0).animate(manShakeController!);
    wheelMoveAnimation =
        Tween<double>(begin: 0.0, end: 5.0).animate(wheelShakeController!);

    legOneController!.forward();

    legOneController!.addListener(() {
      if (legOneAnimation!.status == AnimationStatus.completed) {
        legOneController!.reverse();
      }
      if (legOneAnimation!.status == AnimationStatus.completed) {}
      setState(() {});
    });

    legTwoController!.forward();
    legTwoController!.addListener(() {
      if (legTwoAnimation!.status == AnimationStatus.completed) {
        legTwoController!.reverse();
      }
      setState(() {});
    });

    legOneController!.repeat(reverse: true);
    legTwoController!.repeat(reverse: true);
    //wheelController!.repeat();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Stack(
        children: [
          Transform.rotate(
            angle: -math.pi / 5.3,
            child: Transform.translate(
              offset: const Offset(-40, -90),
              child: Stack(
                children: [
                  Transform.scale(
                    scale: 0.75,
                    child: Stack(
                      children: [
                        CustomPaint(
                          size: Size.infinite,
                          painter: StickyManPainter(
                              legOneSpeed: legOneAnimation!.value,
                              legTwoSpeed: legTwoAnimation?.value ?? 0,
                              manMoveSpeed: manMoveAnimation?.value ?? 0),
                          child: Container(),
                        ),
                        CustomPaint(
                          size: Size.infinite,
                          painter: WheelOnePainter(
                              speed: wheelRotationAnimation!.value,
                              wheelMove: wheelMoveAnimation?.value ?? 0),
                          child: Container(),
                        ),
                        CustomPaint(
                          size: Size.infinite,
                          painter: WheelTwoPainter(
                              speed: wheelRotationAnimation!.value,
                              wheelShake: wheelMoveAnimation?.value ?? 0),
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                  CustomPaint(
                    size: Size.infinite,
                    painter: RoadPainter(),
                    child: Container(),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.6,
                    right: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "100",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.bold,
                              fontSize: 35),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          "METERS",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const Positioned(
            top: 170,
            left: 20,
            right: 20,
            child: Center(
                child: Text(
              'TRAVEL',
              style: TextStyle(
                  fontSize: 62, fontFamily: 'Essence', color: Colors.white70),
            )),
          ),
          Positioned(
              bottom: 45,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    cursorColor: Colors.white70,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        prefixIcon: const Icon(
                          CupertinoIcons.person,
                          color: Colors.white70,
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    cursorColor: Colors.white70,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        prefixIcon: const Icon(
                          CupertinoIcons.lock,
                          color: Colors.white70,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const InkWell(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 1,
                        height: 14,
                        color: Colors.white70,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const InkWell(
                        child: Text(
                          'SIGNUP',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
