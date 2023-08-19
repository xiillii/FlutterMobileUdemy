import 'package:intl/intl.dart';

class HumanFormats {
  static String numberCompact(double num, [int decimals = 0]) {
    final formatter = NumberFormat.compactCurrency(
      decimalDigits: decimals,
      symbol: '',
      locale: 'en',
    );

    return formatter.format(num);
  }
}
