import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_app/screens/home/widgets/timer_dialog_column.dart';

class RowOfBottomSheetIconsWidget extends StatelessWidget {
  const RowOfBottomSheetIconsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      content: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 400,
                        child: TimerAlertDialogWidget(),
                      ),
                    );
                  },
                );
              },
              icon: SvgPicture.asset('assets/icons/timer.svg'),
              padding: EdgeInsets.zero,
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/flag.svg'),
              padding: EdgeInsets.zero,
            ),
          ],
        ),

        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/send.svg'),
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
