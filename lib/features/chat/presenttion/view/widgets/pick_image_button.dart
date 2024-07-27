import 'package:flutter/material.dart';

class PickImageButton extends StatefulWidget {
  const PickImageButton({super.key});

  @override
  State<PickImageButton> createState() => _PickImageButtonState();
}

class _PickImageButtonState extends State<PickImageButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const Icon(Icons.camera_alt_outlined),
    );
  }
}
