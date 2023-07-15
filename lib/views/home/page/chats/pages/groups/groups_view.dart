import 'package:chit_chat/materials/colors.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class GroupsView extends StatelessWidget {
  const GroupsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {},
            leading: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.groups_outlined, color: Colors.black)),
            title: const Text('Group Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),),
            subtitle: const Text('Contact Name : Massage...'),
            trailing: Column(
              children: [
                Text('10.10'),
                badges.Badge(
                  position: badges.BadgePosition.center(),
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: MyColors.secondary,
                  ),
                  badgeContent: Text('1',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w800)),
                ),
              ],
            ),
          );
        });
  }
}
