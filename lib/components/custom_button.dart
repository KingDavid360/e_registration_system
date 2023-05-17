import 'package:flutter/material.dart';
import 'package:e_registration_system/screen_detector.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  const CustomButton({Key? key, required this.text, this.color, this.textColor})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: screenDetector.isMobile(context)
            ? size.width * 0.9
            : screenDetector.isTablet(context)
                ? size.width * 0.6
                : screenDetector.isDesktop(context)
                    ? size.width * 0.3
                    : size.width * 0.3,
        height: screenDetector.isMobile(context)
            ? size.height * 0.09
            : screenDetector.isTablet(context)
                ? size.height * 0.075
                : screenDetector.isDesktop(context)
                    ? size.height * 0.065
                    : size.height * 0.065,
        decoration: BoxDecoration(
          color: widget.color,
          // borderRadius: BorderRadius.circular(25), color: Color(0xff94F6B9)),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
                color: widget.textColor,
                fontWeight: FontWeight.bold,
                fontSize: screenDetector.isMobile(context)
                    ? size.width * 0.055
                    : screenDetector.isTablet(context)
                        ? size.width * 0.03
                        : screenDetector.isDesktop(context)
                            ? size.width * 0.03
                            : size.width * 0.03),
          ),
        ),
      ),
    );
  }
}
