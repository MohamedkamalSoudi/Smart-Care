import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardActions extends StatelessWidget {
  const CardActions({
    super.key,
    required this.iconImage,
    required this.isDone,
    required this.onUploadPressed,
    required this.onDonePressed,
  });

  final String iconImage;
  final bool isDone;
  final VoidCallback onUploadPressed;
  final VoidCallback onDonePressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: SvgPicture.asset(iconImage),
            onPressed: onUploadPressed,
          ),

          IconButton(
            icon: isDone
                ? const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 26,
                  )
                : SvgPicture.asset(
                    'assets/images/wate.svg',
                    color: Colors.orange,
                    width: 20,
                    height: 20,
                  ),
            onPressed: onDonePressed,
          ),
        ],
      ),
    );
  }
}
