import 'dart:convert' as convert;

import 'package:common_utils/common_utils.dart';
import 'package:logger/logger.dart';

/// 自定义log输出(结合LoggerUtil和Logger库)
///
class PrintUtil {
  static const int _limitLength = 800;

  /// json格式输出
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
  );

  static void v(Object? object, {String? tag, bool isJsonModel = false}) {
    if (isJsonModel == true) {
      Map<String, dynamic> user = convert.jsonDecode(object.toString());
      _logger.v(user);
    } else {
      _log(object.toString(), tag: tag);
    }
  }

  static void _log(
    String msg, {
    String? tag,
  }) {
    // LogUtil.v(
    //     ' — — — — — — — — — — — — — — — — st — — — — — — — — — — — — — — — —',
    //     tag: tag);
    if (msg.length < _limitLength) {
      LogUtil.v(msg, tag: tag);
    } else {
      _segmentationLog(msg, tag: tag);
    }
    // LogUtil.v(
    //     ' — — — — — — — — — — — — — — — — ed — — — — — — — — — — — — — — — —',
    //     tag: tag);
  }

  static void _segmentationLog(
    String msg, {
    String? tag,
  }) {
    var outStr = StringBuffer();
    for (var index = 0; index < msg.length; index++) {
      outStr.write(msg[index]);
      if (index % _limitLength == 0 && index != 0) {
        LogUtil.v(outStr, tag: tag);
        outStr.clear();
        var lastIndex = index + 1;
        if (msg.length - lastIndex < _limitLength) {
          var remainderStr = msg.substring(lastIndex, msg.length);
          LogUtil.v(remainderStr, tag: tag);
          break;
        }
      }
    }
  }
}
