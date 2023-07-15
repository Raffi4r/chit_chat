import 'package:chit_chat/materials/colors.dart';
import 'package:chit_chat/views/home/page/chats/chats_controller.dart';
import 'package:chit_chat/views/home/page/chats/pages/groups/groups_view.dart';
import 'package:chit_chat/views/home/page/chats/pages/messages/messages_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatsView extends GetView<ChatsController> {
  ChatsView({Key? key}) : super(key: key);

  final chatC = Get.lazyPut<ChatsController>(() => ChatsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'Chats',
          style: TextStyle(
              fontSize: 24, color: Colors.black, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_outlined,
              color: Colors.black,
            ),
            splashRadius: 20,
          )
        ],
      ),
      body: DefaultTabController(
        length: controller.myTabs.length,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: MyColors.primary, width: 1),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade300),
                child: TabBar(
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: MyColors.primary),
                  splashBorderRadius: BorderRadius.circular(50),
                  unselectedLabelColor: Colors.grey.shade700,
                  labelColor: Colors.black,
                  controller: controller.controller,
                  tabs: controller.myTabs,
                ),
              ),
            ),
            Expanded(
                child: TabBarView(
                    controller: controller.controller,
                    children: [MessagesView(), GroupsView()]))
          ],
        ),
      ),
    );
  }
}
