class NumberUtil {
  /// double是否为整数
  static isInteger(double a) {
    double b = a;
    int b1 = a.toInt();
    return b % b1 == 0;
  }
}
