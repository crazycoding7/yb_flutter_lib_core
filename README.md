### 一个简单易用的Flutter核心库

- 包含：网络、权限、缓存、工具类等常用库封装。

### Example

```dart

///1. 权限请求
void _permissionRequest() async {
    Map<Permission, PermissionStatus>? status =
        await PermissionUtil.requestPermission(
            permissions: [Permission.storage]);
  }
///2. 工具类
/// 打电话
PhoneUtil.call(phone: '110');
/// 时间
TimeUtil.getNowTimeFormat1()
///3. 网络类
  
```

