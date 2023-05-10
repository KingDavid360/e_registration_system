import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hint;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardTpe;
  final String? validatorText;

  const CustomTextFormField({
    Key? key,
    this.hint,
    this.keyboardTpe,
    this.textEditingController,
    this.validatorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        SizedBox(height: size.height * 0.01),
        TextFormField(
          keyboardType: keyboardTpe,
          controller: textEditingController,
          validator: (validator) => validator == null || validator.isEmpty
              ? 'Enter a valid ${validatorText}'
              : null,
          decoration: InputDecoration(
            labelText: hint,
            labelStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff034D29)),
            fillColor: Colors.white,
            focusedBorder: const OutlineInputBorder(
              // borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Colors.blueAccent,
                width: 3.0,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              // borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Color(0xff034D29),
                width: 3.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
