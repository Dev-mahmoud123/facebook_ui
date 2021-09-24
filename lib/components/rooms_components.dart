import 'package:facebook_responsive_ui/components/component.dart';
import 'package:facebook_responsive_ui/models/user_model.dart';
import 'package:facebook_responsive_ui/widgets/widget.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({Key key, this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUi.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape:isDesktop? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ) : null,
      child: Container(
        height: 60,
          color: Colors.white,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            itemCount: onlineUsers.length + 1,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: CreateRoomButton(),
                );
              }
              final User user = onlineUsers[index - 1];
              return Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ProfileAvatar(
                      imageUrl: user.imageUrl,
                      isActive: true,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
    );
  }
}
