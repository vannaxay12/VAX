import 'package:flutter/material.dart';

class balloon extends StatefulWidget {
  const balloon({super.key});

  @override
  State<balloon> createState() => _balloonState();
}

class _balloonState extends State<balloon> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationFU;
  late Animation<double> _animationGS;

  late double _VXHeight;
  late double _VXWidth;
  late double _VXbottomLT;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _VXHeight = MediaQuery.of(context).size.height / 2;
    _VXWidth = MediaQuery.of(context).size.height / 3;
    _VXbottomLT = MediaQuery.of(context).size.height - _VXHeight;

    _animationFU = Tween(begin: _VXbottomLT, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
    _animationGS = Tween(begin: 50.0, end: _VXWidth).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.75, curve: Curves.elasticInOut),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationFU,
        builder: (context, child) {
          return Container(
            child: child,
            margin: EdgeInsets.only(
              top: _animationFU.value,
              left: _animationGS.value * 0.25,
            ),
            width: _animationGS.value,
          );
        },
        child: GestureDetector(
          child: Image.asset(
            'assets/images/watanabe.jpg',
            height: _VXHeight,
            width: _VXWidth,
          ),
          onTap: () {
            if (_controller.isCompleted) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
        ));
  }
}
