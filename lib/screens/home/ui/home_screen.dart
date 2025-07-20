import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_app/constants/asset_constant.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';
import 'package:tasky_app/firebase/firebase_database.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/screens/home/widgets/choise_day.dart';
import 'package:tasky_app/screens/home/widgets/home_screen_body_frist_state.dart';
import 'package:tasky_app/screens/home/widgets/task_container_widget.dart';
import 'package:tasky_app/screens/user_profile/views/user_profile.dart';
import 'package:tasky_app/widgets/custom_text_field.dart';
import 'package:tasky_app/screens/home/widgets/task_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  late TaskModel taskModel;

  int priority = 1;
  DateTime selectedDate = DateTime.now();
  List<TaskModel> tasks = [];
  String selectedLabel = 'Today';
  bool isSelected = false;
  List<TaskModel> filteredTasks = [];
  List<TaskModel> compeletedTasks = [];
  List<TaskModel> searchList = [];

  @override
  void initState() {
    super.initState();
    taskModel = TaskModel(
      id: FirebaseAuth.instance.currentUser?.uid ?? '',
      title: taskController.text,
      description: descriptionController.text,
      dateTime: selectedDate,
      isCompeleted: isSelected,
      periority: priority,
    );
    _fetchTasks();
  }

  Future<void> _fetchTasks() async {
    final result = await TaskFunctions.getTasksFiltered(
      selectedLabel: selectedLabel,
      now: DateTime.now(),
      context: context,
    );
    setState(() {
      tasks = result['tasks']!;
      filteredTasks = result['filteredTasks']!;
      compeletedTasks = result['completedTasks']!;
    });
  }

  void _handleSearch(String value) async {
    final results = await TaskFunctions.charactersSearch(value);
    setState(() {
      searchList = results;
    });
  }

  void _handleFilter(String newOption) {
    TaskFunctions.updateFilter(
      newOption: newOption,
      now: DateTime.now(),
      tasks: tasks,
      updateFilteredTasks: (updated) => setState(() => filteredTasks = updated),
      updateSelectedLabel: (label) => setState(() => selectedLabel = label),
    );
  }

  // void _handleAddTask() {
  //   TaskFunctions.showAddTaskBottomSheet(
  //     context: context,
  //     priority: priority,
  //     isSelected: isSelected,
  //     taskController: taskController,
  //     descriptionController: descriptionController,
  //     selectedDate: selectedDate,
  //     updatePriority: (val) => setState(() {
  //       priority = val;
  //       taskModel.periority = val;
  //     }),
  //     updateSelectedDate: (val) => setState(() {
  //       selectedDate = val;
  //       taskModel.dateTime = val;
  //     }),

  //     getTasks: _fetchTasks,
  //   );
  // }
  void _handleAddTask() {
    TaskFunctions.showAddTaskBottomSheet(
      taskModel: taskModel,
      context: context,
      taskController: taskController,
      descriptionController: descriptionController,
      updatePriority: (val) {
        setState(() {
          priority = val;
          taskModel.periority = val;
        });
      },
      updateSelectedDate: (val) {
        setState(() {
          selectedDate = val;
          taskModel.dateTime = val;
        });
      },
      getTasks: _fetchTasks,
    );
  }

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.whiteColor,
      appBar: AppBar(
        backgroundColor: MyColors.whiteColor,
        surfaceTintColor: MyColors.whiteColor,

        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: SvgPicture.asset(AssetConstant.appBarLogo),
        ),
        actionsPadding: EdgeInsets.only(right: 12),
        actions: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, UserProfile.profileRouteName),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: MyColors.splachBackground,
              ),
              child: Icon(Icons.person, color: MyColors.whiteColor),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 43),
              CustomTextFormFeild(
                controller: searchController,
                enabledBorderColor: MyColors.hintColor,
                focusedBorderColor: MyColors.hintColor,
                onChanged: _handleSearch,
                hint: "Search for your task...",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(AssetConstant.searchIcon),
                ),
              ),
              const SizedBox(height: 16),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: searchController.text.isNotEmpty
                    ? _buildSearchList()
                    : _buildFilteredTasks(now),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _handleAddTask,
        backgroundColor: MyColors.floatActionButtonColor,
        foregroundColor: MyColors.splachBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildSearchList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      key: ValueKey("searchList"),
      itemCount: searchList.length,
      itemBuilder: (context, index) {
        return TaskContainerWidget(
          taskModel: searchList[index],
          onTap: () {
            setState(() {
              final updatedTask = filteredTasks[index].updateIsComplete(
                isCompleted: !filteredTasks[index].isCompeleted,
              );
              FireBaseDatabase.updateTask(updatedTask);
              filteredTasks[index] = updatedTask;
              compeletedTasks = filteredTasks
                  .where((task) => task.isCompeleted)
                  .toList();
            });
          },
        );
      },
    );
  }

  Widget _buildFilteredTasks(DateTime now) {
    return Column(
      key: ValueKey("filteredTasks"),
      children: [
        TaskFilterDropdown(
          selectedOption: selectedLabel,
          onOptionSelected: _handleFilter,
        ),
        SizedBox(height: 16),
        filteredTasks.isEmpty
            ? HomeScreenBodyFristState()
            : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: filteredTasks.length,
                itemBuilder: (context, index) {
                  return TaskContainerWidget(
                    taskModel: filteredTasks[index],
                    onTap: () {
                      setState(() {
                        final updatedTask = filteredTasks[index]
                            .updateIsComplete(
                              isCompleted: !filteredTasks[index].isCompeleted,
                            );
                        FireBaseDatabase.updateTask(updatedTask);
                        filteredTasks[index] = updatedTask;

                        compeletedTasks = filteredTasks
                            .where((task) => task.isCompeleted)
                            .toList();
                      });
                    },
                  );
                },
              ),
        if (compeletedTasks.isNotEmpty)
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 20, bottom: 10),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: MyColors.whiteColor,
                border: Border.all(color: MyColors.greyBorderColor),
              ),
              child: Text(
                "Completed",
                style: MyFontStyle.font12Regular.copyWith(
                  color: MyColors.floatActionButtonColor,
                ),
              ),
            ),
          ),
        if (compeletedTasks.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: compeletedTasks.length,
            itemBuilder: (context, index) {
              return TaskContainerWidget(
                taskModel: compeletedTasks[index],
                onTap: () {
                  setState(() {
                    final updatedTask = filteredTasks[index].updateIsComplete(
                      isCompleted: !filteredTasks[index].isCompeleted,
                    );
                    filteredTasks[index] = updatedTask;
                    FireBaseDatabase.updateTask(updatedTask);
                    compeletedTasks = filteredTasks
                        .where((task) => task.isCompeleted)
                        .toList();
                  });
                },
              );
            },
          ),
      ],
    );
  }
}
