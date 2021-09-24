
import 'package:facebook_responsive_ui/components/component.dart';
import 'package:facebook_responsive_ui/components/options.dart';
import 'package:facebook_responsive_ui/config/palette.dart';
import 'package:facebook_responsive_ui/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MoreOptions extends StatelessWidget {
  final User currentUser;
  
  const MoreOptions({Key key,@required this.currentUser}) : super(key: key);
  
  final List<List> moreOptions = const[
    [MdiIcons.shieldAccount, Colors.deepPurple, 'COVID-19 Info Center'],
    [MdiIcons.accountMultiple, Colors.cyan, 'Friends'],
    [MdiIcons.facebookMessenger, Palette.facebookBlue, 'Messenger'],
    [MdiIcons.flag, Colors.orange, 'Pages'],
    [MdiIcons.storefront, Palette.facebookBlue, 'Marketplace'],
    [Icons.ondemand_video, Palette.facebookBlue, 'Watch'],
    [MdiIcons.calendarStar, Colors.red, 'Events'],
  ];
  

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:const BoxConstraints(maxWidth: 280.0) ,
      child: ListView.builder(
        itemCount: moreOptions.length +1,
        itemBuilder: (context , index){
          if(index == 0){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CardUser(user: currentUser,),
            );
          }
          final List option  = moreOptions[index -1];
           return Padding(
             padding: const EdgeInsets.symmetric(vertical: 8.0),
             child: Options(
               icon: option[0],
               color: option[1],
               text: option[2],
             ),
           );
        },),
    );
  }
}
