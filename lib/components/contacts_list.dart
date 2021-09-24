import 'package:facebook_responsive_ui/components/component.dart';
import 'package:facebook_responsive_ui/models/models.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  final List<User> onlineUsers;
  const ContactsList({Key key, @required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280.0),
      child: Column(
        children: [
         Row(
           children: [
             Expanded(
               child: Text(
                 'Contacts',
                 style: TextStyle(
                   color: Colors.grey[600],
                   fontSize: 18.0,
                   fontWeight: FontWeight.w500,
                 ),
               ),
             ),
             Icon(
               Icons.search ,
               color: Colors.grey[600],
             ),
             const SizedBox(width: 10.0,),
             Icon(
               Icons.more_horiz ,
               color: Colors.grey[600],
             ),
           ],
         ),
          Expanded(
            child: ListView.builder(
              padding:const EdgeInsets.symmetric(vertical: 8.0) ,
               itemCount: onlineUsers.length,
                itemBuilder: (context , index){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CardUser(
                    user: onlineUsers[index],
                  ),
                );
            }),
          )

        ],
      ),
    );
  }
}
