import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.onPressed, this.color,})
      : super(key: key);
  final VoidCallback onPressed;
  Color?color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed:onPressed,
        icon: Icon(
          Icons.delete_sharp,
          color:color,
        ),
    );
  }
}
