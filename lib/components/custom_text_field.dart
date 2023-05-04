import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType? keyboardTpe;
  final String? Function(String?)? validator;
  const CustomTextFormField(
      {Key? key,
      required this.hint,
      this.keyboardTpe,
      required this.textEditingController,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardTpe,
      controller: textEditingController,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        fillColor: Colors.white,
        focusedBorder: const OutlineInputBorder(
          // borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.blueAccent,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          // borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
