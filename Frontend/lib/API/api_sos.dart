import 'package:dio/dio.dart';

Future<void> apiSOS() async {
  print("API SOS");
  Response response;
  var dio = Dio();
  response = await dio.post('http://liraj.pythonanywhere.com/sos', data: {
    'data': [
      "8925283060",
      "9360284543",
      "8754577448",
    ],
  });
  print(response.data.toString());
}
