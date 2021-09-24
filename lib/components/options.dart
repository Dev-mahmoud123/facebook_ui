import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const Options({
    Key key,
    @required this.icon,
    @required this.color,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Icon(icon, color: color, size: 30.0),
          const SizedBox(
            width: 6.0,
          ),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16.0),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
