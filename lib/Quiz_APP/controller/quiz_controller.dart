import 'package:get/get.dart';
import 'package:multiple_app/Quiz_APP/model/quiz_model.dart';
import 'package:multiple_app/Quiz_APP/views/quiz_screen.dart';

import '../views/score_screen.dart';

class QuizController extends GetxController{
  var questionIndex = 0.obs;
  var score = 0.obs;

  List<Questions> question = getQuestions();

  void nextQuestion(int selectedIndex){
    if(selectedIndex == question[questionIndex.value].correctOptionIndex){
      score.value++;
    }

    if(questionIndex.value < question.length - 1){
        questionIndex.value++;
    }else{
      Get.to(const ScoreScreen());
    }
  }

  void resetQuiz(){
    questionIndex.value = 0;
    score.value = 0;

  }

}