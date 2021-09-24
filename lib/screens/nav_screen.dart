import 'package:facebook_responsive_ui/components/component.dart';
import 'package:facebook_responsive_ui/data/data.dart';
import 'package:facebook_responsive_ui/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget>screens = [
     HomePage(),
     const Scaffold(),
     const Scaffold(),
     const Scaffold(),
     const Scaffold(),
     const Scaffold(),
  ];

  final List<IconData>icons = const[
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size preferredSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: icons.length,
      child: Scaffold(
        appBar: ResponsiveUi.isDesktop(context) ? PreferredSize(
          preferredSize: Size(preferredSize.width , 100.0),
          child: CustomAppBar(
            currentUser: currentUser,
            selectedIndex: selectedIndex,
            icons: icons,
            onTap: (index)=>setState(()=>selectedIndex = index),
          ),
        ) :null,
        body:IndexedStack(
          index:selectedIndex,
          children: screens,
        ),
       bottomNavigationBar: !ResponsiveUi.isDesktop(context)?  CustomTabBar(
         icons: icons,
         selectedIndex: selectedIndex,
         onTap: (index)=>setState(()=>selectedIndex = index),
       ) : const SizedBox.shrink(),
      ),
    );
  }
}
