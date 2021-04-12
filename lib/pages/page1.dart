import 'package:basic/models/dog.dart';
import 'package:basic/pages/dog_details.dart';
import 'package:basic/util/push.dart';
import 'package:basic/widgets/widgets/image/image.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  bool _listView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello page 1',
        ),
        actions: _navIcons(),
      ),
      body: _listView ? _bodyListView() : _bodyListGrid(),
    );
  }

  List<Widget> _navIcons() {
    return [
      IconButton(
        icon: Icon(Icons.list),
        onPressed: () => _setViewMode(true),
      ),
      IconButton(
        icon: Icon(Icons.grid_on),
        onPressed: () => _setViewMode(false),
      ),
    ];
  }

  _setViewMode(bool isListView) {
    setState(() {
      _listView = isListView;
    });
  }

  _bodyListGrid() {
    final dogs = _listDog();
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        mainAxisExtent: 250,
      ),
      itemCount: dogs.length,
      itemBuilder: (BuildContext context, int index) {
        Dog dog = dogs[index];
        return _gestureDetector(dog, context);
      },
    );
  }

  _bodyListView() {
    final dogs = _listDog();
    return ListView.builder(
      itemCount: dogs.length,
      itemExtent: 250,
      itemBuilder: (BuildContext context, int index) {
        Dog dog = dogs[index];
        return _gestureDetector(dog, context);
      },
    );
  }

  GestureDetector _gestureDetector(Dog dog, BuildContext context) {
    return GestureDetector(
      child: _stack(dog),
      onTap: () => push(
        context,
        DogDetails(dog),
      ),
    );
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
      _align(dog),
    ];
  }

  Align _align(Dog dog) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          dog.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  /* _body2() {
    final images = _listImages();
    return ListView.builder(
        itemCount: images.length,
        itemExtent: 250,
        itemBuilder: (BuildContext context, int index) {
          return images[index];
        });
  }

  _staticList() {
    return ListView(
      itemExtent: 250,
      children: _listImages(),
    );
  } */

  /* List<Widget> _listImages() {
    return [
      CustomImage("dog1.png"),
      CustomImage("dog2.png"),
      CustomImage("dog3.png"),
      CustomImage("dog4.png"),
      CustomImage("dog5.png"),
    ];
  } */

  List<Dog> _listDog() {
    return [
      Dog("Jack Russel", "dog1.png"),
      Dog("Labrador", "dog2.png"),
      Dog("Pug", "dog3.png"),
      Dog("Rottweiler", "dog4.png"),
      Dog("Paster", "dog5.png"),
    ];
  }
}
