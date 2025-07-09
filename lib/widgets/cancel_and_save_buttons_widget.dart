import 'package:flutter/material.dart';
import 'package:tasky_app/widgets/custom_button_widget.dart';

class CancelAndSaveButtonsWidget extends StatelessWidget {
  const CancelAndSaveButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            child: Text("Cancel", style: TextStyle(color: Colors.deepPurple)),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        Expanded(
          child: CustomButton(
            onPressed: () {},
            raduis: 4,
            text: "Save",
            outSidePadding: EdgeInsetsGeometry.only(right: 4),
            inSidePadding: EdgeInsetsGeometry.symmetric(
              vertical: 8,
              horizontal: 40,
            ),
          ),
        ),
      ],
    );
  }
}
