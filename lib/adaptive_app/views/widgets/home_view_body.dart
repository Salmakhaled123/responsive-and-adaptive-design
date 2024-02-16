import 'package:flutter/material.dart';
import 'package:responsive_course/adaptive_app/views/widgets/adaptive_layout.dart';
import 'package:responsive_course/adaptive_app/views/widgets/tablet_layout.dart';
import '../../../main.dart';
import 'desktop_layout.dart';
import 'mobile_layout.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // this widget builder is lazy building means that the object not created
    //until it is called
    return AdaptiveLayout(
        mobileLayout: (context) => const MobileLayout(),
        tabletLayout: (context) => const TabletLayout(),
        desktopLayout: (context) => const DesktopLayout());
  }
}
