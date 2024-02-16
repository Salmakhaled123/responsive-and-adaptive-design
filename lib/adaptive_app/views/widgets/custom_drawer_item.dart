import 'package:flutter/material.dart';
import 'package:responsive_course/adaptive_app/models/drawer_item_model.dart';

class CustomDrawerItem extends StatelessWidget {
  const CustomDrawerItem({Key? key, required this.drawerItemModel})
      : super(key: key);
  final DrawerItemModel drawerItemModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(drawerItemModel.icon),
      title: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Text(drawerItemModel.title)),
      ),
    );
  }
}
