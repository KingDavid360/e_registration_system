import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class CustomEmailForm extends StatelessWidget {
  final String? hint;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardTpe;
  final String? validatorText;

  const CustomEmailForm(
      {Key? key,
      this.hint,
      this.textEditingController,
      this.keyboardTpe,
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
          validator: (email) => email != null && !EmailValidator.validate(email)
              ? 'Enter a valid email'
              : null,
          decoration: InputDecoration(
            hintText: hint,
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
