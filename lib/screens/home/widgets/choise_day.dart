import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_app/theming/my_colors.dart';
import 'package:tasky_app/theming/my_fonts.dart';

class ChoiseDayContainer extends StatelessWidget {
  const ChoiseDayContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: MyColors.whiteColor,
        border: Border.all(color: MyColors.greyBorderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          Text(
            "Today",
            style: MyFontStyle.font12Regular.copyWith(
              color: MyColors.floatActionButtonColor,
            ),
          ),
          SvgPicture.asset("assets/icons/arrow-down.svg"),
        ],
      ),
    );
  }
}


// DropdownMenu(
//       trailingIcon: SvgPicture.asset("assets/icons/arrow-down.svg"),
//       dropdownMenuEntries: <DropdownMenuEntry<Color>>[
//         DropdownMenuEntry(
//           value: MyColors.floatActionButtonColor,
//           label: 'Today',
//         ),
//       ],
//     );