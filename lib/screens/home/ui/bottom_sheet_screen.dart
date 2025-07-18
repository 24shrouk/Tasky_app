import 'package:flutter/material.dart';
import 'package:tasky_app/screens/home/widgets/time_and_poriority_widget.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';
import 'package:tasky_app/widgets/custom_text_field.dart';
import 'package:tasky_app/screens/home/widgets/row_of_bottom_sheet_icons_widget.dart';

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({super.key});

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: FractionallySizedBox(
        heightFactor: 0.56,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Task",
                style: MyFontStyle.font20Bold.copyWith(
                  color: MyColors.grayBigTextColor,
                ),
              ),
              SizedBox(height: 12),
              CustomTextFormFeild(
                hint: "Do math homework",
                enabledBorderColor: MyColors.hintColor,
                focusedBorderColor: MyColors.hintColor,
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextFormFeild(
                      hint: "Description",
                      focusedBorderColor: MyColors.hintColor,
                    ),
                  ),
                  RowOfTimeAndPoriorityWidget(),
                ],
              ),

              RowOfBottomSheetIconsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
