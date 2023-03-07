import 'dart:io';

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
  static Future<Map<Permission, PermissionStatus>?> requestPermissionNew(
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

  static Future<void> requestPermission({required Function callback}) async {
    if (Platform.isAndroid) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.camera,
      ].request();
      if (statuses[Permission.camera] == PermissionStatus.denied) {
        callback();
      }
    } else {
      var status = await Permission.photos.status;
      print(status);
      if (status.isDenied || status.isPermanentlyDenied) {
        callback();
      }
    }
  }

  static Future<void> requestPermissionAll({required Function callback}) async {
    if (Platform.isAndroid) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.camera,
        Permission.storage,
      ].request();
      if (statuses[Permission.camera] == PermissionStatus.denied) {
        callback();
      }
    } else {}
  }
}
