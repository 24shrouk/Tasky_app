import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasky_app/core/utils/my_colors.dart';

class ImageCircleAvatar extends StatefulWidget {
  final String userName;

  const ImageCircleAvatar({super.key, required this.userName});

  @override
  State<ImageCircleAvatar> createState() => _ImageCircleAvatarState();
}

class _ImageCircleAvatarState extends State<ImageCircleAvatar> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String firstLetter = widget.userName.isNotEmpty
        ? widget.userName[0].toUpperCase()
        : "U";

    return Stack(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: MyColors.splachBackground,
          backgroundImage: _image != null ? FileImage(_image!) : null,
          child: _image == null
              ? Text(
                  firstLetter,
                  style: const TextStyle(fontSize: 50, color: Colors.white),
                )
              : null,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: _pickImage,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: MyColors.splachBackground, // لون البوردر
                  width: 0.8, // سمك البوردر
                ),
              ),
              padding: const EdgeInsets.all(4),
              child: const Icon(
                Icons.edit,
                size: 16,
                color: MyColors.splachBackground,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
