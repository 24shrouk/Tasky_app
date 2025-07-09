import 'package:flutter/material.dart';
import 'package:tasky_app/theming/my_colors.dart';
import 'package:tasky_app/widgets/onboard_screen_column_widget.dart';

class OnBoardSecondScreen extends StatelessWidget {
  const OnBoardSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: OnBoardScreenColumnWidget(
        index: 1,
        imagePath: 'assets/images/onboard_two.png',
        header: 'Create daily routine',
        title: """In Tasky  you can create your personalized 
  routine to stay productive""",
      ),
    );
  }
}
