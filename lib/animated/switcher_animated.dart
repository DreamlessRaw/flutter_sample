import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedSwitcherPage extends StatefulWidget {
  const AnimatedSwitcherPage({Key? key}) : super(key: key);

  @override
  _AnimatedSwitcherPageState createState() => _AnimatedSwitcherPageState();
}

class _AnimatedSwitcherPageState extends State<AnimatedSwitcherPage> {
  bool _isChecked = true;
  late Timer _timer;
  Widget _child = Container(
    key: ValueKey(1),
    color: Colors.blue,
    width: 300,
    height: 300,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 1500), (timer) {
      this.setState(() {
        _isChecked = !_isChecked;
        if (_isChecked) {
          _child = Container(
            key: ValueKey(1),
            color: Colors.blue,
            width: 300,
            height: 300,
          );
        } else {
          _child = Container(
            key: ValueKey(2),
            color: Colors.red,
            width: 200,
            height: 200,
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedSwitcher'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            AnimatedSwitcher(
              switchInCurve: Curves.linear,
              duration: Duration(milliseconds: 1000),
              child: _child,
              transitionBuilder: (child, animation) {
                // 渐隐渐显效果
                return FadeTransition(
                  opacity: Tween(begin: 0.0, end: 1.0).animate(animation),
                  child: child,
                );
                // 缩放效果
                return ScaleTransition(
                  child: child,
                  scale: animation.drive(Tween(begin: 0, end: 1)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }
}
