import 'package:image_picker/image_picker.dart';

Future<String?> pickImageFromGallery() async {
  final ImagePicker picker = ImagePicker();
// Pick an image.
final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    return image.path;
  } else {
    return null;
  }
}
Future<String?> pickImageFromCamera() async {
  final ImagePicker picker = ImagePicker();
// Pick an image.
final XFile? image = await picker.pickImage(source: ImageSource.camera);
  if (image != null) {
    return image.path;
  } else {
    return null;
  }
}