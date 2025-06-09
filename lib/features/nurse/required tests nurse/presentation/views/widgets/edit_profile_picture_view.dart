import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/widgets/add_image_button.dart';
import '../../../../../../core/utils/widgets/custom_view_appbar.dart';
import '../../../../../../core/utils/widgets/image_controller.dart';
import '../../../../../../core/utils/widgets/image_tile.dart';
import '../../managers/cubit/edit_profile_cubit.dart';
import 'custom_image_picker_dialog.dart';

class EditProfilePicturePage extends StatefulWidget {
  const EditProfilePicturePage({super.key, required this.testId});
  static const id = "EditProfilePicturePage";
  final int testId;

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
            AddImageButton(onTap: () => _showImagePickerDialog(context, rebuild: () { setState(() {}); }, testId: widget.testId,)),
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

  void _showImagePickerDialog(BuildContext context, {required Function() rebuild , required int testId}) {
    showModalBottomSheet(
      context: context,
      builder: (context) => BlocProvider(
        create: (context) => EditProfileCubit(),
        child: CustomImagePickerDialog(imageController: imageController, rebuild: rebuild, testId: testId,),
      ),
    );
  }

  
}

