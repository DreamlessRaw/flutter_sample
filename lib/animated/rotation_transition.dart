import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RotationTransitionPage extends StatefulWidget {
  const RotationTransitionPage({Key? key}) : super(key: key);

  @override
  _RotationTransitionPageState createState() => _RotationTransitionPageState();
}

class _RotationTransitionPageState extends State<RotationTransitionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    // _controller.addListener(() {
    //   if (_controller.value == 1) {
    //     _controller.reset();
    //   }
    // });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      } else if (status == AnimationStatus.dismissed) {
        _controller.reverse();
      } else if (status == AnimationStatus.forward) {
        // _controller.forward();
      } else if (status == AnimationStatus.reverse) {
        // _controller.reverse();
      }
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('旋转'),
          centerTitle: true,
        ),
        body: Row(
          children: [
            RotationTransition(
              turns: _controller,
              alignment: Alignment.center,
              child: Container(
                width: 100.0,
                height: 100.0,
                color: Colors.yellow,
                child: Center(
                  child: Text(
                    '5',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),
            ),
            RotationTransition(
              turns: _controller,
              alignment: Alignment.center,
              child: Container(
                width: 100.0,
                height: 100.0,
                color: Colors.yellow,
              ),
            ),
            RotationTransition(
              turns: _controller,
              alignment: Alignment.center,
              child: Container(
                width: 100.0,
                height: 100.0,
                color: Colors.yellow,
              ),
            ),
          ],
        ));
  }
}
