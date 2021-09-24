import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_responsive_ui/components/component.dart';
import 'package:facebook_responsive_ui/config/palette.dart';
import 'package:facebook_responsive_ui/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  final String image;
  final String text;
  final bool isAddStory;
  final bool hasBorder;

  const StoryCard(
      {Key key,
      this.image,
      this.text,
      this.isAddStory = false,
      this.hasBorder = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: image,
            width: 110,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        isAddStory
            ? CircleIconButton(
                icon: Icons.add,
                size: 30,
                onPressed: () {},
              )
            : Positioned(
                top: 8.0,
                left: 8.0,
                child: ProfileAvatar(
                  imageUrl: image,
                  hasBorder: hasBorder,
                ),
              ),
        Positioned(
          bottom: 0.0,
          right: 8.0,
          left: 8.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold  ),
            ),
          ),
        )
      ],
    );
  }
}
