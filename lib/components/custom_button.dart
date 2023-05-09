import 'package:flutter/material.dart';

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
    return Container(
      height: size.height * 0.09,
      width: size.width * 0.9,
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
              fontSize: size.width * 0.05),
        ),
      ),
    );
  }
}
