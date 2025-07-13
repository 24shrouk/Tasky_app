import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_app/screens/auth/widgets/auth_redirect_text.dart';
import 'package:tasky_app/screens/home/ui/home_screen.dart';
import 'package:tasky_app/theming/my_colors.dart';
import 'package:tasky_app/screens/auth/widgets/auth_header.dart';
import 'package:tasky_app/theming/my_fonts.dart';
import 'package:tasky_app/widgets/custom_button_widget.dart';
import 'package:tasky_app/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AuthHeader(
                image: "assets/icons/appbar_logo.svg",
                header1: "Get Started",
                header2: "by creating a free account.",
              ),
              const SizedBox(height: 50),
              Text(
                "Email",
                style: MyFontStyle.font16Regular.copyWith(
                  color: MyColors.greyBorderColor,
                ),
              ),
              SizedBox(height: 5),
              const CustomTextFormFeild(
                hint: "Enter your Email",
                suffixIcon: Icon(
                  Icons.email_outlined,
                  color: Color.fromARGB(255, 177, 176, 176),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Password",
                style: MyFontStyle.font16Regular.copyWith(
                  color: MyColors.greyBorderColor,
                ),
              ),
              SizedBox(height: 5),
              CustomTextFormFeild(
                hint: "Password",
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.visibility_outlined,
                    color: Color(0xffBABABA),
                  ),
                ),
                // suffixIcon: SvgPicture.asset(
                //   width: 2,
                //   height: 2,
                //   'assets/icons/visibility_icon.svg',
                //   fit: BoxFit.contain,
                // ),
              ),
              const SizedBox(height: 10),
              Text(
                "Confirm Password",
                style: MyFontStyle.font16Regular.copyWith(
                  color: MyColors.greyBorderColor,
                ),
              ),
              SizedBox(height: 5),
              CustomTextFormFeild(
                hint: "Confirm Password",
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.visibility_outlined,
                    color: Color(0xffBABABA),
                  ),
                ),
              ),
              SizedBox(height: 41),
              CustomButton(
                width: double.infinity,
                inSidePadding: EdgeInsetsGeometry.symmetric(
                  vertical: 10,
                  horizontal: 30,
                ),
                text: 'Sign Up',

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
              const SizedBox(height: 90),
              Center(
                child: AuthRedirectText(
                  text1: "Already a member? ",
                  text2: "Log in",
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
