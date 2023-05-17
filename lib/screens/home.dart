import 'package:e_registration_system/screens/tablet/tablet_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_registration_system/screen_detector.dart';

import 'desktop/desktop_home_screen.dart';
import 'mobile/mobile_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, body: MobileHomeScreen());
  }
}
