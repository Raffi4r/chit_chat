import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

import '../../../../materials/colors.dart';

class ChatsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var isSearchOpen = false.obs;

  final List<Widget> myTabs = <Widget>[
    Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Messages',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          SizedBox(
            width: 5,
          ),
          badges.Badge(
            position: badges.BadgePosition.center(),
            badgeStyle: badges.BadgeStyle(
              badgeColor: MyColors.secondary,
            ),
            badgeContent: Text('17',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w800)),
          )
        ],
      ),
    ),
    Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Groups',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          SizedBox(
            width: 5,
          ),
          badges.Badge(
            position: badges.BadgePosition.center(),
            badgeStyle: badges.BadgeStyle(
              badgeColor: MyColors.secondary,
            ),
            badgeContent: Text('103',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w800)),
          )
        ],
      ),
    ),
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
