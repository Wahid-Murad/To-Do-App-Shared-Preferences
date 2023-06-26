import 'package:add_to_do/screens/splash_screen.dart';
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
      title: 'Flutter Demo',
     theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
           seedColor: const Color.fromARGB(255, 0, 123, 236)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      transitionDuration: Duration.zero,
      home: SplashScreen(),
    );
  }
}
