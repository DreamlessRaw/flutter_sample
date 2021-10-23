import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_sample/animated/hero/hero_two.dart';

class HeroOnePage extends StatefulWidget {
  const HeroOnePage({Key? key}) : super(key: key);

  @override
  _HeroOnePageState createState() => _HeroOnePageState();
}

class _HeroOnePageState extends State<HeroOnePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero'),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HeroTwoPage()));
          },
          child: Hero(
              tag: 'TestHero',
              transitionOnUserGestures: false,
              child: Image.network(
                'https://alifei03.cfp.cn/creative/vcg/800/version23/VCG41175510742.jpg',
                width: 100,
                height: 100,
              )),
        ),
      ),
    );
  }
}
