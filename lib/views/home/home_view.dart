import 'package:chit_chat/materials/colors.dart';
import 'package:chit_chat/views/home/home_controller.dart';
import 'package:chit_chat/views/home/page/calls/calls_view.dart';
import 'package:chit_chat/views/home/page/chats/chats_view.dart';
import 'package:chit_chat/views/home/page/contacts/contacts_view.dart';
import 'package:chit_chat/views/home/page/feeds/feeds_view.dart';
import 'package:chit_chat/views/home/page/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: Scaffold(
        body: Obx(() {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: IndexedStack(index: controller.tabIndex.value, children: [
              ChatsView(),
              CallsView(),
              FeedsView(),
              ContactsView(),
              ProfileView()
            ]),
          );
        }),
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: badges.Badge(
                    child: Icon(Icons.chat_outlined),
                    position: badges.BadgePosition.topEnd(),
                    badgeStyle: badges.BadgeStyle(
                      padding: EdgeInsets.zero,
                      badgeColor: MyColors.secondary,
                    ),
                    badgeContent: Container(
                      width: 18,
                      height: 18,
                      child: Center(
                        child: Text('99+',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w800)),
                      ),
                    ),
                  ),
                  label: 'Chats',
                  activeIcon: badges.Badge(
                    child: Icon(Icons.chat_rounded),
                    position: badges.BadgePosition.topEnd(),
                    badgeStyle: badges.BadgeStyle(
                      padding: EdgeInsets.zero,
                      badgeColor: MyColors.secondary,
                    ),
                    badgeContent: Container(
                      width: 18,
                      height: 18,
                      child: Center(
                        child: Text('99+',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w800)),
                      ),
                    ),
                  )),
              BottomNavigationBarItem(
                  icon: badges.Badge(
                    child: Icon(Icons.call_outlined),
                    position: badges.BadgePosition.topEnd(),
                    badgeStyle: badges.BadgeStyle(
                      padding: EdgeInsets.zero,
                      badgeColor: MyColors.secondary,
                    ),
                    badgeContent: Container(
                      width: 18,
                      height: 18,
                      child: Center(
                        child: Text('7',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w800)),
                      ),
                    ),
                  ),
                  label: 'Calls',
                  activeIcon: badges.Badge(
                    child: Icon(Icons.call_rounded),
                    position: badges.BadgePosition.topEnd(),
                    badgeStyle: badges.BadgeStyle(
                      padding: EdgeInsets.zero,
                      badgeColor: MyColors.secondary,
                    ),
                    badgeContent: Container(
                      width: 18,
                      height: 18,
                      child: Center(
                        child: Text('7',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w800)),
                      ),
                    ),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.feed_outlined),
                  label: 'Feeds',
                  activeIcon: Icon(Icons.feed_rounded)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.contact_page_outlined),
                  label: 'Contacts',
                  activeIcon: Icon(Icons.contact_page_rounded)),
              BottomNavigationBarItem(
                  icon: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person_outline_rounded,
                          color: Colors.black)),
                  label: 'Profile',
                  activeIcon: CircleAvatar(
                      radius: 15,
                      backgroundColor: MyColors.primary,
                      child: CircleAvatar(
                        radius: 13,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person_outline_rounded,
                            color: Colors.black),
                      ))),
            ],
            iconSize: 30,
            backgroundColor: Colors.grey.shade200,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: MyColors.primary,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex.value,
          );
        }),
      ),
    );
  }
}
