import 'package:basic/models/dog.dart';
import 'package:basic/widgets/widgets/image/image.dart';
import 'package:flutter/material.dart';

class DogDetails extends StatelessWidget {
  final Dog dog;

  const DogDetails(this.dog);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello page 2 ${dog.name}',
        ),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: EdgeInsets.all(4),
        child: CustomImage(dog.image),
      ),
    );
  }
}
