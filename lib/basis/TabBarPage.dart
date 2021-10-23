import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  int _currentIndex = 0;
  late Widget _currentPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar'),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.home), Text('首页')],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.home), Text('首页')],
                ),
              ),
              Text(''),
              GestureDetector(
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.home), Text('首页')],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.people), Text('个人')],
                ),
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: Text(
          '内容',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
