import 'package:flutter/material.dart';
import 'package:web3_project/screens/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(

          primary: Colors.black,
          secondary: Colors.black,


        ),
      ),
      home: HomeScreen(),
    );
  }
}

