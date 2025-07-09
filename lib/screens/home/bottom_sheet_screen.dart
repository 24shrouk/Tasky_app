import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_app/theming/my_colors.dart';
import 'package:tasky_app/theming/my_fonts.dart';
import 'package:tasky_app/widgets/custom_text_field.dart';
import 'package:tasky_app/widgets/timer_dialog_column.dart';

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
              CustomTextFormFeild(hint: "Do math homework"),
              SizedBox(height: 12),
              Text(
                "Description",
                style: MyFontStyle.font18Regular.copyWith(
                  color: MyColors.graySmallTextColor,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                content: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width *
                                      0.8, // أو أي عرض مناسب
                                  height: 400, // ضروري تحددي ارتفاع
                                  child: TimerAlertDialogWidget(),
                                ),
                              );
                            },
                          );
                        },
                        icon: SvgPicture.asset('assets/icons/timer.svg'),
                        padding: EdgeInsets.zero,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/icons/flag.svg'),
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/icons/send.svg'),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
