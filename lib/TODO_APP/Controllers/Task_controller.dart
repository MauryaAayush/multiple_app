import 'package:get/get.dart';

import '../Model/task_model.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;

  void addTask(Task task) {
    tasks.add(task);
  }

  void updateTask(int index, Task task) {
    tasks[index] = task;
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
  }
}
