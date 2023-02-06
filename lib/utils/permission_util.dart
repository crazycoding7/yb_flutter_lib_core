import 'package:permission_handler/permission_handler.dart';

/// 系统权限申请
class PermissionUtil {
  /// 申请权限
  /// (默认仅仅申请Android权限，Ios不需要)
  /// here is the most simple example
  ///
  /// ```dart
  ///
  /// void _open() async {
  ///     Map<Permission, PermissionStatus>? status =
  ///         await PermissionUtil.requestPermission(
  ///             permissions: [Permission.storage]);
  ///   }
  ///
  /// ```
  static Future<Map<Permission, PermissionStatus>?> requestPermission(
      {required List<Permission> permissions,
      bool isJustForAndroid = true}) async {
    if (!isJustForAndroid) {
      return null;
    }
    return await permissions.request();
  }

  /// 查看权限是否存在
  static isPermissionIsGranted({required Permission permission}) async {
    return await Permission.contacts.request().isGranted;
  }

  /// 打开系统权限界面
  static openSystemAppSettings() async {
    openAppSettings();
  }
}
