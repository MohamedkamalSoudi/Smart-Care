import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_care_app/core/utils/widgets/image_controller.dart';

import '../../managers/cubit/edit_profile_cubit.dart';

class CustomImagePickerDialog extends StatefulWidget {
  const CustomImagePickerDialog({super.key, required this.imageController, required this.rebuild, required this.testId});
    final ImageController imageController ;
    final Function() rebuild;
    final int testId;

  @override
  State<CustomImagePickerDialog> createState() => _CustomImagePickerDialogState();
}

class _CustomImagePickerDialogState extends State<CustomImagePickerDialog> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Camera"),
                onTap: ()async {
                  await _pickImage(ImageSource.camera);
                  widget.rebuild();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Gallery"),
                onTap: () async {
                  await _pickImage(ImageSource.gallery);
                  widget.rebuild();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
  }

  Future<void> _pickImage(ImageSource source) async {
    final picked = await widget.imageController.pickImage(source);
    if (picked) {
      log('تم  الصورة بنجاح');
      await context.read<EditProfileCubit>(). editImage(
        results: "soudi",
        image: File(widget.imageController.selectedImages.last.path),
        status: "completed", testId: widget.testId,
      );
      log('تم رفع الصورة بنجاح');
    }
  }
}