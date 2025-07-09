import 'package:flutter/material.dart';
import 'package:tasky_app/screens/auth/ui/login.dart';
import 'package:tasky_app/screens/auth/ui/sign_up.dart';
import 'package:tasky_app/screens/home/ui/home_screen.dart';
import 'package:tasky_app/screens/onboard/ui/onboard_frist_screen.dart';
import 'package:tasky_app/screens/onboard/ui/onboard_second_screen.dart';
import 'package:tasky_app/screens/onboard/ui/onboard_third_screen.dart';
import 'package:tasky_app/theming/my_colors.dart';
import 'package:tasky_app/widgets/custom_button_widget.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final PageController _controller = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                controller: _controller,
                children: [
                  OnBoardFristScreen(),
                  OnBoardSecondScreen(),
                  OnboardThirdScreen(),
                ],
              ),
            ),
            SizedBox(height: 80),
            CustomButton(
              alignment: Alignment.bottomRight,
              outSidePadding: const EdgeInsets.only(right: 24.0),
              inSidePadding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              onPressed: () {
                if (index == 2) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                } else {
                  _controller.animateToPage(
                    index + 1,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastEaseInToSlowEaseOut,
                  );
                }
              },
              text: index == 2 ? "Get Started" : "NEXT",
            ),
            SizedBox(height: 62),
          ],
        ),
      ),
    );
  }
}
