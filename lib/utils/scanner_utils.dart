import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/scanner.dart';

class ScannerUtil {
  static Future<String> scanSource(BuildContext context) async {
    return await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ScannerPage();
    })).then((value) => value.toString());
  }

  static Future<int> scanCovertInt(BuildContext context) async {
    var result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ScannerPage();
    })).then((value) => value.toString());
    return int.tryParse(result.toString()) ?? 0;
  }
}
