import 'package:flutter/material.dart';
import 'package:projectchang02/Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'chang',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: Login());
  }
}
