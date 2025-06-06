import 'package:flutter/material.dart';

class AddImageButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddImageButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.shade200,
        ),
        child: const Icon(Icons.image, size: 40, color: Colors.black),
      ),
    );
  }
}
