import 'package:flutter/material.dart';
import 'package:flutter_sample/animated/builder_animated.dart';
import 'package:flutter_sample/animated/container_animated.dart';
import 'package:flutter_sample/animated/cross_fade_animated.dart';
import 'package:flutter_sample/animated/rotation_transition.dart';
import 'package:flutter_sample/expanded.dart';
import 'package:flutter_sample/list_view.dart';
import 'package:flutter_sample/login.dart';
import 'package:flutter_sample/utils/scanner_utils.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 例子',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '主页'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ExpandedPage();
                }));
              },
              child: Text('Expanded示例')),
          OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ListViewPage();
                }));
              },
              child: Text('ListView示例')),
          OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AnimatedSamplePage();
                }));
              },
              child: Text('Animated示例')),
          OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CrossFadeAnimatedPage();
                }));
              },
              child: Text('AnimatedCrossFade示例')),
          OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BuilderAnimatedPage();
                }));
              },
              child: Text('AnimatedBuilder示例')),
          OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RotationTransitionPage();
                }));
              },
              child: Text('旋转示例')),
          OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
              child: Text('Login示例')),
          OutlinedButton(
              onPressed: () async {
                var permission = await Permission.camera.request();
                if (permission.isGranted) {
                  var code = await ScannerUtil.scanSource(context);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('扫码结果'),
                          content: Text(
                            code,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('关闭'),
                            )
                          ],
                        );
                      });
                }
              },
              child: Text('扫码示例'))
        ],
      ),
    );
  }
}
