import 'package:flutter/material.dart';

import '../widget_style.dart';

class CardButton extends StatelessWidget {
  const CardButton({
    super.key,
    required this.onPressed,
    required this.iconData,
  });
  final VoidCallback onPressed;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: onTap,
      elevation: 8,
      shape: CircleBorder(),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(iconData, color: grey),
      ),
    );
  }
}
