import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final Function callback;
  final String buttonName;
  final Color color;
  final bool isDisabled;

  const CustomButtom(
    this.buttonName,
    this.callback, {
    this.color = Colors.blue,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          isDisabled ? Colors.grey.shade300 : color,
        ),
      ),
      child: Text(
        buttonName,
        style: TextStyle(
            color: isDisabled ? Colors.white.withOpacity(0.6) : Colors.white),
      ),
    );
  }

  void _onPressed() => isDisabled ? null : callback();
}
