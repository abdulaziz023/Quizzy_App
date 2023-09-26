import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import 'main_page/main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quizzy App",
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "ExpletusSans",
        colorSchemeSeed: AppColors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BackgroundImage(
          image: 'assets/image/back_img.png',
          child: SafeArea(
            child: ListView(
              children: const [MainPage()],
            ),
          ),
        ),
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  final String image;
  final Widget child;

  const BackgroundImage({
    super.key,
    required this.image,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.purple,
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        child: child,
      ),
    );
  }
}
