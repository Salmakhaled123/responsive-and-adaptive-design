import 'package:flutter/material.dart';

import 'custom_item2.dart';

class CustomSliverListView extends StatelessWidget {
  const CustomSliverListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(top: 16),
            child: CustomItem2(),
          );
        });
  }
}
