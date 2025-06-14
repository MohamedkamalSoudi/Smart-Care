import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConnectionStatusActions extends StatelessWidget {
  final bool isToggled;
  final VoidCallback onToggle;
  final VoidCallback onFirstIconPressed;

  const ConnectionStatusActions({
    super.key,
    required this.isToggled,
    required this.onToggle,
    required this.onFirstIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: SvgPicture.asset('assets/images/Vector.svg'),
          onPressed: onFirstIconPressed,
        ),
        const SizedBox(height: 0),
        Padding(
          padding: const EdgeInsets.all(12),
          child: isToggled
            ? Icon(
                Icons.check_circle_outline_outlined,
                color: Colors.green,
                size: 25,
              )
            : SvgPicture.asset('assets/images/wate.svg'),
        ),
      ],
    );
  }
}
