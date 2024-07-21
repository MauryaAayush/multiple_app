import 'package:flutter/material.dart';

import 'Login_APP/views/login_page.dart';
import 'TODO_APP/Views/HomeScreen/todo_screen.dart';

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
      title: 'Flutter Demo',
      home: LoginPage()
    );
  }
}


