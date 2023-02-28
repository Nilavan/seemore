import 'package:dio/dio.dart';

void apiMenu({required String text}) async {
  print("API Menu");
  Response response;
  var dio = Dio();
  response = await dio.post('/menu', data: {
    'text': text,
  });
  print(response.data.toString());
}
