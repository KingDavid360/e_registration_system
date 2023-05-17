import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateField extends StatefulWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType? keyboardTpe;
  final Icon? icon;
  final String? validatorText;
  const CustomDateField(
      {Key? key,
      required this.hint,
      required this.textEditingController,
      this.keyboardTpe,
      this.icon,
      this.validatorText})
      : super(key: key);

  @override
  State<CustomDateField> createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends State<CustomDateField> {
  DateTime pickedDate = DateTime.now();
  final inputFormat = DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "*required",
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.grey),
        ),
        TextFormField(
          controller: widget.textEditingController,
          validator: (value) => (value == null || value.isEmpty) &&
                  (inputFormat.format(pickedDate) != value)
              ? "${widget.validatorText}"
              : null,
          decoration: InputDecoration(
            icon: widget.icon,
            labelText: widget.hint,
            labelStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff034D29)),
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
          onTap: () async {
            pickedDate = (await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2120)))!;
            if (pickedDate != null) {
              setState(() {
                widget.textEditingController.text =
                    DateFormat('yyyy-MM-dd').format(pickedDate!);
              });
            }
          },
        ),
      ],
    );
  }
}
