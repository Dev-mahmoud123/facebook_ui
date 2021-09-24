import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_responsive_ui/components/component.dart';
import 'package:facebook_responsive_ui/models/user_model.dart';
import 'package:facebook_responsive_ui/widgets/text_button_icon.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({Key key, @required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUi.isDesktop(context);
    return Card(
      shape: isDesktop? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ) : null,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage:
                      CachedNetworkImageProvider(currentUser.imageUrl),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration.collapsed(
                      hintText: 'What\'s on your mind?',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Divider(
              color: Colors.black12,
              height: 10.0,
              thickness: 0.5,
            ),
            SizedBox(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButtonIcon(
                    text: 'Live',
                    icon: Icons.videocam,
                    onPressed: () {},
                    color: Colors.red,
                  ),
                  const VerticalDivider(width: 8.0),
                  TextButtonIcon(
                    text: 'Photo',
                    icon: Icons.photo_library,
                    onPressed: () {},
                    color: Colors.green,
                  ),
                  const VerticalDivider(width: 8.0),
                  TextButtonIcon(
                    text: 'Room',
                    icon: Icons.video_call,
                    onPressed: () {},
                    color: Colors.purpleAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
