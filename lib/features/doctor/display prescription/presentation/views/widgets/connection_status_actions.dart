import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConnectionStatusActions extends StatelessWidget {
  final bool isToggled;
  final VoidCallback onToggle;

  const ConnectionStatusActions({
    super.key,
    required this.isToggled,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: SvgPicture.asset('assets/images/Vector.svg'),
          onPressed: () {},
        ),
        const SizedBox(height: 0),
        IconButton(
          icon: isToggled
              ? Icon(
                  Icons.check_circle_outline_outlined,
                  color: Colors.green,
                  size: 25,
                )
              : SvgPicture.asset('assets/images/wate.svg'),
          onPressed: onToggle,
        ),
      ],
    );
  }
}