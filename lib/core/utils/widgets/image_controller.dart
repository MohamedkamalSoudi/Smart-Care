import 'package:image_picker/image_picker.dart';

class ImageController {
  final List<XFile> selectedImages = [];
  final ImagePicker _picker = ImagePicker();

  Future<bool> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      selectedImages.add(pickedFile);
      return true;
    }
    return false;
  }

  void removeImage(XFile image) {
    selectedImages.remove(image);
  }
}
