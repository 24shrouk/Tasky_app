import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_app/constants/asset_constant.dart';
import 'package:tasky_app/core/utils/app_dialog.dart';
import 'package:tasky_app/firebase/firebase_database.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/screens/home/ui/bottom_sheet_screen.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';
import 'package:tasky_app/screens/home/widgets/choise_day.dart';
import 'package:tasky_app/screens/home/widgets/flag_widget.dart';
import 'package:tasky_app/screens/home/widgets/home_screen_body_frist_state.dart';
import 'package:tasky_app/screens/home/widgets/task_container_widget.dart';
import 'package:tasky_app/screens/home/widgets/timer_dialog_column.dart';
import 'package:tasky_app/widgets/custom_button_widget.dart';
import 'package:tasky_app/widgets/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  int priority = 1;
  DateTime selectedDate = DateTime.now();
  List<TaskModel> tasks = [];

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      appBar: AppBar(
        backgroundColor: MyColors.whiteColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: SvgPicture.asset(AssetConstant.appBarLogo),
        ),
        actionsPadding: EdgeInsets.only(right: 12),
        actions: [
          Row(
            spacing: 10,
            children: [
              SvgPicture.asset(AssetConstant.logoutIcon),
              Text(
                "Log out",
                style: MyFontStyle.font16Regular.copyWith(
                  color: MyColors.redColor,
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            CustomTextFormFeild(
              enabledBorderColor: MyColors.hintColor,
              focusedBorderColor: MyColors.hintColor,
              hint: "Search for your task...",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(AssetConstant.searchIcon),
              ),
            ),
            SizedBox(height: 43),
            ChoiseDayContainer(),
            tasks.isEmpty
                ? HomeScreenBodyFristState()
                : Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return TaskContainerWidget(taskModel: tasks[index]);
                      },
                      itemCount: tasks.length,
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: MyColors.whiteColor,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            context: context,
            builder: (context) {
              return BottomSheetScreen(
                priority: priority,
                onTapFlag: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return FlagWidget(
                        onPressed: (index) {
                          priority = index;
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                },
                onTapTimer: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        content: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 400,
                          child: TimerAlertDialogWidget(),
                        ),
                        actions: [
                          Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.deepPurple),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ),
                              Expanded(
                                child: CustomButton(
                                  onPressed: () {},
                                  raduis: 4,
                                  text: "Save",
                                  outSidePadding: EdgeInsetsGeometry.only(
                                    right: 4,
                                  ),
                                  inSidePadding: EdgeInsetsGeometry.symmetric(
                                    vertical: 8,
                                    horizontal: 40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
                onTapSend: () {
                  AppDialog.showLoading(context);
                  FireBaseDatabase.createTask(
                        title: taskController.text,
                        description: descriptionController.text,
                        periority: priority,
                        dateTime: DateTime.now(), //محتاجة تتغير
                      )
                      .then((value) async {
                        Navigator.pop(context);
                        taskController.clear();
                        descriptionController.clear();
                        priority = 1;
                        selectedDate = DateTime.now();
                        Navigator.pop(context);
                        await getTasks();
                      })
                      .catchError((error) {
                        AppDialog.showErrorDialog(context, "Error: $error");
                        Navigator.pop(context);
                        taskController.clear();
                        descriptionController.clear();
                        Navigator.pop(context);
                      });
                },
                taskController: taskController,
                descriptionController: descriptionController,
              );
            },
          );
        },
        backgroundColor: MyColors.floatActionButtonColor,
        foregroundColor: MyColors.splachBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(100),
        ),
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> getTasks() async {
    try {
      tasks = await FireBaseDatabase.getAllTask();
      log(tasks.toString());
      setState(() {});
    } catch (error) {
      AppDialog.showErrorDialog(context, "Error: $error");
    }
  }
}
