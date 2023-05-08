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
              fontSize: size.height * 0.03,
              color: Colors.black,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(width: size.width * 0.02),
        Container(
          width: size.height * 0.3,
          decoration:
              BoxDecoration(border: Border.all(width: 2.0, color: Colors.grey)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: 10.0, horizontal: size.width * 0.01),
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: size.height * 0.025,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
