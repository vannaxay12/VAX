import 'package:flutter/material.dart';
class crossfade extends StatefulWidget {
  const crossfade({super.key});

  @override
  State<crossfade> createState() => _crossfadeState();
}

class _crossfadeState extends State<crossfade> {
  bool crossfadeMMX = true;
  void crossfade(){
    setState(() {
      crossfadeMMX=crossfadeMMX?false:true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Stack(
        alignment: Alignment.center,
        children: [
          AnimatedCrossFade(firstChild:Container(
            color: Colors.amber,
            height: 100.0,
            width: 100.0,
          ), secondChild: Container(
            color: Colors.blue,
            height: 200.0,
            width: 200.0,
          ), crossFadeState: crossfadeMMX?CrossFadeState.showFirst:CrossFadeState.showSecond , duration:Duration(microseconds: 700),
          sizeCurve: Curves.bounceOut,
         ),
         Positioned.fill(child: ElevatedButton(onPressed: (){crossfade();
         },
         child: Text("tap to \nfade color & size"),style: ElevatedButton.styleFrom(primary:crossfadeMMX?Colors.green: Colors.yellow), 
         ))
        ],
      )],
    );
  }
}