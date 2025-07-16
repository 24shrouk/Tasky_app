import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';

class HomeScreenBodyFristState extends StatelessWidget {
  const HomeScreenBodyFristState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          SizedBox(height: 40),
          Image.asset('assets/images/home_image.png'),
          SizedBox(height: 15),
          Text(
            'What do you want to do today?',
            style: MyFontStyle.font20Regular.copyWith(
              color: MyColors.grayBigTextColor,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Tap + to add your tasks',
            textAlign: TextAlign.center,
            style: MyFontStyle.font16Regular.copyWith(
              color: MyColors.graySmallTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
