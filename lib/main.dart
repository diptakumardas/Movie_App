import 'package:flutter/material.dart';
import 'package:movie_app/widget/splash_screen.dart';

import 'home_screen.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Nutflix',
      home: SplashScreen()
      //HomePage(),
    );
  }
}