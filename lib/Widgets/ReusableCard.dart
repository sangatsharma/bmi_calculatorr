import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key,
    required this.colour,
    required this.childContent,
  });
  final Color colour;
  final Widget childContent;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(8),
      ),
      child: childContent,
    );
  }
}
