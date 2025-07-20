import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_app/constants/asset_constant.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';

class TaskFilterDropdown extends StatefulWidget {
  final Function(String) onOptionSelected;
  final String selectedOption;

  const TaskFilterDropdown({
    super.key,
    required this.onOptionSelected,
    required this.selectedOption,
  });

  @override
  State<TaskFilterDropdown> createState() => _TaskFilterDropdownState();
}

class _TaskFilterDropdownState extends State<TaskFilterDropdown> {
  final List<String> options = [
    'Today',
    'Tomorrow',
    'This Weekend',
    'Next Week',
  ];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: MyColors.whiteColor,
          border: Border.all(color: MyColors.greyBorderColor),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            dropdownColor: MyColors.whiteColor,
            style: MyFontStyle.font14Regular.copyWith(
              color: MyColors.splachBackground,
            ),
            borderRadius: BorderRadius.circular(12),

            value: widget.selectedOption,
            icon: SvgPicture.asset(AssetConstant.arrowDownIcon),
            items: options.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                  style: MyFontStyle.font12Regular.copyWith(
                    color: MyColors.floatActionButtonColor,
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                widget.onOptionSelected(value);
              }
            },
          ),
        ),
      ),
    );
  }
}
