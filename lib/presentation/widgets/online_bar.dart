import 'dart:async';
import 'package:flutter/material.dart';

class OnlineBarStatus extends StatefulWidget {
  const OnlineBarStatus({Key? key}) : super(key: key);

  @override
  State<OnlineBarStatus> createState() => _OnlineBarStatusState();
}
class _OnlineBarStatusState extends State<OnlineBarStatus> {
  bool visibility=false;

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2),() {
      setState((){
        visibility=true;
      });
    },);
    return  visibility ? Positioned(
      height: 24.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        color: const Color(0xFF00EE44),
        child: const Center(
          child: Text("ONLINE"),
        ),
      ),
    ) : Container();
  }
}



