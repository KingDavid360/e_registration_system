import 'package:flutter/material.dart';

class CustomTextFieldDisplay extends StatelessWidget {
  final text;
  final label;
  const CustomTextFieldDisplay({Key? key, this.text, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: size.height * 0.028,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(width: size.width * 0.02),
        Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: 10.0, horizontal: size.width * 0.02),
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: size.height * 0.025,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
