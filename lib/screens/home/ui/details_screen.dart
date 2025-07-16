import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_app/screens/home/widgets/row_of_details_screen_widget.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      appBar: AppBar(
        backgroundColor: MyColors.whiteColor,
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 233, 229, 229),
            borderRadius: BorderRadius.circular(4),
          ),
          child: SvgPicture.asset("assets/icons/cancel.svg"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Radio<bool>(
                  value: true,
                  groupValue: isSelected,
                  activeColor: MyColors.floatActionButtonColor,
                  onChanged: (value) {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                  fillColor: WidgetStatePropertyAll(MyColors.splachBackground),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Do Math Homework",
                        style: MyFontStyle.font16Regular.copyWith(
                          color: MyColors.floatActionButtonColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Today At 16:45",
                        style: MyFontStyle.font14Regular.copyWith(
                          color: MyColors.greyTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 48),
                SvgPicture.asset("assets/icons/edit_icon.svg"),
              ],
            ),
            SizedBox(height: 34),
            RowOfDetailsScreenWidget(
              image: 'assets/icons/timer.svg',
              text1: 'Task Time :',
              text2: 'Today ',
            ),
            SizedBox(height: 27),
            RowOfDetailsScreenWidget(
              image: 'assets/icons/tag.svg',
              text1: 'Task Category :',
              text2: 'University ',
              imageIcon: 'assets/icons/university_icon.svg',
            ),
            SizedBox(height: 27),
            RowOfDetailsScreenWidget(
              image: 'assets/icons/flag.svg',
              text1: 'Task Priority :',
              text2: 'Default ',
            ),
            SizedBox(height: 95),
            Row(
              spacing: 11,
              children: [
                SvgPicture.asset('assets/icons/trash.svg'),
                Text(
                  'Delete Task',
                  style: MyFontStyle.font16Regular.copyWith(
                    color: MyColors.redColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
