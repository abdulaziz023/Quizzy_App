import 'package:flutter/material.dart';
import 'package:quizzy_app/models/generate_quizz.dart';

import '../../styles/app_colors.dart';
import '../test_pages/level_1/level_1.dart';
import '../test_pages/level_2/level_2.dart';
import '../test_pages/level_3/level_3.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        const Text(
          "QUIZZY",
          style: TextStyle(
            fontSize: 67,
            color: AppColors.white,
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: 400,
            height: MediaQuery.sizeOf(context).width >= 350
                ? 200
                : (MediaQuery.sizeOf(context).width >= 200 ? 300 : 400),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15)),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      "Welcome to Quizzly!",
                      style: TextStyle(color: AppColors.purple, fontSize: 28),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      "With Quizzly, you can improve your thinking, intelligence and logical skills.",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: AppColors.purple, fontSize: 22),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 55,
        ),
        SizedBox(
          height: 66,
          width: 350,
          child: FilledButton(
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  color: AppColors.white,
                  width: 2,
                ),
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LevelOne(
                      baseModel: GenerateQuizz.levelOne(),
                    ),
                  ));
            },
            child: const Text(
              textAlign: TextAlign.center,
              "Level 1",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 22,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 66,
          width: 350,
          child: FilledButton(
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: AppColors.white),
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LevelOne(
                      baseModel: GenerateQuizz.levelOne(),
                    ),
                  ));
            },
            child: const Text(
              textAlign: TextAlign.center,
              "Level 2",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 22,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 66,
          width: 350,
          child: FilledButton(
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: AppColors.white),
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LevelOne(
                      baseModel: GenerateQuizz.levelOne(),
                    ),
                  ));
            },
            child: const Text(
              textAlign: TextAlign.center,
              "Level 3",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

String savedPage = "";
