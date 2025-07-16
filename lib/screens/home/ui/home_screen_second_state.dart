import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_app/screens/home/ui/details_screen.dart';
import 'package:tasky_app/screens/home/widgets/choise_day.dart';
import 'package:tasky_app/screens/home/widgets/task_container_widget.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/widgets/custom_text_field.dart';

class HomeScreenBodySecondState extends StatelessWidget {
  const HomeScreenBodySecondState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormFeild(
          enabledBorderColor: MyColors.hintColor,
          focusedBorderColor: MyColors.hintColor,
          hint: "Search for your task...",
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset("assets/icons/search-normal.svg"),
          ),
        ),
        SizedBox(height: 43),
        ChoiseDayContainer(),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DetailsScreen()),
            );
          },
          child: TaskContainerWidget(),
        ),
      ],
    );
  }
}
