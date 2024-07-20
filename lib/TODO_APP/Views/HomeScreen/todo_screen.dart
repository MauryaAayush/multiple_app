import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        leading: Icon(Icons.menu,color: Colors.white,),
        actions: [
          Icon(Icons.calendar_today,color: Colors.white,),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
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
            SizedBox(height: 20),
            Row(
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
                        color: index == 2 ? Colors.blue : Colors.transparent,
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
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  buildTaskItem("8:00 AM", "Breakfast with Tim", Icons.check_circle),
                  buildTaskItem("11:30 AM", "Interview at NBC", Icons.check_circle),
                  buildTaskItem("14:00 PM", "Team meeting", Icons.people),
                  buildTaskItem("15:20 PM", "UI design challenge", Icons.design_services),
                  buildTaskItem("19:00 PM", "Family Lunch", Icons.restaurant),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.grey[900],
    );
  }

  Widget buildTaskItem(String time, String task, IconData icon) {
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
                time,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 5),
              Text(
                task,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(
            icon,
            color: Colors.teal,
          ),
        ],
      ),
    );
  }
}
