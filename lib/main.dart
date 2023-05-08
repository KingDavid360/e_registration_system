import 'package:e_registration_system/screens/home.dart';
import 'package:e_registration_system/screens/mobile/confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
      // routes: {
      //   '/confirmation': (context) => ConfirmationScreen(),
      // },
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          // page: () => ConfirmationScreen(),
          page: () => HomeScreen(),
        ),
        GetPage(
          name: '/confirmation',
          page: () => ConfirmationScreen(),
        ),
      ],
    );
  }
}
