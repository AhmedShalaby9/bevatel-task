import 'package:flutter/material.dart';

class RecordAudioButton extends StatefulWidget {
  const RecordAudioButton({super.key});

  @override
  State<RecordAudioButton> createState() => _RecordAudioButtonState();
}

class _RecordAudioButtonState extends State<RecordAudioButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const Icon(Icons.mic_none),
    );
  }
}
