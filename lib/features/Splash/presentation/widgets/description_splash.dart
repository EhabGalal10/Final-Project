import 'package:flutter/material.dart';

class DescriptionSplash extends StatelessWidget {
  const DescriptionSplash({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "AI-Powered Brain MRI Analysis",
      style: TextStyle(fontSize: 24, color: Color(0xff4a78b8)),
    );
  }
}