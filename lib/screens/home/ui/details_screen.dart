import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:tasky_app/constants/asset_constant.dart';
import 'package:tasky_app/core/app_ontap_functions.dart';
import 'package:tasky_app/core/utils/app_dialog.dart';
import 'package:tasky_app/firebase/firebase_database.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/screens/home/ui/home_screen.dart';
import 'package:tasky_app/screens/home/widgets/row_of_details_screen_widget.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';
import 'package:tasky_app/widgets/custom_text_field.dart';

class DetailsTaskScreen extends StatefulWidget {
  DetailsTaskScreen({super.key, required this.taskModel});
  TaskModel taskModel;

  @override
  State<DetailsTaskScreen> createState() => _DetailsTaskScreenState();
}

class _DetailsTaskScreenState extends State<DetailsTaskScreen> {
  TextEditingController taskTitle = TextEditingController();
  TextEditingController taskDescription = TextEditingController();
  late bool isSelected;
  DateTime selectedDate = DateTime.now();
  TaskModel? task;

  @override
  void initState() {
    super.initState();
    taskTitle.text = widget.taskModel.title;
    taskDescription.text = widget.taskModel.description;

    fetchTaskData();
    isSelected = widget.taskModel.isCompeleted;
  }

  Future<void> fetchTaskData() async {
    task = await FireBaseDatabase.getTask(widget.taskModel);
    setState(() {
      widget.taskModel = task!;
      isSelected = task!.isCompeleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat(
      'EEE dd-MM-yyyy',
    ).format(widget.taskModel.dateTime);
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 15),
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: MyColors.splachBackground,
                          width: 2,
                        ),
                      ),
                      child: isSelected
                          ? Center(
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: MyColors.splachBackground,

                                  shape: BoxShape.circle,
                                ),
                              ),
                            )
                          : null,
                    ),
                  ),

                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormFeild(
                          controller: taskTitle,
                          maxLines: null,
                          enabledBorderColor: MyColors.splachBackground,
                          focusedBorderColor: MyColors.splachBackground,
                        ),

                        const SizedBox(height: 10),
                        CustomTextFormFeild(
                          maxLines: null,
                          controller: taskDescription,
                          enabledBorderColor: MyColors.splachBackground,
                          focusedBorderColor: MyColors.splachBackground,
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
                              isCompeleted: isSelected,
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
                onTap: () {
                  AppFunctions.onTapTimer(context, (selectedDay) {
                    widget.taskModel.dateTime = selectedDay;
                  });
                  setState(() {});
                },
                image: AssetConstant.timerIcon,
                text1: 'Task Time :',
                text2: formattedDate,
              ),

              RowOfDetailsScreenWidget(
                onTap: () {
                  AppFunctions.onTapFlag(context, (selectedPriority) {
                    widget.taskModel.periority = selectedPriority;
                    setState(() {});
                  });
                },
                image: AssetConstant.flagIcon,
                text1: 'Task Priority :',
                text2: widget.taskModel.periority.toString(),
                flagImage: AssetConstant.flagIcon,
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
