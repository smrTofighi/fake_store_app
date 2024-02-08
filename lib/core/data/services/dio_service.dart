import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;

class DioService {
  Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
    dio.options.headers['content-Type'] = 'application/json';

    // var token = GetStorage().read(StorageKeys.token);
    // if (token != null) {
    //   dio.options.headers['Authorization'] = 'Bearer $token';
    // }

    return await dio
        .get(
      url,
      //data: dio_service.FormData.fromMap(map),
      options: Options(
        responseType: ResponseType.json,
        method: 'GET',
        // followRedirects: false,
        // validateStatus: (status) {
        //   return status! < 500;
        // },
      ),
    )
        .then((response) {
      return response;
    });
  }
}