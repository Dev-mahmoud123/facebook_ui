import 'package:facebook_responsive_ui/components/card_user.dart';
import 'package:facebook_responsive_ui/components/component.dart';
import 'package:facebook_responsive_ui/config/palette.dart';
import 'package:facebook_responsive_ui/models/models.dart';
import 'package:facebook_responsive_ui/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomAppBar({
    Key key,
    @required this.currentUser,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0 , right:10),
      height: 65.0,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 2),
          blurRadius: 4.0,
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Text(
              'facebook',
              style: TextStyle(
                  letterSpacing: -1.2,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Palette.facebookBlue),
            ),
          ),
          SizedBox(
            width: 600,
            height: double.infinity,
            child: CustomTabBar(
                icons: icons, selectedIndex: selectedIndex, onTap: onTap),
          ),
           Expanded(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 CardUser(user: currentUser,),
                 const SizedBox(width: 12.0),
                 CircleIconButton(
                    icon: Icons.search, size: 25, onPressed: () {}),
                 CircleIconButton(
                     icon: MdiIcons.facebookMessenger,
                    size: 25,
                    onPressed: () {}),
              ],
             ),
           )
        ],
      ),
    );
  }
}
