import 'package:flutter/material.dart';
import 'package:responsive_course/adaptive_app/views/widgets/custom_list.dart';
import 'package:responsive_course/adaptive_app/views/widgets/custom_sliver_listview.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: SizedBox(height: 16),
      ),
      CustomList(),
      CustomSliverListView()
    ]);
  }
}
