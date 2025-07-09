import 'package:flutter/material.dart';
import 'package:tasky_app/theming/my_colors.dart';
import 'package:tasky_app/theming/my_fonts.dart';
import 'package:tasky_app/screens/onboard/widgets/indicator_row_widget.dart';

class OnBoardScreenColumnWidget extends StatelessWidget {
  const OnBoardScreenColumnWidget({
    super.key,
    required this.imagePath,
    required this.header,
    required this.title,
    this.index,
  });
  final String imagePath;
  final String header;
  final String title;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Image.asset(imagePath),
        SizedBox(height: 27),
        IndicatorsRowWidget(index: index!),
        SizedBox(height: 50),
        Text(
          header,
          style: MyFontStyle.font32Bold.copyWith(
            color: MyColors.grayBigTextColor,
          ),
        ),
        SizedBox(height: 42),
        Text(
          title,
          textAlign: TextAlign.center,
          style: MyFontStyle.font16Regular.copyWith(
            color: MyColors.graySmallTextColor,
          ),
        ),
      ],
    );
  }
}
