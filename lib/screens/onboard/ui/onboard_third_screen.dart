import 'package:flutter/material.dart';
import 'package:tasky_app/screens/onboard/widgets/onboard_screen_column_widget.dart';

class OnboardThirdScreen extends StatelessWidget {
  const OnboardThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardScreenColumnWidget(
      index: 2,
      imagePath: 'assets/images/onboard_three.png',
      header: 'Orgonaize your tasks',
      title: """You can organize your daily tasks by
   adding your tasks into separate categories""",
    );
  }
}
