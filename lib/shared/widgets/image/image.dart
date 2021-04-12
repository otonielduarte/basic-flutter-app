import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imageName;
  const CustomImage(this.imageName);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/$imageName',
      fit: BoxFit.cover,
    );
  }
}
