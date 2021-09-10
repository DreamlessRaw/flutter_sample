import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedSamplePage extends StatefulWidget {
  const AnimatedSamplePage({Key? key}) : super(key: key);

  @override
  _AnimatedSamplePageState createState() => _AnimatedSamplePageState();
}

class _AnimatedSamplePageState extends State<AnimatedSamplePage> {
  bool _selected = false;
  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 3), (t) {
      setState(() {
        // AnimatedContainer
        _selected = !_selected;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // 改变大小
          Center(
            child: AnimatedContainer(
              margin: EdgeInsets.all(15.0),
              width: _selected
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width / 2,
              height: _selected ? 200.0 : 200.0,
              alignment:
                  _selected ? Alignment.center : AlignmentDirectional.topCenter,
              // 设置样式，与Color只能同时设置一个，不然会报错
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: _selected ? Colors.blue : Colors.green,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 10.0,
                    )
                  ]),
              duration: const Duration(seconds: 2),
              // 动画时长
              curve: Curves.fastOutSlowIn,
              child: Center(
                child: const FlutterLogo(size: 50),
              ),
            ),
          ),
          // 平移
          Center(
            child: AnimatedContainer(
              margin: EdgeInsets.all(15.0),
              width: 100,
              height: 100,
              alignment:
                  _selected ? Alignment.center : AlignmentDirectional.topCenter,
              // 设置样式，与Color只能同时设置一个，不然会报错
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: _selected ? Colors.blue : Colors.green,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 10.0,
                    )
                  ]),
              // 旋转
              transform: _selected
                  ? Matrix4.translationValues(-100, 0, 0)
                  : Matrix4.translationValues(0, 0, 0),
              duration: const Duration(seconds: 2),
              // 动画时长
              curve: Curves.fastOutSlowIn,
              child: Center(
                child: const FlutterLogo(size: 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
