import 'package:flutter/material.dart';
import 'package:tasky_app/theming/my_colors.dart';
import 'package:tasky_app/theming/my_fonts.dart';

class AgreementCheckBox extends StatefulWidget {
  const AgreementCheckBox({super.key, this.text1});

  final TextSpan? text1;

  @override
  State<AgreementCheckBox> createState() => _AgreementCheckBoxState();
}

class _AgreementCheckBoxState extends State<AgreementCheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: MyColors.splachBackground,
          activeColor: MyColors.whiteColor,
          value: isChecked,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          onChanged: (bool? newValue) {
            setState(() {
              isChecked = newValue!;
            });
          },
        ),
        RichText(text: widget.text1 ?? const TextSpan(text: '')),
        widget.text1 == null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Remember me",
                    style: MyFontStyle.font10Regular.copyWith(
                      color: MyColors.blackTextColor,
                    ),
                  ),
                  const SizedBox(width: 170),
                  Text(
                    "Forget password ?",
                    style: MyFontStyle.font10Regular.copyWith(
                      color: MyColors.splachBackground,
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
