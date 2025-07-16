import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/app_dialog.dart';
import 'package:tasky_app/core/validator_function.dart';
import 'package:tasky_app/firebase/login_and_register.dart';
import 'package:tasky_app/screens/auth/ui/sign_up.dart';
import 'package:tasky_app/screens/auth/widgets/auth_header.dart';
import 'package:tasky_app/screens/auth/widgets/auth_redirect_text.dart';
import 'package:tasky_app/screens/home/ui/home_screen.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';
import 'package:tasky_app/widgets/custom_button_widget.dart';
import 'package:tasky_app/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  bool isObscurePassword = true;

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
                CustomTextFormFeild(
                  validator: Validator.validateEmail,
                  controller: emailControler,
                  enabledBorderColor: MyColors.hintColor,
                  focusedBorderColor: MyColors.hintColor,
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
                CustomTextFormFeild(
                  controller: passwordControler,
                  enabledBorderColor: MyColors.hintColor,
                  focusedBorderColor: MyColors.hintColor,
                  validator: Validator.validatePassword,
                  hint: "Password",
                  obscurText: isObscurePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscurePassword = !isObscurePassword;
                      });
                    },
                    icon: Icon(
                      isObscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Color.fromARGB(255, 177, 176, 176),
                    ),
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
                  onPressed: () async {
                    AppDialog.showLoading();
                    if (formKey.currentState!.validate()) {
                      await FireBaseUser.loginFireBase(
                            emailControler.text,
                            passwordControler.text,
                          )
                          .then((text) {
                            Navigator.of(context).pop();
                            emailControler.clear();
                            passwordControler.clear();
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          })
                          .catchError((error) {
                            Navigator.of(context).pop();
                            AppDialog.showErrorDialog(context, error);
                          });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: AuthRedirectText(
        text1: "New member ?",
        text2: " Register now",
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignUpScreen()),
          );
        },
      ),
    );
  }
}
