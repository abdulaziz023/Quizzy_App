import 'package:quizzy_app/home_page/logic/logic.dart';
import 'package:quizzy_app/models/model.dart';

class GenerateQuizz {
  const GenerateQuizz._();

  static BaseModel levelOne() {
    List<QuizModel> quizzes = List.generate(10, (index) {
      int a = Logic.generateRandomNumber(0, 100);
      int b = Logic.generateRandomNumber(0, 100);
      String sign = Logic.randomSign();
      String question = "$a $sign $b = ?";
      int answer = Logic.answer(a, b, sign);
      List<int> answers = [
        answer,
        Logic.generateRandomNumber(0, 1000),
        Logic.generateRandomNumber(0, 1000),
        Logic.generateRandomNumber(0, 1000),
      ];
      answers.shuffle();

      return QuizModel(
          id: index, question: question, trueAnswer: answer, answers: answers);
    });

    BaseModel baseModel = BaseModel(second: 10, quizzes: quizzes);
    return baseModel;
  }
}
void main() {
  BaseModel a = GenerateQuizz.levelOne();
  final b = a.quizzes.map((e) => e.toMap()).toList();
  print(b);
}
