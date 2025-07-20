import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RowOfBottomSheetIconsWidget extends StatelessWidget {
  const RowOfBottomSheetIconsWidget({
    super.key,
    required this.onTapFlag,
    required this.onTapTimer,
    required this.onTapSend,
  });
  final void Function()? onTapFlag;
  final void Function()? onTapTimer;
  final void Function()? onTapSend;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onTapTimer,
          icon: SvgPicture.asset('assets/icons/timer.svg'),
          padding: EdgeInsets.zero,
        ),
        IconButton(
          onPressed: onTapFlag,
          icon: SvgPicture.asset('assets/icons/flag.svg'),
          padding: EdgeInsets.zero,
        ),
        Spacer(),
        IconButton(
          onPressed: onTapSend,
          icon: SvgPicture.asset('assets/icons/send.svg'),
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}




/// () {
          //   showDialog(
          //     context: context,
          //     builder: (BuildContext context) {
          //       return AlertDialog(
          //         backgroundColor: Colors.white,
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(16),
          //         ),
          //         content: SizedBox(
          //           width: MediaQuery.of(context).size.width * 0.8,
          //           height: 400,
          //           child: TimerAlertDialogWidget(),
          //         ),
          //       );
          //     },
          //   );
          // },

          // () {
          //  
          // },