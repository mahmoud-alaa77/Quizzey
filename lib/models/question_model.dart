
class QuestionModel{

  final String title;
  final String inCorrectAnswer1;
  final String inCorrectAnswer2;
  final String inCorrectAnswer3;
  final String correctAnswer;
  final String difficulty;

  QuestionModel({
    required this.title,
    required this.inCorrectAnswer1,
    required this.inCorrectAnswer2,
    required this.inCorrectAnswer3,
    required this.correctAnswer,
    required this.difficulty
  });

  factory QuestionModel.fromJson(json){

    return QuestionModel(
      title: json["question"],
      correctAnswer:json["correct_answer"],
      difficulty: json["difficulty"],
      inCorrectAnswer1: json["incorrect_answers"][0],
      inCorrectAnswer2:json["incorrect_answers"][1],
      inCorrectAnswer3: json["incorrect_answers"][2],
    );
  }

}