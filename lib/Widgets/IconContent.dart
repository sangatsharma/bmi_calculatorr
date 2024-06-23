import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({super.key, required this.getIcon, required this.getText});
  final IconData getIcon;
  final String getText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          getIcon,
          size: 70,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          getText,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        )
      ],
    );
  }
}
