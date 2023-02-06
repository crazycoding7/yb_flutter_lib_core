class FastClickUtil {
  static int _lastClickTime = 0;

  /// 多次点击
  static fastClick() {
    int time = DateTime.now().millisecondsSinceEpoch;
    if (time - _lastClickTime < 800) {
      return true;
    }
    _lastClickTime = time;
    return false;
  }
}
