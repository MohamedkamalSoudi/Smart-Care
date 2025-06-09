import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageTile extends StatelessWidget {
  final XFile? image;
  final VoidCallback onRemove;
  final String? imageLink;

  const ImageTile({
    super.key,
    this.image,
    required this.onRemove,
    this.imageLink,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: imageLink != null
                  ? NetworkImage(imageLink!) as ImageProvider
                  : FileImage(File(image!.path)),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Positioned(
        //   top: 4,
        //   right: 4,
        //   child: GestureDetector(
        //     onTap: onRemove,
        //     child: Container(
        //       padding: const EdgeInsets.all(4),
        //       decoration: const BoxDecoration(
        //         shape: BoxShape.circle,
        //         color: Colors.white,
        //       ),
        //       child: const Icon(Icons.close, size: 16),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
