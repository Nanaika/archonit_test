import 'dart:math';
import 'dart:ui';

Color generateRandomColor() {
  final random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}

String formatNumber(double value) {
  double truncated = (value * 100).truncateToDouble() / 100;
  String str = truncated.toStringAsFixed(2);

  List<String> parts = str.split('.');
  String integerPart = parts[0];
  String decimalPart = parts[1];

  StringBuffer buffer = StringBuffer();
  for (int i = 0; i < integerPart.length; i++) {
    int position = integerPart.length - i;
    buffer.write(integerPart[i]);
    if (position > 1 && position % 3 == 1 && i != integerPart.length - 1) {
      buffer.write(',');
    }
  }

  return '${buffer.toString()}.$decimalPart';
}