import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/quiz_controller.dart';


class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final QuizController quizController = Get.put(QuizController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
      ),
      body: Obx(() {
        return Column(
          children: [
            Text(quizController.question[quizController.questionIndex.value].questionText),
            ...quizController.question[quizController.questionIndex.value].options.map((option) {
              int optionIndex = quizController.question[quizController.questionIndex.value].options.indexOf(option);
              return ElevatedButton(
                onPressed: () {
                  quizController.nextQuestion(optionIndex);
                },
                child: Text(option),
              );
            }).toList(),
          ],
        );
      }),
    );
  }
}

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final QuizController quizController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Score"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your score is: ${quizController.score.value}"),
            ElevatedButton(
              onPressed: () {
                quizController.resetQuiz();
                Get.back();
              },
              child: Text("Restart Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
