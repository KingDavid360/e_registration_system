import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType? keyboardTpe;
  final String? validatorText;
  const CustomTextFormField(
      {Key? key,
      required this.hint,
      this.keyboardTpe,
      required this.textEditingController,
      this.validatorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "*required",
          style: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.grey),
        ),
        TextFormField(
          keyboardType: keyboardTpe,
          controller: textEditingController,
          validator: (validator) => validator == null || validator.isEmpty
              ? 'Enter a valid${validatorText}'
              : null,
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
        ),
      ],
    );
  }
}
