import 'dart:math';

class Utils {
  static String getRandomLetterIdentification() {
    String letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    String result = '';
    for (int i = 0; i < 3; i++) {
      result += letters[Random().nextInt(letters.length)];
    }

    return result;
  }

  static String? getIncrementalNumberIdentification(String? lastIdentification) {
    if (lastIdentification == null) {
      return null;
    }
    var lastNumber = int.tryParse(lastIdentification);

    if (lastNumber == null) {
      return null;
    }
    lastNumber++;

    return lastNumber.toString().padLeft(4, '0');
  }
}
