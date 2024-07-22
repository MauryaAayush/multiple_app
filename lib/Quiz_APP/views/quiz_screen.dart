import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/quiz_controller.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QuizController quizController = Get.put(QuizController());

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
      leading: Icon(Icons.arrow_back_ios_rounded),
        title: Text('Daily Quiz',style: GoogleFonts.roboto(fontSize: 22,fontWeight: FontWeight.w500),),

        // title: Obx(() {
        //   return Text(
        //     "Quiz App - Score: ${quizController.score.value}/${quizController.question.length}",
        //   );
        // }),
        backgroundColor: Colors.white12 ,
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                height: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  quizController.question[quizController.questionIndex.value].questionText,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: quizController.question[quizController.questionIndex.value].options.length,
                  itemBuilder: (context, index) {
                    final option = quizController.question[quizController.questionIndex.value].options[index];
                    return Obx(() {
                      return GestureDetector(
                        onTap: () {
                          quizController.selectedOption.value = index;
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                          decoration: BoxDecoration(
                            color: quizController.selectedOption.value == index
                                ? Colors.teal.withOpacity(0.3)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "${String.fromCharCode(65 + index)}. ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: quizController.selectedOption.value == index
                                      ? Colors.black
                                      : Colors.black,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  option,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: quizController.selectedOption.value == index
                                        ? Colors.black
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Radio<int>(
                                value: index,
                                groupValue: quizController.selectedOption.value,
                                onChanged: (value) {
                                  quizController.selectedOption.value = value!;
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Background color
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  quizController.nextQuestion(quizController.selectedOption.value);
                },
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
