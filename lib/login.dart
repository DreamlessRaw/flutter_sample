import 'package:flutter/material.dart';
import 'package:flutter_sample/utils/http_util.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _nameFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
        centerTitle: true,
      ), // 不需要可去掉标题头
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage('assets/images/bg_login.jpg'),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _nameController,
                focusNode: _nameFocusNode,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(36),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.people),
                    hintText: '用户名'),
              ),
              Padding(padding: EdgeInsets.all(15.0)),
              TextField(
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                // 是否显示内容
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(36),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.lock),
                    hintText: '密码'),
              ),
              Padding(padding: EdgeInsets.all(20.0)),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                height: 56,
                shape: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(36.0)),
                padding: EdgeInsets.only(top: 12, bottom: 12),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () async {
                  if (_nameController.text.isEmpty) {
                    _nameFocusNode.requestFocus();
                  } else if (_passwordController.text.isEmpty) {
                    _passwordFocusNode.requestFocus();
                  } else {
                    var result = await HttpUtil.login(
                        _nameController.text, _passwordController.text);
                    print(result.toString());
                  }
                },
                child: Text('登录'),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _nameFocusNode.dispose();
    _passwordFocusNode.dispose();
  }
}
