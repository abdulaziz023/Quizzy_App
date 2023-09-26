import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import '../../models/model.dart';
import '../../styles/app_colors.dart';
import '../home_page.dart';
import '../main_page/main_page.dart';
import '../test_pages/level_1/level_1.dart';
import '../test_pages/level_2/level_2.dart';
import '../test_pages/level_3/level_3.dart';

class ResultPage extends StatefulWidget {
  final List<QuizModel> quizzes;

  const ResultPage({super.key, required this.quizzes});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late List<int> answers = widget.quizzes.map((e) => e.answer).toList();
  late List<int> trueAnswers = answers.where((e) => e == 2).toList();
  late List<int> falseAnswers = answers.where((e) => e != 2).toList();

  @override
  Widget build(BuildContext context) {
    print(answers);
    print(trueAnswers);
    print(falseAnswers);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 400,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.purple,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Align(
                alignment: Alignment(0.0, -0.1),
                child: CircleAvatar(
                  backgroundColor: Colors.white12,
                  radius: 70,
                  child: CircleAvatar(
                    backgroundColor: Colors.white30,
                    radius: 60,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child: Text(
                          "Your Score ${((100 / answers.length) * trueAnswers.length).toInt()}",
                          textAlign: TextAlign.center),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(
              0.0,
              -0.1,
            ),
            child: SizedBox(
              width: 300,
              height: 150,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    const BoxShadow(
                        offset: Offset(
                          0.0,
                          1.5,
                        ),
                        color: Colors.black26,
                        blurRadius: 5)
                  ],
                  color: AppColors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.circle, color: Colors.green, size: 13),
                            Text(
                                " ${trueAnswers.length}        ",
                                style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        Text(" Correct", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.circle, color: Colors.red, size: 13),
                            Text(
                                "  ${falseAnswers.length}        ",
                                style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        Text(" Wrong", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const PlayAgain(text: "Play again", y: 0.4),
          const Button(text: "Home", y: 0.6),
          const Align(
            alignment: Alignment(0.0, 1.1),
            child: SizedBox(
              width: double.infinity,
              height: 100,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.purple,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("QUIZZLY\n"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  final double y;

  const Button({super.key, required this.text, required this.y});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0.0, y),
      child: SizedBox(
        height: 66,
        width: 350,
        child: FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(
                color: AppColors.purple,
                width: 2,
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
          },
          child: Text(
            textAlign: TextAlign.center,
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}

class PlayAgain extends StatelessWidget {
  final String text;
  final double y;

  const PlayAgain({super.key, required this.text, required this.y});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0.0, y),
      child: SizedBox(
        height: 66,
        width: 350,
        child: FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(
                color: AppColors.purple,
                width: 2,
              ),
            ),
          ),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) {
            //     if (savedPage.contains("LevelOne")) {
            //       // return LevelOne();
            //     } else if (savedPage.contains("LevelTwo")) {
            //       return LevelTwo();
            //     } else if (savedPage.contains("LevelThree")) {
            //       return LevelThree();
            //     } else {
            //       return HomePage();
            //     }
            //   }),
            // );
          },
          child: Text(
            textAlign: TextAlign.center,
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}
