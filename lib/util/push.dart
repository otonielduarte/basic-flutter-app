import 'package:flutter/material.dart';

Future push(BuildContext context, Widget widget) async {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (BuildContext routeContext) => widget,
    ),
  );
}
