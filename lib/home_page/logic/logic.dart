import 'dart:math';

class Logic {
  static int generateRandomNumber(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min + 1);
  }

  static String randomSign() {
    String res = "";
    int number = generateRandomNumber(1, 4);
    switch (number) {
      case 1:
        res = "+";
      case 2:
        res = "-";
      case 3:
        res = "*";
      case 4:
        res = "/";
    }
    return res;
  }

  static int answer(int a, int b, String sign) {
    int result = 0;
    switch (sign) {
      case "+":
        result = a + b;
      case "-":
        result = a - b;
      case "*":
        result = a * b;
      case "/":
        result = a ~/ b;
    }
    return result;
  }
}