import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BuilderAnimatedPage extends StatefulWidget {
  const BuilderAnimatedPage({Key? key}) : super(key: key);

  @override
  _BuilderAnimatedPageState createState() => _BuilderAnimatedPageState();
}

class _BuilderAnimatedPageState extends State<BuilderAnimatedPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    // _controller.addListener(() {
    //   if (_controller.value == 1) {
    //     _controller.reset();
    //   }
    // });
    _animation = Tween(begin: 100.0, end: 200.0).animate(_controller);
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedBuilder'),
        centerTitle: true,
      ),
      body: AnimatedBuilder(
          animation: _animation,
          child: Text(
            '无梦生',
            style: Theme.of(context).textTheme.headline5,
          ),
          builder: (context, child) {
            return Center(
              child: Container(
                color: Colors.yellow,
                alignment: Alignment.center,
                width: _animation.value,
                height: _animation.value,
                child: child,
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}
