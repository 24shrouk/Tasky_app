import 'package:flutter/material.dart';
import 'package:tasky_app/screens/onboard/widgets/onboard_screen_column_widget.dart';

class OnBoardFristScreen extends StatelessWidget {
  const OnBoardFristScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardScreenColumnWidget(
      index: 0,
      imagePath: 'assets/images/onboard_one.png',
      header: 'Manage your tasks',
      title: """You can easily manage all of your daily 
    tasks in DoMe for free""",
    );
  }
}
