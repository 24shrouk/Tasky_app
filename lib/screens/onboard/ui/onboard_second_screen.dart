import 'package:flutter/material.dart';
import 'package:tasky_app/theming/my_colors.dart';
import 'package:tasky_app/screens/onboard/widgets/onboard_screen_column_widget.dart';

class OnBoardSecondScreen extends StatelessWidget {
  const OnBoardSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardScreenColumnWidget(
      index: 1,
      imagePath: 'assets/images/onboard_two.png',
      header: 'Create daily routine',
      title: """In Tasky  you can create your personalized 
  routine to stay productive""",
    );
  }
}
