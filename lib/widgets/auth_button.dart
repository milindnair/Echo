import 'package:flutter/material.dart';
import 'package:echo/widgets/Auth_Button.dart';

class AuthButton extends StatelessWidget{
  const AuthButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFA78295)),
        foregroundColor: MaterialStateProperty.all<Color>(const Color(0xFF331D2C)),
        fixedSize: MaterialStateProperty.all<Size>(const Size(220, 50)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}