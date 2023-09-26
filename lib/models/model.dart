class BaseModel {
  final int second;
  List<QuizModel> quizzes;

  BaseModel({
    required this.second,
    required this.quizzes,
  });

  @override
  String toString() {
    return 'BaseModel{second: $second, quizzes: $quizzes}';
  }

  Map<String, dynamic> toMap() {
    return {
      '"second"': this.second,
      '"quizzes"': this.quizzes,
    };
  }

  factory BaseModel.fromMap(Map<String, dynamic> map) {
    return BaseModel(
      second: map['second'] as int,
      quizzes: map['quizzes'] as List<QuizModel>,
    );
  }
}

class QuizModel {
  int id;
  String question;
  int trueAnswer;
  List<int> answers;
  int answer;

  QuizModel({
    required this.id,
    required this.question,
    required this.trueAnswer,
    required this.answers,
    this.answer = 0,
  });

  @override
  String toString() {
    return 'QuizModel{id: $id, question: $question, trueAnswer: $trueAnswer, answers: $answers, answer: $answer}';
  }

  Map<String, dynamic> toMap() {
    return {
      '"id"': id,
      '"question"': '"$question"',
      '"trueAnswer"': trueAnswer,
      '"answers"': answers,
      '"answer"': answer,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      id: map['id'] as int,
      question: map['question'] as String,
      trueAnswer: map['trueAnswer'] as int,
      answers: map['answers'] as List<int>,
      answer: map['answer'] as int,
    );
  }
}
