import 'package:chit_chat/materials/colors.dart';
import 'package:flutter/material.dart';

class CallsView extends StatelessWidget {
  const CallsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text(
            'Calls',
            style: TextStyle(
                fontSize: 24, color: Colors.black, fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
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
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Ongoing Call',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                  ListTile(
                    tileColor: Colors.green.shade100,
                      onTap: () {},
                      leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Icon(Icons.person_outline_rounded,
                              color: Colors.black)),
                      title: const Text(
                        'Contact Name',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w900),
                      ),
                      subtitle: Text('Tap to back to call screen'),
                      trailing: Text('00:14:03'))
                ]),
            Expanded(
              child: ListView.builder(
                  itemCount: 17,
                  itemBuilder: (BuildContext context, int index) {
                    return index == 0
                        ? Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              'Recent',
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                          )
                        : ListTile(
                            onTap: () {},
                            leading: CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: Icon(Icons.person_outline_rounded,
                                    color: Colors.black)),
                            title: const Text(
                              'Contact Name',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w900),
                            ),
                            subtitle: Row(
                              children: [
                                const Icon(Icons.call_made_outlined,
                                    color: Colors.green, size: 15),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('30 minutes ago')
                              ],
                            ),
                            trailing: IconButton(
                                splashRadius: 20,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.call,
                                  color: Colors.green,
                                )));
                  }),
            ),
          ],
        ));
  }
}
