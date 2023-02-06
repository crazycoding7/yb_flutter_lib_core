import 'package:flutter/material.dart';
import 'package:yb_flutter_lib_core/network/http_manager_client.dart';
import 'package:yb_flutter_lib_core/utils/phone_util.dart';
import 'package:yb_flutter_lib_core/utils/time_util.dart';
import 'package:yb_flutter_lib_core/yb_flutter_lib_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'yb_flutter_lib_core',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'yb_flutter_lib_core'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _permissionRequest() async {
    Map<Permission, PermissionStatus>? status =
        await PermissionUtil.requestPermission(
            permissions: [Permission.storage]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          _getBtnNormal(
              child: const Text('权限请求'),
              bgColor: Colors.deepPurpleAccent,
              onPressed: () {
                _permissionRequest();
              }),
          _getBtnNormal(
              child: const Text('拨号'),
              bgColor: Colors.deepPurpleAccent,
              onPressed: () {
                PhoneUtil.call(phone: '110');
              }),
          _getBtnNormal(
              child: const Text('网络初始化'),
              bgColor: Colors.deepPurpleAccent,
              onPressed: () {
                HttpManagerClient.init(
                    baseUrl: 'http://www.yb.com',
                    interceptorsWrapperList: [],
                    proxyIpAddress: '192.168.1.2:8888');
              }),
          Text('${TimeUtil.getNowTimeFormat1()}'),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _getBtnNormal({
    bgColor = Colors.black,
    VoidCallback? onPressed,
    double radius = 0,
    Size? size,
    borderColor = Colors.transparent,
    required Widget child,
  }) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          //边框
          side: BorderSide(
              width: 1, style: BorderStyle.solid, color: borderColor),
          minimumSize: size,
        ),
        child: child);
  }
}
