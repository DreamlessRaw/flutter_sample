import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<int> _data = <int>[];

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // 初始化数据
    for (int i = 1; i <= 50; i++) {
      _data.add(i);
    }
    super.initState();
    // 监听ListView的滑动
    _scrollController.addListener(() {
      // 滑动到最底部
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        print('加载更多');
        this._onRefresh();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('数据列表'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: _onRefresh, // 刷新事件
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                if (i == _data.length - 1) {
                  return CupertinoActivityIndicator();//加载更多时显示图案
                } else {
                  return ListTile(
                    title: Text('数据_${_data[i]}'),
                    onTap: () {},
                  );
                }
              },
              itemCount: _data.length,
              controller: _scrollController,
            ),
          ),
        ));
  }

  Future _onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      // 下标从0开始
      var index = _data[_data.length - 1] + 1;
      var maxSize = index + 30;
      var data = <int>[];
      for (int i = index; i <= maxSize; i++) {
        data.add(i);
      }
      this.setState(() {
        _data.addAll(data);
      });
    });
  }
}
