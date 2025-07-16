import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_app/screens/home/ui/bottom_sheet_screen.dart';
import 'package:tasky_app/screens/home/ui/home_screen_second_state.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      appBar: AppBar(
        backgroundColor: MyColors.whiteColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: SvgPicture.asset('assets/icons/appbar_logo.svg'),
        ),
        actionsPadding: EdgeInsets.only(right: 12),
        actions: [
          Row(
            spacing: 10,
            children: [
              SvgPicture.asset('assets/icons/logout_icon.svg'),
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
        child: HomeScreenBodySecondState(),
      ), //HomeScreenBodyFristState(),
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
              return BottomSheetScreen();
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
}
