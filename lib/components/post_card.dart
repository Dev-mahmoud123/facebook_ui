import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_responsive_ui/components/component.dart';
import 'package:facebook_responsive_ui/config/palette.dart';
import 'package:facebook_responsive_ui/models/models.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostCard extends StatelessWidget {
  final Post posts;

  const PostCard({
    Key key,
    this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ResponsiveUi.isDesktop(context);
    return Card(
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ) : null,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PostHeader(
                    post: posts,
                  ),
                  Text(
                    posts.caption,
                  ),
                  posts.imageUrl != null
                      ? const SizedBox.shrink()
                      : const SizedBox(
                          height: 6.0,
                        ),
                ],
              ),
            ),
            posts.imageUrl != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CachedNetworkImage(
                      imageUrl: posts.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: PostStatus(
                post: posts,
              ),
            ),
            const Divider(height: 5.0,thickness: 0.8, color: Colors.black12,),
            const PostButtons(),
          ],
        ),
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  final Post post;

  const PostHeader({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(
          imageUrl: post.user.imageUrl,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} . ',
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12,
                  )
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz_rounded),
        ),
      ],
    );
  }
}

class PostStatus extends StatelessWidget {
  final Post post;

  const PostStatus({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
          decoration: const BoxDecoration(
              color: Palette.facebookBlue, shape: BoxShape.circle),
          child: const Icon(
            Icons.thumb_up,
            color: Colors.white,
            size: 10.0,
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Expanded(
          child: Text(
            '${post.likes.toString()} Like',
            style: const TextStyle(color: Colors.black),
          ),
        ),
        Text(
          '${post.comments.toString()} Comments',
          style: const TextStyle(color: Colors.black),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          '${post.shares.toString()} Shares',
          style: const TextStyle(color: Colors.black),
        )
      ],
    );
  }
}

class PostButtons extends StatelessWidget {
  const PostButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextButton.icon(
              onPressed: () {},
              icon: Icon(
               MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
              ),
              label: Text('Like',
                  style: TextStyle(
                    color: Colors.grey[600],
                  )),
            ),
          ), 
          Expanded(
            child: TextButton.icon(
              onPressed: () {},
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
              ),
              label: Text(
                'Comment',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton.icon(
              onPressed: () {},
              icon: Icon(
                MdiIcons.shareOutline,
                size: 30,
                color: Colors.grey[600],
              ),
              label: Text(
                'Share',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
