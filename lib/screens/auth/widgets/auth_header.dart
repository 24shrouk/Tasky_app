import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.image,
    required this.header1,
    required this.header2,
  });

  final String image;
  final String header1;
  final String header2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 35),
        SvgPicture.asset(image, width: 150, height: 100),
        const SizedBox(height: 20),
        Text(
          header1,
          textAlign: TextAlign.center,
          style: MyFontStyle.font32Bold.copyWith(
            color: MyColors.blackTextColor,
          ),
        ),
        Text(
          header2,
          textAlign: TextAlign.center,
          style: MyFontStyle.font10Regular.copyWith(
            color: MyColors.blackTextColor,
          ),
        ),
      ],
    );
  }
}
