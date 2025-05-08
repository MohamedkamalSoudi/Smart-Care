import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';

class SearchBarTextField extends StatelessWidget {
  const SearchBarTextField({super.key, required this.onChanged});
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: const TextStyle(fontSize: 20, color: AppColors.grey100),
        suffixIcon: IconButton(
          padding: const EdgeInsets.only(right: 20),
          onPressed: () {},
          icon: const Opacity(
            opacity: .8,
            child: Icon(Icons.search, size: 30, color: AppColors.grey100),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grey100, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
