import 'package:chit_chat/materials/colors.dart';
import 'package:flutter/material.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text(
            'Contacts',
            style: TextStyle(
                fontSize: 24, color: Colors.black, fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
              child: TextFormField(
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: MyColors.secondary,
                    ),
                  ),
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: Icon(Icons.search_outlined),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Search...",
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 17,
                  itemBuilder: (BuildContext context, int index) {
                    return index == 0
                        ? ListTile(
                            onTap: () {},
                            leading: CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Icon(Icons.group_add_outlined,
                                    color: MyColors.primary)),
                            title: const Text(
                              'New Group',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w900),
                            ),
                          )
                        : index == 1
                            ? ListTile(
                                onTap: () {},
                                leading: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: Icon(Icons.person_add_outlined,
                                        color: MyColors.primary)),
                                title: const Text(
                                  'New Contact',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                ),
                                trailing: IconButton(
                                    onPressed: () {},
                                    splashRadius: 20,
                                    icon: Icon(
                                      Icons.qr_code,
                                      color: MyColors.primary,
                                    )))
                            : index == 2
                                ? Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Text(
                                      'Chit Chat Contact',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900),
                                    ),
                                  )
                                : ListTile(
                                    onTap: () {},
                                    leading: CircleAvatar(
                                        backgroundColor: Colors.grey,
                                        child: Icon(
                                            Icons.person_outline_rounded,
                                            color: Colors.black)),
                                    title: const Text(
                                      'Contact Name',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    subtitle: Text('Contact Status'),
                                  );
                  }),
            ),
          ],
        ));
  }
}
