import 'package:intl/intl.dart';

class HumanFormats {
  static String humanReadableNumber(double number) {
    final result = NumberFormat.compactCurrency(decimalDigits: 0, symbol: '')
        .format(number);

    return result;
  }
}
