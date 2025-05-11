import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';

class CardActions extends StatelessWidget {
  const CardActions({
    super.key,
    required this.iconImage,
    required this.isDoc,
  });
  final String iconImage;
  final bool isDoc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: Column(
        children: [
          isDoc
              ? IconButton(
                  icon: SvgPicture.asset(
                    iconImage,
                  ),
                  onPressed: () {},
                )
              : IconButton(
                  icon: SvgPicture.asset(
                    'assets/images/ragb.svg',
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
