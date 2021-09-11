import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class HttpUtil {
  static Dio? _tempDio;
  static CookieJar _cookieJar = CookieJar();

  static Dio get _dio {
    if (_tempDio == null) {
      var options = BaseOptions(
          baseUrl: 'http://192.168.1.37:8080/',
          connectTimeout: 3000,
          receiveTimeout: 3000);
      _tempDio = Dio(options);
      _tempDio!.interceptors.add(CookieManager(_cookieJar));
    }
    return _tempDio!;
  }


  static Future login(String name,String password) {
    Map<String,dynamic> map=Map();
    map['mobileType']=0;
    map['Username']=name;
    map['Password']=password;
    return _dio.post('login',data: map);
  }

}
