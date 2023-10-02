
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget{
  const CustomInput({
    Key? key,
    required this.hintText,
    required this.validator,
  }) : super(key: key);

  final String hintText;
  final Function(String?) validator;

  @override
  Widget build(BuildContext context){
    return SizedBox(
      // height: 50.0,
      // width: 300.0,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          contentPadding:
      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        ),
        validator: (value) => validator(value),
      ),
    );
  }
}
