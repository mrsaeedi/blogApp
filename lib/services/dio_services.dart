import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DioService {
  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();
    dio.options.headers['content-type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        .then((resopnse) {
      log(resopnse.toString());
      // log(resopnse.toString());
      return resopnse;
    });
  }
}
