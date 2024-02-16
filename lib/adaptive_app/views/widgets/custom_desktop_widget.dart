import 'package:flutter/material.dart';
import 'package:responsive_course/adaptive_app/views/widgets/custom_item.dart';
import 'package:responsive_course/adaptive_app/views/widgets/custom_item2.dart';

class CustomDesktopWidget extends StatelessWidget {
  const CustomDesktopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(flex: 2, child: CustomItem()),
        SizedBox(
          height: 16,
        ),
        Expanded(child: CustomItem2())
      ],
    );
  }
}
