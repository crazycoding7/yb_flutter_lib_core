import 'package:date_format/date_format.dart';

class TimeUtil {
  static bool isDateBeginEnd(
      {required int checkDateMs,
      required int startDateMs,
      required int endDateMs}) {
    print('$checkDateMs $startDateMs $endDateMs');
    if (checkDateMs >= startDateMs && checkDateMs <= endDateMs) {
      return true;
    }
    return false;
  }

  static int currentTimeMillis() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  static int todayZeroMillis() {
    var today = DateTime.now();
    var zeroDate = DateTime(today.year, today.month, today.day, 0, 0, 0);
    return zeroDate.millisecondsSinceEpoch;
  }

  static int today1159ZeroMillis() {
    var today = DateTime.now();
    var zeroDate = DateTime(today.year, today.month, today.day, 23, 59, 59);
    return zeroDate.millisecondsSinceEpoch;
  }

  static int dayWithZeroMillis(int millisecond) {
    var day = DateTime.fromMillisecondsSinceEpoch(millisecond);
    var zeroDate = DateTime(day.year, day.month, day.day, 0, 0, 0);
    return zeroDate.millisecondsSinceEpoch;
  }

  static int dayWith1159Millis(int millisecond) {
    var day = DateTime.fromMillisecondsSinceEpoch(millisecond);
    var myDate = DateTime(day.year, day.month, day.day, 23, 59, 59);
    return myDate.millisecondsSinceEpoch;
  }

  /// 2021-04-19  18:29:30
  static const List<String> formats1 = [
    yyyy,
    '-',
    mm,
    '-',
    dd,
    ' ',
    HH,
    ':',
    nn,
    ':',
    ss
  ];

  /// 2021-04-19  18:29
  static const List<String> formats1IgnoreSS = [
    yyyy,
    '-',
    mm,
    '-',
    dd,
    ' ',
    HH,
    ':',
    nn
  ];

  /// 2021.04.19  18:29:30
  static const List<String> formats2 = [
    yyyy,
    '.',
    mm,
    '.',
    dd,
    ' ',
    HH,
    ':',
    nn,
    ':',
    ss
  ];

  /// 2021-04-19
  static const List<String> formats3 = [
    yyyy,
    '-',
    mm,
    '-',
    dd,
  ];

  /// 2021.04.19
  static const List<String> formats4 = [
    yyyy,
    '.',
    mm,
    '.',
    dd,
  ];

  /// 2021.04.19  18:29
  static const List<String> formats5 = [
    yyyy,
    '.',
    mm,
    '.',
    dd,
    ' ',
    HH,
    ':',
    nn
  ];

  /// 18:29
  static const List<String> formats6 = [HH, ':', nn];

  /// 2021-04-19
  static const List<String> formats7 = [mm, '月', dd, '日'];

  /// 18:29:30
  static const List<String> formats8 = [HH, ':', nn, ':', ss];

  /// 是否是今天
  static isTodayNow({required int milliseconds}) {
    return formatDate(DateTime.now(), formats3) ==
        formatDate(DateTime.fromMillisecondsSinceEpoch(milliseconds), formats3);
  }

  /// 是否是昨天
  static isYesterday({required int milliseconds}) {
    DateTime now = DateTime.now(); //2021.8.24   获取今天的日期
    DateTime yesterday = now.subtract(new Duration(days: 1));

    return formatDate(yesterday, formats3) ==
        formatDate(DateTime.fromMillisecondsSinceEpoch(milliseconds), formats3);
  }

  static getNowTimeFormatAll(
      {int milliseconds = 0, required List<String> formats}) {
    if (milliseconds > 0) {
      return formatDate(
          DateTime.fromMillisecondsSinceEpoch(milliseconds), formats);
    }
    return formatDate(DateTime.now(), formats);
  }

  static getNowTimeFormat1({int milliseconds = 0}) {
    if (milliseconds > 0) {
      return formatDate(
          DateTime.fromMillisecondsSinceEpoch(milliseconds), formats1);
    }
    return formatDate(DateTime.now(), formats1);
  }

  static getNowTimeFormat8({int milliseconds = 0}) {
    if (milliseconds > 0) {
      return formatDate(
          DateTime.fromMillisecondsSinceEpoch(milliseconds), formats8);
    }
    return formatDate(DateTime.now(), formats8);
  }

  static getNowTimeFormat1IgnoreSS({int milliseconds = 0}) {
    if (milliseconds > 0) {
      return formatDate(
          DateTime.fromMillisecondsSinceEpoch(milliseconds), formats1IgnoreSS);
    }
    return formatDate(DateTime.now(), formats1IgnoreSS);
  }

  static getNowTimeFormat2({int milliseconds = 0}) {
    if (milliseconds > 0) {
      return formatDate(
          DateTime.fromMillisecondsSinceEpoch(milliseconds), formats2);
    }
    return formatDate(DateTime.now(), formats2);
  }

  static getNowTimeFormat3({int milliseconds = 0}) {
    if (milliseconds > 0) {
      return formatDate(
          DateTime.fromMillisecondsSinceEpoch(milliseconds), formats3);
    }
    return formatDate(DateTime.now(), formats3);
  }

  static getNowTimeFormat4({int milliseconds = 0}) {
    if (milliseconds > 0) {
      return formatDate(
          DateTime.fromMillisecondsSinceEpoch(milliseconds), formats4);
    }
    return formatDate(DateTime.now(), formats4);
  }

  static getNowTimeFormat5({int milliseconds = 0}) {
    if (milliseconds > 0) {
      return formatDate(
          DateTime.fromMillisecondsSinceEpoch(milliseconds), formats5);
    }
    return formatDate(DateTime.now(), formats5);
  }

  static getNowTimeFormat6({int milliseconds = 0}) {
    if (milliseconds > 0) {
      return formatDate(
          DateTime.fromMillisecondsSinceEpoch(milliseconds), formats6);
    }
    return formatDate(DateTime.now(), formats6);
  }

  static getNowTimeFormat7({int milliseconds = 0}) {
    if (milliseconds > 0) {
      return formatDate(
          DateTime.fromMillisecondsSinceEpoch(milliseconds), formats7);
    }
    return formatDate(DateTime.now(), formats7);
  }
}
