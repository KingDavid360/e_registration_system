import 'package:flutter/material.dart';
import 'package:e_registration_system/screen_detector.dart';

class CustomTextFieldDisplay extends StatelessWidget {
  final text;
  final label;
  const CustomTextFieldDisplay({Key? key, this.text, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: screenDetector.isMobile(context)
          ? MainAxisAlignment.start
          : screenDetector.isTablet(context)
              ? MainAxisAlignment.center
              : screenDetector.isDesktop(context)
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.center,
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: size.height * 0.03,
              color: Color(0xff034D29),
              fontWeight: FontWeight.bold),
        ),
        SizedBox(width: size.width * 0.02),
        Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.0095),
            child: Text(
              " ${text}",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: size.height * 0.025,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
