import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';

class CardActions extends StatelessWidget {
  const CardActions({
    super.key,
    required this.iconImage,
  });
  final String iconImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: Column(
        children: [
                IconButton(
                  icon: SvgPicture.asset(
                    iconImage,
                  ),
                  onPressed: () {},
                ),
          SizedBox(height: 0),
          IconButton(
            icon: Icon(Icons.check_circle_outline_outlined,
                color: AppColors.green),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
