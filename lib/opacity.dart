import 'package:flutter/material.dart';

class opacity extends StatefulWidget {
  const opacity({super.key});

  @override
  State<opacity> createState() => _opacityState();
}

class _opacityState extends State<opacity> {
  double opacity = 1.0;
  void animatedopacity() {
    setState(() {
      opacity = opacity == 1.0 ? 0.3 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedOpacity(
          opacity: opacity,
          duration: Duration(microseconds: 600),
          child: Container(
            color: Colors.red,
            height: 100.0,
            width: 100.0,
            child: ElevatedButton(
              onPressed: () {
                animatedopacity();
              },
              child: Text("tap to fade"),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
            ),
          ),
        )
      ],
    );
  }
}
