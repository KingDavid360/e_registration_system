import 'package:flutter/material.dart';

class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
                height: size.height * 0.3,
                width: size.width * 0.9,
                "images/registered.png"),
            Text(
              'Registration complete',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: size.height * 0.03,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
