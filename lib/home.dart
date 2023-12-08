import 'package:chapter7_Vannaxay_sangpachan_2cw3animationcontroller/container.dart';
import 'package:chapter7_Vannaxay_sangpachan_2cw3animationcontroller/crossfade.dart';
import 'package:chapter7_Vannaxay_sangpachan_2cw3animationcontroller/opacity.dart';
import 'package:flutter/material.dart';
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Home")),
      ),
      body: SafeArea(
        child: Column(
        children: [
          container(), Divider(),crossfade(),opacity(),
        ],
      )),
    );
  }
}