import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../Controllers/Task_controller.dart';
import '../../Model/task_model.dart';

class HomePage extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today's",
                        style: GoogleFonts.roboto(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Schedule",
                        style: GoogleFonts.roboto(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Wednesday, October 23",
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(7, (index) {
                      List<String> weekDays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                      return Column(
                        children: [
                          Text(
                            weekDays[index],
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: index == 2 ? Colors.teal : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                "${21 + index}",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Obx(() {
                    return ListView.builder(
                      itemCount: taskController.tasks.length,
                      itemBuilder: (context, index) {
                        var task = taskController.tasks[index];
                        return GestureDetector(
                          onTap: () {
                            _showTaskDialog(context, task: task, index: index);
                          },
                          child: buildTaskItem(task, context, index),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, color: Colors.white),
                  Icon(Icons.calendar_today, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showTaskDialog(context);
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.grey[900],
    );
  }

  Widget buildTaskItem(Task task, BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.time,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 5),
              Text(
                task.description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Spacer(),
          PopupMenuButton<String>(
            onSelected: (String value) {
              if (value == 'Update') {
                _showTaskDialog(context, task: task, index: index);
              } else if (value == 'Delete') {
                taskController.deleteTask(index);
              } else if (value == 'Done') {
                taskController.markTaskAsDone(index);
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Update', 'Delete', 'Done'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(
                    choice,
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }).toList();
            },
          ),
          Icon(
            task.isDone ? Icons.done : task.icon,
            color: task.isDone ? Colors.green : Colors.teal,
          ),
        ],
      ),
    );
  }

  void _showTaskDialog(BuildContext context, {Task? task, int? index}) {
    final timeController = TextEditingController();
    final descriptionController = TextEditingController();
    final dateController = TextEditingController();

    if (task != null) {
      timeController.text = task.time;
      descriptionController.text = task.description;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[850],
          title: Text(
            task == null ? 'Add Task' : 'Edit Task',
            style: TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: dateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Date',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
                  }
                },
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              TextField(
                controller: timeController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Time',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    final now = DateTime.now();
                    final dt = DateTime(now.year, now.month, now.day, pickedTime.hour, pickedTime.minute);
                    timeController.text = "${pickedTime.format(context)}";
                  }
                },
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Task Description',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                if (task == null) {
                  taskController.addTask(Task(
                    time: timeController.text,
                    description: descriptionController.text,
                    icon: Icons.task,
                  ));
                } else {
                  taskController.updateTask(index!, Task(
                    time: timeController.text,
                    description: descriptionController.text,
                    icon: Icons.task,
                  ));
                }
                Navigator.of(context).pop();
              },
              child: Text(task == null ? 'Add' : 'Update', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
