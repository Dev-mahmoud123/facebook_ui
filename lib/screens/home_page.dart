import 'package:facebook_responsive_ui/components/component.dart';
import 'package:facebook_responsive_ui/screens/screens.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TrackingScrollController trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: ResponsiveUi(
          mobile: MobileScreen(
            trackingScrollController: trackingScrollController,
          ),
          desktop: DesktopScreen(
            trackingScrollController: trackingScrollController,
          ),
        ),
      ),
    );
  }
}
