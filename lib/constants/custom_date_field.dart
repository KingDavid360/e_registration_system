import 'package:e_registration_system/constants/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateField extends StatefulWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType? keyboardTpe;
  final String? Function(String?)? validator;
  final Icon? icon;
  const CustomDateField(
      {Key? key,
      required this.hint,
      required this.textEditingController,
      this.keyboardTpe,
      this.validator,
      this.icon})
      : super(key: key);

  @override
  State<CustomDateField> createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends State<CustomDateField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      decoration: InputDecoration(
        icon: widget.icon,
        labelText: widget.hint,
        border: const OutlineInputBorder(
          // borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Color(0xff94F6B9),
          ),
        ),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2120));
        if (pickedDate != null) {
          setState(() {
            widget.textEditingController.text =
                DateFormat('yyyy-MM-dd').format(pickedDate);
          });
        }
      },
    );
  }
}
