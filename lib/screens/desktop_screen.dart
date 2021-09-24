import 'package:facebook_responsive_ui/components/component.dart';
import 'package:facebook_responsive_ui/components/contacts_list.dart';
import 'package:facebook_responsive_ui/data/data.dart';
import 'package:facebook_responsive_ui/models/models.dart';
import 'package:flutter/material.dart';


class DesktopScreen extends StatelessWidget {
  final TrackingScrollController trackingScrollController ;
  const DesktopScreen({Key key, @required this.trackingScrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: MoreOptions(
                currentUser: currentUser,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 600,
          child: CustomScrollView(
            controller: trackingScrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(top: 20 , bottom: 10),
                sliver: SliverToBoxAdapter(
                  child: StoryComponents(
                    stories: stories,
                    currentUser: currentUser,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: CreatePostContainer(currentUser: currentUser),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(top: 10 , bottom: 5.0),
                sliver: SliverToBoxAdapter(
                  child: Rooms(onlineUsers: onlineUsers),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final Post post = posts[index];
                    return PostCard(
                      posts: post,
                    );
                  },
                  childCount: posts.length,
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ContactsList(onlineUsers: onlineUsers,),
            ),
          ),
        ),
      ],
    );
  }
}
