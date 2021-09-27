import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrossFadeAnimatedPage extends StatefulWidget {
  const CrossFadeAnimatedPage({Key? key}) : super(key: key);

  @override
  _CrossFadeAnimatedPageState createState() => _CrossFadeAnimatedPageState();
}

class _CrossFadeAnimatedPageState extends State<CrossFadeAnimatedPage> {
  bool _first = false;
  late Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _first = !_first;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedCrossFade'),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedCrossFade(
          duration: const Duration(seconds: 2),
          firstChild: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
          secondChild: Container(
            width: 200,
            height: 100,
            color: Colors.yellow,
          ),
          crossFadeState:
              _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
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
