import 'package:flutter/material.dart';
import 'package:tasky_app/screens/home/ui/home_screen.dart';
import 'package:tasky_app/theming/my_colors.dart';
import 'package:tasky_app/theming/my_fonts.dart';
import 'package:tasky_app/screens/auth/widgets/agreement_check_box.dart';
import 'package:tasky_app/screens/auth/widgets/auth_header.dart';
import 'package:tasky_app/screens/auth/widgets/auth_redirect_text.dart';
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
              const CustomTextFormFeild(
                hint: "Full name",
                suffixIcon: Icon(
                  Icons.person_outlined,
                  color: Color.fromARGB(255, 177, 176, 176),
                ),
              ),
              const SizedBox(height: 10),
              const CustomTextFormFeild(
                hint: "Valid email",
                suffixIcon: Icon(
                  Icons.email_outlined,
                  color: Color.fromARGB(255, 177, 176, 176),
                ),
              ),
              const SizedBox(height: 10),
              const CustomTextFormFeild(
                hint: "Phone number",
                suffixIcon: Icon(
                  Icons.phone_android_outlined,
                  color: Color.fromARGB(255, 177, 176, 176),
                ),
              ),
              const SizedBox(height: 10),
              const CustomTextFormFeild(
                hint: "Strong password",
                suffixIcon: Icon(
                  Icons.visibility_off_outlined,
                  color: Color.fromARGB(255, 177, 176, 176),
                ),
              ),
              AgreementCheckBox(
                text1: TextSpan(
                  text: "By checking the box you agree to our",
                  style: MyFontStyle.font10Regular.copyWith(
                    color: MyColors.blackTextColor,
                  ),
                  children: [
                    TextSpan(
                      text: " Terms",
                      style: MyFontStyle.font10Regular.copyWith(
                        color: MyColors.splachBackground,
                      ),
                    ),
                    TextSpan(
                      text: " and",
                      style: MyFontStyle.font10Regular.copyWith(
                        color: MyColors.blackTextColor,
                      ),
                    ),
                    TextSpan(
                      text: " Conditions",
                      style: MyFontStyle.font10Regular.copyWith(
                        color: MyColors.splachBackground,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
              CustomButton(
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
              const SizedBox(height: 10),
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
