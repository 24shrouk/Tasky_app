import 'package:flutter/material.dart';
import 'package:tasky_app/theming/my_colors.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: 27,
      height: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(56),
        color: isActive ? MyColors.splachBackground : MyColors.indicatorColor,
      ),
    );
  }
}
