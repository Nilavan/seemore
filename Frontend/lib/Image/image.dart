import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:camera/camera.dart';

Future<XFile> pickImageFromGallery() async {
  ImagePicker picker = ImagePicker();
  XFile? image = await picker.pickImage(source: ImageSource.gallery);
  return image!;
}

Future<XFile?> pickImageFromCamera() async {
  // ImagePicker picker = ImagePicker();
  // XFile? image = await picker.pickImage(source: ImageSource.camera);

  var _cameras = await availableCameras();

  CameraController controller =
      CameraController(_cameras[0], ResolutionPreset.max);

  await controller.initialize();

  Future<XFile>? image;

  print("PIC NOW");
  image = controller.takePicture();

  return image;
}
