import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_app/constants/asset_constant.dart';
import 'package:tasky_app/core/utils/app_dialog.dart';
import 'package:tasky_app/core/utils/app_shared_pref.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';
import 'package:tasky_app/firebase/firebase_database.dart';
import 'package:tasky_app/screens/auth/ui/login.dart';
import 'package:tasky_app/screens/user_profile/widgets/image_circle.dart';
import 'package:tasky_app/widgets/custom_button_widget.dart';
import 'package:tasky_app/widgets/custom_text_field.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});
  static const String profileRouteName = 'ProfileScreen';

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  bool isObscurePassword = true;

  User? user = FirebaseAuth.instance.currentUser;
  late String name;
  Future<String> getName() async {
    final snapshot = await FireBaseDatabase.collectionUser()
        .doc(user?.uid)
        .get();
    final userData = snapshot.data();
    name = userData?.name.toString() ?? "User";
    log(name);
    return name;
  }

  Future<void> loadUserData() async {
    name = await getName();
    userName.text =
        (user?.displayName.toString() == null ||
            user?.displayName?.isEmpty == true)
        ? name
        : user!.displayName.toString();
    email.text = user?.email ?? "Email Not found";
    log('null');
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Column(
                children: [
                  ImageCircleAvatar(userName: userName.text),
                  const SizedBox(height: 10),
                  Text(
                    userName.text,
                    style: MyFontStyle.font20Bold.copyWith(
                      color: MyColors.blackTextColor,
                    ),
                  ),
                  Text(
                    email.text,
                    style: MyFontStyle.font18Regular.copyWith(
                      color: MyColors.grayBigTextColor,
                    ),
                  ),
                  SizedBox(height: 40),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: MyColors.whiteColor,
                        border: Border.all(
                          color: MyColors.splachBackground,
                          width: 2.0,
                        ),
                      ),
                      child: Row(
                        spacing: 10,

                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.edit_outlined,
                            color: MyColors.splachBackground,
                          ),
                          Text(
                            "Edit Account",
                            style: MyFontStyle.font16Bold.copyWith(
                              color: MyColors.splachBackground,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 40),
                  CustomTextFormFeild(
                    prefixIcon: Icon(
                      Icons.person,
                      color: MyColors.splachBackground,
                    ),
                    controller: userName,
                    enabledBorderColor: MyColors.splachBackground,
                    focusedBorderColor: MyColors.splachBackground,
                  ),
                  SizedBox(height: 15),
                  CustomTextFormFeild(
                    prefixIcon: Icon(
                      Icons.email,
                      color: MyColors.splachBackground,
                    ),
                    controller: email,
                    enabledBorderColor: MyColors.splachBackground,
                    focusedBorderColor: MyColors.splachBackground,
                  ),
                  SizedBox(height: 15),
                  CustomTextFormFeild(
                    hint: "Enter New Password",
                    hintStyle: MyFontStyle.font16Regular.copyWith(
                      color: MyColors.hintColor,
                    ),
                    maxLines: 1,
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
                        color: MyColors.splachBackground,
                      ),
                    ),
                    controller: password,
                    enabledBorderColor: MyColors.splachBackground,
                    focusedBorderColor: MyColors.splachBackground,
                  ),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () async {
                      AppSharedPref.removeData(user!.uid);
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushReplacementNamed(
                        context,
                        LoginScreen.routeName,
                      );
                    },
                    child: Row(
                      spacing: 10,
                      children: [
                        SvgPicture.asset(
                          AssetConstant.logoutIcon,
                          color: MyColors.splachBackground,
                        ),
                        Text(
                          "Log out",
                          style: MyFontStyle.font16Regular.copyWith(
                            color: MyColors.splachBackground,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 40),
                  CustomButton(
                    onPressed: () {
                      AppDialog.showLoading;
                      editProfile()
                          .then((_) {
                            Navigator.pop(context);
                          })
                          .catchError((error) {
                            AppDialog.showErrorDialog(context, error);
                            Navigator.pop(context);
                          });
                      setState(() {});
                    },

                    text: "Save",
                    inSidePadding: EdgeInsetsGeometry.symmetric(
                      horizontal: 60,
                      vertical: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> editProfile() async {
    if (user == null) return;

    try {
      if (user?.displayName != userName.text.trim()) {
        await user?.updateDisplayName(userName.text.trim());
      }

      if (user?.email != email.text.trim() && email.text.trim().isNotEmpty) {
        await user?.updateEmail(email.text.trim());
      }

      if (password.text.trim().isNotEmpty) {
        await user?.updatePassword(password.text.trim());
      }

      await user?.reload();
    } catch (e) {
      print(e.toString());
    }
  }
}
