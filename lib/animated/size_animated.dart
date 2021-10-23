import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedSizePage extends StatefulWidget {
  const AnimatedSizePage({Key? key}) : super(key: key);

  @override
  _AnimatedSizePageState createState() => _AnimatedSizePageState();
}

class _AnimatedSizePageState extends State<AnimatedSizePage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedSize动画'),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedSize(
          duration: Duration(seconds: 1),
          child: Container(
            child: Image.network(
                'http://www.ukutu.cn/upload/201602/03/20160203113127350.jpg'),
          ),
        ),
      ),
    );
  }
}
