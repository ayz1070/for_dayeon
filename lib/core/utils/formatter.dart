import 'package:intl/intl.dart';

class Formatter{
  /// 시간 포멧터 (24:60)
  static String formatHourMinute(DateTime dateTime) {
    final formatedTime = DateFormat("HH시 mm분").format(dateTime);
    return formatedTime;
  }

  /// 날짜 포멧터 (년.월.일)
  static String formatYearMonthDate(DateTime dateTime){
    final formatedDate = DateFormat('yy년 MM월 dd일').format(dateTime);
    return formatedDate;
  }
}