import 'package:flutter/material.dart';
import 'package:tasky_app/screens/auth/ui/sign_up.dart';
import 'package:tasky_app/screens/auth/widgets/agreement_check_box.dart';
import 'package:tasky_app/screens/auth/widgets/auth_header.dart';
import 'package:tasky_app/screens/auth/widgets/auth_redirect_text.dart';
import 'package:tasky_app/theming/my_colors.dart';
import 'package:tasky_app/theming/my_fonts.dart';
import 'package:tasky_app/widgets/custom_button_widget.dart';
import 'package:tasky_app/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                header1: "Welcome back",
                header2: "sign in to access your account",
              ),
              const SizedBox(height: 80),
              Text(
                "Email",
                style: MyFontStyle.font16Regular.copyWith(
                  color: MyColors.greyBorderColor,
                ),
              ),
              SizedBox(height: 5),
              const CustomTextFormFeild(
                hint: "Enter your email",
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
              const CustomTextFormFeild(
                hint: "Password",
                suffixIcon: Icon(
                  Icons.visibility_off_outlined,
                  color: Color.fromARGB(255, 177, 176, 176),
                ),
              ),

              const SizedBox(height: 71),
              CustomButton(
                width: double.infinity,
                inSidePadding: EdgeInsetsGeometry.symmetric(
                  vertical: 10,
                  horizontal: 30,
                ),
                text: 'Log in',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: 120),
              Center(
                child: AuthRedirectText(
                  text1: "New member ?",
                  text2: " Register now",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
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
