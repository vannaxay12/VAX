import 'package:flutter/material.dart';
class container extends StatefulWidget {
  const container({super.key});

  @override
  State<container> createState() => _containerState();
}

class _containerState extends State<container> {
  double h=100.0;
  double w=100.0;
  void increaseW(){
    setState(() {
      w = w >=400.0 ? 100.0 : w += 50.0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(children: [AnimatedContainer(duration: Duration(milliseconds: 800),
    curve: Curves.easeInOut,
    color: Colors.green,
    height:h,
    width: w,
    child: ElevatedButton(onPressed: (){
      increaseW();
    },child: Text("Tap to\n grow width\n $w")),
    )
    ],
    );
  }
}