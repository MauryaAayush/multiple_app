class Questions {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;

  Questions({required this.questionText, required this.options, required this.correctOptionIndex});

}

List<Questions> getQuestions(){

  return [
    Questions(
      questionText: "What is the capital of India?",
      options: ["Mumbai", "New Delhi", "Kolkata", "Chennai"],
      correctOptionIndex: 1,
    ),
    Questions(
      questionText: "Who was the first Prime Minister of India?",
      options: ["Mahatma Gandhi", "Jawaharlal Nehru", "Indira Gandhi", "Rajendra Prasad"],
      correctOptionIndex: 1,
    ),
    Questions(
      questionText: "Which Indian city is known as the 'Silicon Valley of India'?",
      options: ["Hyderabad", "Pune", "Bangalore", "Chennai"],
      correctOptionIndex: 2,
    ),
    Questions(
      questionText: "Which river is the longest river in India?",
      options: ["Ganges", "Godavari", "Yamuna", "Narmada"],
      correctOptionIndex: 0,
    ),
    Questions(
      questionText: "In which year did India gain independence from British rule?",
      options: ["1945", "1947", "1950", "1952"],
      correctOptionIndex: 1,
    ),
    Questions(
      questionText: "Which Indian state is known as the 'Land of Five Rivers'?",
      options: ["Rajasthan", "Punjab", "Haryana", "Gujarat"],
      correctOptionIndex: 1,
    ),
    Questions(
      questionText: "Who is known as the 'Iron Man of India'?",
      options: ["Mahatma Gandhi", "Sardar Vallabhbhai Patel", "Subhas Chandra Bose", "Lal Bahadur Shastri"],
      correctOptionIndex: 1,
    ),
    Questions(
      questionText: "What is the national animal of India?",
      options: ["Peacock", "Tiger", "Elephant", "Lion"],
      correctOptionIndex: 1,
    ),
    Questions(
      questionText: "Which monument is known as the 'Symbol of Love' in India?",
      options: ["Qutub Minar", "India Gate", "Taj Mahal", "Red Fort"],
      correctOptionIndex: 2,
    ),
    Questions(
      questionText: "Which Indian state has the highest population?",
      options: ["Maharashtra", "Bihar", "Uttar Pradesh", "West Bengal"],
      correctOptionIndex: 2,
    ),
    Questions(
      questionText: "Which Indian festival is known as the 'Festival of Lights'?",
      options: ["Diwali", "Holi", "Eid", "Pongal"],
      correctOptionIndex: 0,
    ),
    Questions(
      questionText: "What is the official language of the Indian state of Karnataka?",
      options: ["Tamil", "Telugu", "Kannada", "Malayalam"],
      correctOptionIndex: 2,
    ),
    Questions(
      questionText: "Which Indian leader is known for his role in the non-violent struggle for India's independence?",
      options: ["Mahatma Gandhi", "Bhagat Singh", "Jawaharlal Nehru", "Subhas Chandra Bose"],
      correctOptionIndex: 0,
    ),
    Questions(
      questionText: "What is the currency of India?",
      options: ["Dollar", "Euro", "Rupee", "Pound"],
      correctOptionIndex: 2,
    ),
    Questions(
      questionText: "Which Indian state is known for its tea gardens?",
      options: ["Assam", "West Bengal", "Kerala", "Sikkim"],
      correctOptionIndex: 0,
    ),

  ];
}