import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/app_dialog.dart';
import 'package:tasky_app/core/validator_function.dart';
import 'package:tasky_app/firebase/login_and_register.dart';
import 'package:tasky_app/screens/auth/widgets/auth_redirect_text.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/screens/auth/widgets/auth_header.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';
import 'package:tasky_app/widgets/custom_button_widget.dart';
import 'package:tasky_app/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool isObsecurPassword = true;
  bool isObscureConfirmPassword = true;
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  TextEditingController confirmPasswordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
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
                CustomTextFormFeild(
                  controller: emailControler,
                  validator: Validator.validateEmail,
                  enabledBorderColor: MyColors.hintColor,
                  focusedBorderColor: MyColors.hintColor,
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
                  controller: passwordControler,
                  validator: Validator.validatePassword,
                  enabledBorderColor: MyColors.hintColor,
                  focusedBorderColor: MyColors.hintColor,
                  hint: "Password",
                  obscurText: isObsecurPassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObsecurPassword = !isObsecurPassword;
                      });
                    },
                    icon: Icon(
                      isObsecurPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Color(0xffBABABA),
                    ),
                  ),
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
                  controller: confirmPasswordControler,
                  enabledBorderColor: MyColors.hintColor,
                  focusedBorderColor: MyColors.hintColor,
                  validator: (text) {
                    return Validator.validateConfirmPassword(
                      text,
                      confirmPasswordControler.text,
                    );
                  },
                  hint: "Confirm Password",
                  obscurText: isObscureConfirmPassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscureConfirmPassword = !isObscureConfirmPassword;
                      });
                    },
                    icon: Icon(
                      isObscureConfirmPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
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
                  onPressed: () async {
                    AppDialog.showLoading();
                    if (formKey.currentState!.validate()) {
                      FireBaseUser.registerFireBase(
                            emailControler.text,
                            passwordControler.text,
                          )
                          .then((_) {
                            Navigator.of(context).pop();
                            emailControler.clear();
                            passwordControler.clear();
                            confirmPasswordControler.clear();
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          })
                          .catchError((error) {
                            Navigator.of(context).pop();
                            AppDialog.showErrorDialog(
                              context,
                              error.toString(),
                            );
                          });
                    }
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
      ),
    );
  }
}
