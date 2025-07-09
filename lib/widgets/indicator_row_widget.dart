import 'package:flutter/material.dart';
import 'package:tasky_app/widgets/indicator_widget.dart';

class IndicatorsRowWidget extends StatelessWidget {
  const IndicatorsRowWidget({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 3,
      children: [
        IndicatorWidget(isActive: index == 0),
        IndicatorWidget(isActive: index == 1),
        IndicatorWidget(isActive: index == 2),
      ],
    );
  }
}
