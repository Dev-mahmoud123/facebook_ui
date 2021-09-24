import 'package:facebook_responsive_ui/components/component.dart';
import 'package:facebook_responsive_ui/models/models.dart';
import 'package:flutter/material.dart';

class CardUser extends StatelessWidget {
  final User user;

  const CardUser({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageUrl: user.imageUrl),
          const SizedBox(
            width: 6.0,
          ),
          Flexible(
            child: Text(
              user.name,
              style: const TextStyle(fontSize: 16.0),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
