import 'package:flutter/material.dart';

import '../configs/constants.dart';
import '../configs/routes.dart';
import '../utils/text_style.dart';
import '../widgets/strut_text.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController? _slideController1;
  AnimationController? _scaleController;
  CurvedAnimation? _curvedAnim;
  @override
  void initState() {
    _slideController1 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000), value: 0.5);
    _curvedAnim =
        CurvedAnimation(parent: _scaleController!, curve: Curves.bounceInOut);
    init();
    super.initState();
  }

  void init() async {
    await _slideController1!.forward();
    _scaleController!.forward();
    Future.delayed(const Duration(seconds: 2))
        .then((value) => Navigator.pushReplacementNamed(context, Routes.login));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: Container(
        child: Center(
          child: SlideTransition(
            position: _slideController1!
                .drive(Tween(begin: Offset(0.0, 10.0), end: Offset.zero)),
            child: ScaleTransition(
              scale: _curvedAnim!,
              child: Container(
                // color: Colors.white,
                width: MediaQuery.of(context).size.width * 0.4,
                child: StrutText(
                  "bookStore",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .bold
                      .white
                      .copyWith(fontSize: 30),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
