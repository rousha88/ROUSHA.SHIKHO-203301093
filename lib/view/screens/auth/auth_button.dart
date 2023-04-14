import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/theme.dart';
import 'package:flutter_application_2/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const AuthButton({
    required this.text,
    required this.onPressed,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary:  mainColor ,
        minimumSize: const Size(360, 50),
      ),
      child: TextUtils(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          text: text,
          color: Colors.white,
          underLine: TextDecoration.none),
    );
  }
}
