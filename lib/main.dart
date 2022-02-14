import 'package:chat_app_testing_project/screens/chat_screen.dart';
import 'package:chat_app_testing_project/screens/login_screen.dart';
import 'package:chat_app_testing_project/screens/registration_screen.dart';
import 'package:chat_app_testing_project/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      home: const ChatScreen(),
    );
  }
}
