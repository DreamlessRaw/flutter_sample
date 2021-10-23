import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HeroTwoPage extends StatefulWidget {
  const HeroTwoPage({Key? key}) : super(key: key);

  @override
  _HeroTwoPageState createState() => _HeroTwoPageState();
}

class _HeroTwoPageState extends State<HeroTwoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Hero(
            tag: 'TestHero',
            child: Image.network(
              'https://alifei03.cfp.cn/creative/vcg/800/version23/VCG41175510742.jpg',
              width: MediaQuery.of(context).size.width,
              height: 300,
            ),
          ),
          Text('描述')
        ],
      ),
    );
  }
}
