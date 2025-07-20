import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_app/constants/asset_constant.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';

class FlagContainer extends StatelessWidget {
  const FlagContainer({
    super.key,
    required this.isSelected,
    required this.number,
    this.onTap,
  });
  final bool isSelected;
  final int number;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                    colorFilter: ColorFilter.mode(
                      MyColors.whiteColor,
                      BlendMode.srcIn,
                    ),
                  )
                : SvgPicture.asset(AssetConstant.flagIcon),
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
      ),
    );
  }
}
