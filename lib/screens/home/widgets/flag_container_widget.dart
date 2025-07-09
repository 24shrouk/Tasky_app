import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_app/theming/my_colors.dart';
import 'package:tasky_app/theming/my_fonts.dart';

class FlagContainer extends StatelessWidget {
  const FlagContainer({
    super.key,
    required this.isSelected,
    required this.number,
  });
  final bool isSelected;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isSelected == true
            ? MyColors.splachBackground
            : MyColors.whiteColor,
        border: Border.all(
          color: isSelected == true
              ? MyColors.splachBackground
              : MyColors.greyBorderColor,
        ),
      ),
      child: Column(
        children: [
          isSelected == true
              ? SvgPicture.asset(
                  "assets/icons/flag.svg",
                  color: MyColors.whiteColor,
                )
              : SvgPicture.asset("assets/icons/flag.svg"),
          Text(
            "$number",
            style: MyFontStyle.font16Regular.copyWith(
              color: isSelected == true
                  ? MyColors.whiteColor
                  : MyColors.floatActionButtonColor,
            ),
          ),
        ],
      ),
    );
  }
}
