import 'package:flutter/material.dart';

class CustomCourseField extends StatelessWidget {
  final String course;
  CustomCourseField({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.085,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        border: Border.all(color: Color(0xff034D29), width: 3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            " Course: ",
            style: TextStyle(
                fontSize: size.height * 0.025, fontWeight: FontWeight.w600),
          ),
          Text(
            course,
            style: TextStyle(
                fontSize: size.height * 0.025, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
