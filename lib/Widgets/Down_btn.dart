import 'package:flutter/material.dart';

class DownButton extends StatelessWidget {
  const DownButton({
    super.key,
    required this.btnName,
    required this.onPressed,
  });
  final String btnName;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 11, right: 11, bottom: 2),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
          width: 2,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.black26,
      ),
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            btnName.toString(),
            style: const TextStyle(fontSize: 30, color: Colors.white),
          )),
    );
  }
}
