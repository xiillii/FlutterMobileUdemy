import 'package:intl/intl.dart';

class HumanFormats {
  static String numberCompact(double num) {
    final formatter = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
      locale: 'en',
    );

    return formatter.format(num);
  }
}
