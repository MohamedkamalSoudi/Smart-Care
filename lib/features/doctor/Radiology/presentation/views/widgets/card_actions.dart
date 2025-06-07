import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardActions extends StatelessWidget {
  const CardActions({
    super.key,
    required this.iconImage,
    required this.isDone,
    required this.onDeletePressed,
  });

  final String iconImage;
  final bool isDone;
  final VoidCallback onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: SvgPicture.asset(iconImage),
            onPressed: onDeletePressed,
          ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: isDone
                ? Icon(
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
          ),
        ],
      ),
    );
  }
}
