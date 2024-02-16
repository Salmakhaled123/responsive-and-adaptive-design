import 'package:flutter/material.dart';

import 'custom_sliver_grid.dart';
import 'custom_sliver_listview.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
          CustomSliverGrid(),
          CustomSliverListView()
        ],
      ),
    );
  }
}
