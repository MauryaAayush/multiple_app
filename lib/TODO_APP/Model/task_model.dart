import 'package:flutter/cupertino.dart';

class Task {
  String time;
  String description;
  IconData icon;
  bool isDone;

  Task({required this.time, required this.description, required this.icon, this.isDone = false});
}
