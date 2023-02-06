import 'package:common_utils/common_utils.dart';

/// 正则表达式
/// 参考：RegexUtil
class RegExpUtil {
  ///手机号验证
  static bool isChinaPhoneLegal(String str) {
    return RegExp(
            r"^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$")
        .hasMatch(str);
  }

  ///邮箱验证
  static bool isEmail(String str) {
    return RegExp(r"^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$")
        .hasMatch(str);
  }

  ///验证URL
  static bool isUrl(String value) {
    return RegExp(r"^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+").hasMatch(value);
  }

  ///验证身份证
  static bool isIdCard(String value) {
    return RegExp(r"\d{17}[\d|x]|\d{15}").hasMatch(value);
  }

  ///验证中文
  static bool isChinese(String value) {
    return RegExp(r"[\u4e00-\u9fa5]").hasMatch(value);
  }

  /// 验证身份证男女信息
  static bool isBoyByIdCard(String idCard) {
    if (TextUtil.isEmpty(idCard) || idCard.length != 18) {
      return false;
    }

    int sexNumber = int.parse(idCard[16]); //.substring(16, 17) as int;
    return sexNumber % 2 == 0 ? false : true;
  }

  /// 截取字符串前几位
  static String getPreStringByCount(String text, int count) {
    if (TextUtil.isEmpty(text) || text.length < count) {
      return text;
    }

    return text.substring(0, count);
  }
}
