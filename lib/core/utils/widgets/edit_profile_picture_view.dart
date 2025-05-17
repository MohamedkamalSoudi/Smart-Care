import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'add_image_button.dart';
import 'custom_view_appbar.dart';
import 'image_controller.dart';
import 'image_tile.dart';

class EditProfilePicturePage extends StatefulWidget {
  const EditProfilePicturePage({super.key});
  static const id = "EditProfilePicturePage";

  @override
  State<EditProfilePicturePage> createState() => _EditProfilePicturePageState();
}

class _EditProfilePicturePageState extends State<EditProfilePicturePage> {
  final imageController = ImageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customViewAppbar(context, "Edit Profile Picture"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            AddImageButton(onTap: () => _showImagePickerDialog(context)),
            ...imageController.selectedImages.map(
              (image) => ImageTile(
                image: image,
                onRemove: () {
                  setState(() => imageController.removeImage(image));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showImagePickerDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Camera"),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text("Gallery"),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final picked = await imageController.pickImage(source);
    if (picked) setState(() {});
  }
}
