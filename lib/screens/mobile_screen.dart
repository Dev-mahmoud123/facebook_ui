import 'package:facebook_responsive_ui/components/component.dart';
import 'package:facebook_responsive_ui/config/palette.dart';
import 'package:facebook_responsive_ui/data/data.dart';
import 'package:facebook_responsive_ui/models/models.dart';
import 'package:facebook_responsive_ui/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MobileScreen extends StatelessWidget {
  final TrackingScrollController trackingScrollController ;
  const MobileScreen({Key key, @required this.trackingScrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: trackingScrollController,
      slivers: [
        SliverAppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark),
          centerTitle: false,
          backgroundColor: Colors.white,
          title: const Text(
            'facebook',
            style: TextStyle(
                letterSpacing: -1.2,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Palette.facebookBlue),
          ),
          floating: true,
          actions: [
            CircleIconButton(icon: Icons.search, size: 25, onPressed: () {}),
            CircleIconButton(
                icon: MdiIcons.facebookMessenger, size: 25, onPressed: () {}),
          ],
        ),
        const SliverToBoxAdapter(
          child: CreatePostContainer(currentUser: currentUser),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: StoryComponents(
              stories: stories,
              currentUser: currentUser,
            ),
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
    );
  }
}
