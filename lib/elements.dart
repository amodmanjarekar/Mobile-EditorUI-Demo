import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String labelText;
  const LabelText({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        labelText,
      ),
    );
  }
}
