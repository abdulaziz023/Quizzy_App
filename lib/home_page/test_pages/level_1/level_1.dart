import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzy_app/models/model.dart';

import '../../../styles/app_colors.dart';
import '../../result_page/result_page.dart';

class LevelOne extends StatefulWidget {
  final BaseModel baseModel;

  const LevelOne({super.key, required this.baseModel});

  @override
  State<LevelOne> createState() => _LevelOneState();
}

class _LevelOneState extends State<LevelOne> {
  int currentQuizIndex = 0;
  CountDownController countDownController = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SizedBox(
            width: double.infinity,
            height: 200,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.purple,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(
              0.0,
              -0.6,
            ),
            child: SizedBox(
              width: 250,
              height: MediaQuery.sizeOf(context).width >= 350
                  ? 200
                  : (MediaQuery.sizeOf(context).width >= 200 ? 300 : 400),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(
                          0.0,
                          1.5,
                        ),
                        color: Colors.black26,
                        blurRadius: 5)
                  ],
                  color: AppColors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Question ${(currentQuizIndex+1).toString().padLeft(2, '0')}/${widget.baseModel.quizzes.length}",
                        style:
                            TextStyle(color: AppColors.purple, fontSize: 18)),
                    Text(widget.baseModel.quizzes[currentQuizIndex].question),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(
              0.0,
              -0.8,
            ),
            child: widget.baseModel.second == 0
                ? const Icon(CupertinoIcons.infinite)
                : CircularCountDownTimer(
                    controller: countDownController,
                    width: 60,
                    autoStart: true,
                    height: 120,
                    duration: widget.baseModel.second,
                    fillColor: AppColors.white,
                    ringColor: AppColors.purple,
                    onComplete: onCompleteTime,
                    isReverse: true,
                    isReverseAnimation: true,
                    backgroundColor: AppColors.white,
                    textStyle: const TextStyle(
                      color: AppColors.purple,
                    ),
                  ),
          ),
          Button(
            text: widget.baseModel.quizzes[currentQuizIndex].answers[0]
                .toString(),
            y: 0.0,
            onPress: () => checkAnswerButton(
                widget.baseModel.quizzes[currentQuizIndex].answers[3]),
          ),
          Button(
            text: widget.baseModel.quizzes[currentQuizIndex].answers[1]
                .toString(),
            y: 0.2,
            onPress: () => checkAnswerButton(
                widget.baseModel.quizzes[currentQuizIndex].answers[3]),
          ),
          Button(
            text: widget.baseModel.quizzes[currentQuizIndex].answers[2]
                .toString(),
            y: 0.4,
            onPress: () => checkAnswerButton(
                widget.baseModel.quizzes[currentQuizIndex].answers[3]),
          ),
          Button(
            text: widget.baseModel.quizzes[currentQuizIndex].answers[3]
                .toString(),
            y: 0.6,
            onPress: () => checkAnswerButton(
                widget.baseModel.quizzes[currentQuizIndex].answers[3]),
          ),
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

  void checkAnswerButton(int answer) {
    widget.baseModel.quizzes[currentQuizIndex].answer = widget.baseModel.quizzes[currentQuizIndex].trueAnswer == answer ? 2 : 1;
    setState(() {
      if((currentQuizIndex+1) >= widget.baseModel.quizzes.length){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultPage(quizzes: widget.baseModel.quizzes),));
      }else {
        currentQuizIndex++;
        countDownController.restart(duration: widget.baseModel.second);
      }
    });
  }

  void onCompleteTime() {
    setState(() {
      if((currentQuizIndex+1) >= widget.baseModel.quizzes.length){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultPage(quizzes: widget.baseModel.quizzes),));
      }else {
        currentQuizIndex++;
        countDownController.restart(duration: widget.baseModel.second);
      }
    });
  }
}

class Button extends StatelessWidget {
  final String text;
  final double y;
  final void Function() onPress;

  const Button(
      {super.key, required this.text, required this.y, required this.onPress});

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
          onPressed: onPress,
          child: Text(
            textAlign: TextAlign.center,
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}
