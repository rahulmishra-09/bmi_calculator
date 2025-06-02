import 'package:flutter/material.dart';

class ContainerData extends StatelessWidget {
  const ContainerData({
    super.key,
    required this.child,
    this.width,
    required this.bgColor,
  });
  final Widget child;
  final double? width;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
