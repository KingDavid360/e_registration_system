import 'package:flutter/material.dart';

class CustomCourseField extends StatelessWidget {
  final String course;
  CustomCourseField({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.065,
      width: size.height * 0.9,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        border: Border.all(color: Color(0xff034D29), width: 3),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
        child: Text(
          "Course: ${course}",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
