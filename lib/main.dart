import 'package:flutter/material.dart';
import 'package:tasky_app/screens/splach_screen.dart';

void main() {
  runApp(const Tasky());
}

class Tasky extends StatelessWidget {
  const Tasky({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplachScreen());
  }
}
