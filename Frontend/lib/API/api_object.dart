import 'package:dio/dio.dart';

Future<String> apiObject({required String path}) async {
  print("API OBJECT");
  print(path);
  var dio = Dio();
  var formData = FormData();
  formData.files.add(MapEntry(
    "file",
    await MultipartFile.fromFile(path, filename: "pic-name.png"),
  ));
  var response = await dio.post('http://liraj.pythonanywhere.com/detected_obj',
      data: formData);
  print(response.data.toString());
  return response.data.toString();
}
