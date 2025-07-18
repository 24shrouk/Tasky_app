import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_app/constants/asset_constant.dart';
import 'package:tasky_app/core/utils/app_dialog.dart';
import 'package:tasky_app/firebase/firebase_database.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/screens/home/ui/home_screen.dart';
import 'package:tasky_app/screens/home/widgets/row_of_details_screen_widget.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';
import 'package:tasky_app/widgets/custom_text_field.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  TextEditingController taskTitle = TextEditingController();
  TextEditingController taskDescription = TextEditingController();
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    taskTitle.text = widget.taskModel.title;
    taskDescription.text = widget.taskModel.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      appBar: AppBar(
        backgroundColor: MyColors.whiteColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 233, 229, 229),
              borderRadius: BorderRadius.circular(4),
            ),
            child: SvgPicture.asset(AssetConstant.cancelIcon),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
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
                    fillColor: WidgetStatePropertyAll(
                      MyColors.splachBackground,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormFeild(
                          controller: taskTitle,
                          hintStyle: MyFontStyle.font16Regular.copyWith(
                            color: MyColors.floatActionButtonColor,
                          ),
                          enabledBorderColor: MyColors.whiteColor,
                          focusedBorderColor: MyColors.hintColor,
                        ),

                        const SizedBox(height: 4),
                        CustomTextFormFeild(
                          controller: taskDescription,

                          hintStyle: MyFontStyle.font14Regular.copyWith(
                            color: MyColors.greyTextColor,
                          ),
                          enabledBorderColor: MyColors.whiteColor,
                          focusedBorderColor: MyColors.hintColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 48),
                  InkWell(
                    onTap: () {
                      AppDialog.showLoading(context);
                      FireBaseDatabase.updateTask(
                            TaskModel(
                              id: widget.taskModel.id,
                              title: taskTitle.text,
                              dateTime: widget.taskModel.dateTime,
                              periority: widget.taskModel.periority,
                              description: taskDescription.text,
                            ),
                          )
                          .then((_) {
                            Navigator.pop(context);
                            Navigator.of(
                              context,
                            ).pushReplacementNamed(HomeScreen.routeName);
                          })
                          .catchError((error) {
                            AppDialog.showErrorDialog(context, error);
                            Navigator.pop(context);
                          });
                    },
                    child: SvgPicture.asset(AssetConstant.editIcon),
                  ),
                ],
              ),
              SizedBox(height: 34),
              RowOfDetailsScreenWidget(
                onTap: () {},
                image: AssetConstant.timerIcon,
                text1: 'Task Time :',
                text2: 'Today ',
              ),
              SizedBox(height: 27),
              RowOfDetailsScreenWidget(
                image: AssetConstant.tagIcon,
                text1: 'Task Category :',
                text2: 'University ',
              ),
              SizedBox(height: 27),
              RowOfDetailsScreenWidget(
                image: AssetConstant.flagIcon,
                text1: 'Task Priority :',
                text2: 'Default ',
              ),
              SizedBox(height: 95),
              InkWell(
                onTap: () {
                  AppDialog.showLoading(context);
                  FireBaseDatabase.deleteTask(widget.taskModel)
                      .then((_) {
                        Navigator.pop(context);
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(HomeScreen.routeName);
                      })
                      .catchError((error) {
                        AppDialog.showErrorDialog(context, error.toString());
                        Navigator.pop(context);
                      });
                },
                child: Row(
                  spacing: 11,
                  children: [
                    SvgPicture.asset(AssetConstant.trashIcon),
                    Text(
                      'Delete Task',
                      style: MyFontStyle.font16Regular.copyWith(
                        color: MyColors.redColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
