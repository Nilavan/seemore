import 'package:dio/dio.dart';

Future<String> apiCurrency({required String path}) async {
  print("API CURRENCY");
  print(path);
  var dio = Dio();
  var formData = FormData();
  formData.files.add(MapEntry(
    "file",
    await MultipartFile.fromFile(path, filename: "pic-name.png"),
  ));
  var response = await dio.post('http://liraj.pythonanywhere.com/currency',
      data: formData);
  print(response.data.toString());
  return response.data.toString();
}
