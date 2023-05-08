import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  String selectedValue;
  CustomDropDown({Key? key, required this.selectedValue}) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
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
          SizedBox(height: 10),
          DropdownButtonFormField<String>(
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  widget.selectedValue = value;
                  print(widget.selectedValue);
                });
              }
            },
            items: const [
              DropdownMenuItem(
                value: 'male',
                child: Text('Male'),
              ),
              DropdownMenuItem(
                value: 'female',
                child: Text('Female'),
              ),
            ],
            decoration: const InputDecoration(
              labelText: 'Select your gender',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null) {
                return 'Please select a valid gender';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
