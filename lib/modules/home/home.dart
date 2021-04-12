import 'package:basic/modules/page1/hello_page_1.dart';
import 'package:basic/modules/page2/hello_page_2.dart';
import 'package:basic/modules/page3/hello_page_3.dart';
import 'package:basic/shared/util/push.dart';
import 'package:basic/shared/widgets/button/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello Flutter',
        ),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: _column(context),
      ),
    );
  }

  _buttons(BuildContext context) {
    return Column(
      children: [
        _row1(context),
        _row2(context),
      ],
    );
  }

  Column _column(BuildContext context) {
    return Column(
      children: <Widget>[
        _text(),
        _pageView(),
        _buttons(context),
        _container(context)
      ],
    );
  }

  Container _container(context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 20),
      color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _text(),
          _pageView(),
          _buttons(context),
        ],
      ),
    );
  }

  Row _row1(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CustomButtom("ListView", () => push(context, HelloPage1())),
        CustomButtom("Page 2", () => push(context, HelloPage2())),
        CustomButtom("Page 3", () => push(context, HelloPage3()))
      ],
    );
  }

  Row _row2(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomButtom("Snack", _onClickSnack),
        CustomButtom("Dialog", _onClickDialog),
        CustomButtom("Toast", _onClickToast)
      ],
    );
  }

  _pageView() {
    return Container(
      height: 300,
      margin: EdgeInsets.all(20),
      child: PageView(
        children: [
          _image("dog1.png"),
          _image("dog2.png"),
          _image("dog3.png"),
          _image("dog4.png"),
          _image("dog5.png"),
        ],
      ),
    );
  }

  _image(String imageName) {
    return Image.asset(
      'assets/images/$imageName',
    );
    /* return Image.network(
      "https://uploads-ssl.webflow.com/5cac6236f8d44ddee118d97c/5e666d594f66c9c1e9c3ce74_LogoRGB2.png",
      semanticLabel: "Imagem logo marca da zup",
    ); */
  }

  Text _text() {
    return Text(
      "Hello word",
      style: TextStyle(
        color: Colors.blue,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.amber,
        decorationStyle: TextDecorationStyle.dotted,
      ),
    );
  }

  _onClickSnack() {
    print('snack');
  }

  _onClickDialog() {
    print('Dialog');
  }

  _onClickToast() {
    print('Toast');
  }
}
