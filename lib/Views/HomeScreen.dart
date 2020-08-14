import 'package:facebookflutter/Widgets/create_post_container.dart';
import 'package:facebookflutter/Widgets/rooms.dart';
import 'package:facebookflutter/Widgets/widgets.dart';
import 'package:facebookflutter/data/data.dart';
import 'package:facebookflutter/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:facebookflutter/config/palette.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              'facebook',
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            actions: [
              CircleButton(
                  icon: Icons.search,
                  iconSize: 30,
                  onPressed: () => print('Search Button Tapped')),
              CircleButton(
                  icon: MdiIcons.facebookMessenger,
                  iconSize: 30,
                  onPressed: () => print('Massenger Button Tapped')),
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: Rooms(
                onlineUsers: onlineUsers,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            sliver: SliverToBoxAdapter(
                child: Stories(
              currentUser: currentUser,
              stories: stories,
            )),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final Post post = posts[index];
                return PostContainer(post: post);
              },
              childCount: posts.length,
            ),
          )
        ],
      ),
    );
  }
}
