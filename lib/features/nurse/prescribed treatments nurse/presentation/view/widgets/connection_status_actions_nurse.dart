import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConnectionStatusActionsNurse extends StatelessWidget {
  final bool isToggled;
  final VoidCallback onToggle;

  const ConnectionStatusActionsNurse({
    super.key,
    required this.isToggled,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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