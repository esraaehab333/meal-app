

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '6_meal/screens/tabs_Screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor:Color.fromRGBO(249, 181, 114,1),
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: TabsScreen(),
    );
  }
}
