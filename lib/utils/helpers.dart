import 'package:intl/intl.dart';

double numConvert(int num) {
  String n = num.toString();
  String intNumber = n.substring(0, n.length - 1);
  String fractionalNumber = n.substring(n.length - 1);

  return double.parse('$intNumber.$fractionalNumber');
}

String convertDate(String date) {
  return DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse(date));
}
