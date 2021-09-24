import 'package:flutter/material.dart';

class TextButtonIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onPressed;
  final Color color;

  const TextButtonIcon(
      {Key key,
      @required this.text,
      @required this.icon,
      @required this.onPressed,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color,
      ),
      label:  Text(text),
    );
  }
}
