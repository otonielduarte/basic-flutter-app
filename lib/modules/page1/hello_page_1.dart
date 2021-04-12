import 'package:basic/modules/page1/model/dog.dart';
import 'package:basic/shared/widgets/image/image.dart';
import 'package:flutter/material.dart';

class HelloPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello page 1',
        ),
      ),
      body: _body(),
    );
  }

  _body() {
    final dogs = _listDog();
    return ListView.builder(
        itemCount: dogs.length,
        itemExtent: 250,
        itemBuilder: (BuildContext context, int index) {
          Dog dog = dogs[index];
          return _stack(dog);
        });
  }

  _stack(Dog dog) {
    return Stack(
      fit: StackFit.expand,
      children: _stackItem(dog),
    );
  }

  _stackItem(Dog dog) {
    return [
      CustomImage(dog.image),
      Text(
        dog.name,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      )
    ];
  }

  _body2() {
    final images = _listImages();
    return ListView.builder(
        itemCount: images.length,
        itemExtent: 250,
        itemBuilder: (BuildContext context, int index) {
          return images[index];
        });
  }

  ListView _staticList() {
    return ListView(
      itemExtent: 250,
      children: _listImages(),
    );
  }

  List<Dog> _listDog() {
    return [
      Dog("Jack Russel", "dog1.png"),
      Dog("Labrador", "dog2.png"),
      Dog("Pug", "dog3.png"),
      Dog("Rottweiler", "dog4.png"),
      Dog("Paster", "dog5.png"),
    ];
  }

  List<Widget> _listImages() {
    return [
      CustomImage("dog1.png"),
      CustomImage("dog2.png"),
      CustomImage("dog3.png"),
      CustomImage("dog4.png"),
      CustomImage("dog5.png"),
    ];
  }
}
