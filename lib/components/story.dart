import 'package:facebook_responsive_ui/components/story_card.dart';
import 'package:facebook_responsive_ui/models/models.dart';
import 'package:flutter/material.dart';

class StoryComponents extends StatelessWidget {
  final List<Story> stories;
  final User currentUser;
  const StoryComponents({Key key, this.stories, this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount:1+ stories.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemBuilder: (context, index) {

          if (index == 0) {
            return StoryCard(
              image: currentUser.imageUrl,
              text: 'Add to Story',
              isAddStory: true,
            );
          }
          final Story story = stories[index -1];

          return StoryCard(
            image: story.user.imageUrl,
            text: story.user.name,
            hasBorder: story.isViewed,
          );
        },
      ),
    );
  }
}
