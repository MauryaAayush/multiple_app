import 'package:flutter/material.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Todo App',style: TextStyle(
          color: Colors.black
        ),),
      ),

      body: Center(

        child : Text('Hello World')
      ),

    );
  }
}
