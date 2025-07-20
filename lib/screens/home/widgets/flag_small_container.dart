import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';

class FlagSmallContainerWidget extends StatefulWidget {
  const FlagSmallContainerWidget({super.key, required this.priority});
  final int priority;
  @override
  State<FlagSmallContainerWidget> createState() =>
      _FlagSmallContainerWidgetState();
}

class _FlagSmallContainerWidgetState extends State<FlagSmallContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: MyColors.whiteColor,
        border: Border.all(color: MyColors.splachBackground),
      ),
      child: Row(
        spacing: 5,
        children: [
          SvgPicture.asset('assets/icons/flag.svg'),
          Text(
            widget.priority.toString(),
            style: MyFontStyle.font14Regular.copyWith(
              color: MyColors.blackTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
