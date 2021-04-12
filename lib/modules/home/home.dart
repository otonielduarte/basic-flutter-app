import 'package:basic/modules/home/widget/drawer_list.dart';
import 'package:basic/modules/page1/page1.dart';
import 'package:basic/modules/page2/hello_page_2.dart';
import 'package:basic/modules/page3/hello_page_3.dart';
import 'package:basic/shared/util/push.dart';
import 'package:basic/shared/widgets/button/button.dart';
import 'package:basic/shared/widgets/image/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatelessWidget {
  const Home({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Hello Flutter',
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Body 1",
              ),
              Tab(
                text: "Body 2",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _body(context),
            _buttons(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => print("floating"),
          child: Icon(Icons.add),
        ),
        drawer: DrawerList(),
      ),
    );
  }

  _body(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: _column(context),
      ),
    );
  }

  _buttons() {
    return Builder(builder: (BuildContext context) {
      return Column(
        children: [
          _row1(context),
          _row2(context),
        ],
      );
    });
  }

  Column _column(BuildContext context) {
    return Column(
      children: <Widget>[
        /* _text(),
        _pageView(),
        _buttons(context), */
        _container(context),
      ],
    );
  }

  Container _container(context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        children: [
          _text(),
          _pageView(),
          _buttons(),
        ],
      ),
    );
  }

  Row _row1(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CustomButtom("ListView", () => push(context, Page1())),
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
        CustomButtom("Snack", () => _onClickSnack(context)),
        CustomButtom("Dialog", () => _onClickDialog(context)),
        CustomButtom("Toast", _onClickToast)
      ],
    );
  }

  _pageView() {
    return Container(
      height: 300,
      margin: EdgeInsets.only(left: 8, right: 8),
      child: PageView(
        children: [
          CustomImage("dog1.png"),
          CustomImage("dog2.png"),
          CustomImage("dog3.png"),
          CustomImage("dog4.png"),
          CustomImage("dog5.png"),
        ],
      ),
    );
  }

  Text _text() {
    return Text(
      "Hello word",
      style: TextStyle(
        color: Colors.blue,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.amber,
        decorationStyle: TextDecorationStyle.dotted,
      ),
    );
  }

  _onClickSnack(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(_snackBar());
  }

  SnackBar _snackBar() {
    return SnackBar(
      content: Text("Hello I'm a snackBar"),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () => print('oi'),
      ),
    );
  }

  _onClickDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext dialigContext) => _alertDialog(context));
  }

  AlertDialog _alertDialog(BuildContext context) {
    return AlertDialog(
      title: Text("I'm learning Flutter, flutter is easy!"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Ok'),
        ),
      ],
    );
  }

  _onClickToast() {
    Fluttertoast.showToast(
      msg: "Hi, I'm learning Flutter! I'm arrived to success",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black38,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
