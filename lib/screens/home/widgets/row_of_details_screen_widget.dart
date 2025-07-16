import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';

class RowOfDetailsScreenWidget extends StatelessWidget {
  const RowOfDetailsScreenWidget({
    super.key,
    required this.image,
    required this.text1,
    required this.text2,
    this.imageIcon,
  });
  final String image;
  final String? imageIcon;
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 10,
            children: [
              SvgPicture.asset(image),
              Text(
                text1,
                style: MyFontStyle.font16Regular.copyWith(
                  color: MyColors.floatActionButtonColor,
                ),
              ),
            ],
          ),

          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 233, 229, 229),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              spacing: 6,
              children: [
                imageIcon == null ? SizedBox() : SvgPicture.asset(imageIcon!),
                Text(
                  text2,
                  style: MyFontStyle.font12Regular.copyWith(
                    color: MyColors.floatActionButtonColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
