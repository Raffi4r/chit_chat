import 'package:chit_chat/materials/colors.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class FeedsView extends StatelessWidget {
  const FeedsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person_outline_rounded, color: Colors.black)),
          ),
          actions: [
            badges.Badge(
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                ),
                splashRadius: 20,
              ),
              position: badges.BadgePosition.custom(start: 25, top: 7),
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
          backgroundColor: Colors.grey.shade200,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text(
            'Feeds',
            style: TextStyle(
                fontSize: 24, color: Colors.black, fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              TextFormField(
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: 'Write a post...',
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              ),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.emoji_emotions_outlined,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Emoji')
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                    onTap: () {},
                  )),
                  Expanded(
                      child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.photo_outlined,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Photo')
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                    onTap: () {},
                  )),
                  Expanded(
                      child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Camera')
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                    onTap: () {},
                  )),
                ],
              ),
              Container(
                height: 10,
                color: Colors.grey[300],
              ),
              Feed(),
              Feed(),
              Feed(),
              Feed(),
              Feed(),
            ],
          ),
        ));
  }
}

class Feed extends StatelessWidget {
  const Feed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        onTap: () {},
        child: Ink(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  offset: Offset(
                    1.0,
                    2.0,
                  ))
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                onTap: () {},
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.person_outline_rounded,
                          color: Colors.black)),
                  title: Text('Contact Name',
                      style: TextStyle(fontWeight: FontWeight.w900)),
                  subtitle: Text('Today at 10.10 AM'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nunc nunc, viverra sit amet lacinia id, dapibus et sapien. Interdum et malesuada fames ac ante ipsum primis in faucibus. Phasellus ornare risus nisl, sed ullamcorper nisl rhoncus in. Aliquam erat volutpat. Morbi sed orci quis nulla aliquet iaculis. Nullam dolor arcu, lobortis eu neque eget, elementum efficitur ligula. Nam ac tellus ut nunc sollicitudin faucibus. Cras imperdiet nibh sed cursus tincidunt. In non egestas enim.',
                    textAlign: TextAlign.justify),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 0.2,
                color: Colors.grey,
              ),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.thumb_up_alt_outlined,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('9 Like')
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                    onTap: () {},
                  )),
                  Expanded(
                      child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.mode_comment_outlined,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('1 Comment')
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                    onTap: () {},
                  )),
                  Expanded(
                      child: InkWell(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.share_outlined,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Share')
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                    onTap: () {},
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
