import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_app/screens/home/ui/bottom_sheet_screen.dart';
import 'package:tasky_app/theming/my_colors.dart';
import 'package:tasky_app/screens/home/widgets/home_screen_body_frist_state.dart';

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
      ),
      body: HomeScreenBodyFristState(),
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
