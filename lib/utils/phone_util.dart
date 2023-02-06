import 'package:url_launcher/url_launcher.dart';

class PhoneUtil {
  ///拨打电话
  static void call({required String phone}) async {
    if (await canLaunchUrl(Uri(scheme: 'tel', path: phone))) {
      await launchUrl(Uri(scheme: 'tel', path: phone));
    } else {
      print('拨号失败');
    }
  }
}
