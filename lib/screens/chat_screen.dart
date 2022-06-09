import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:letschat/screens/chats.dart';
import 'package:letschat/screens/peoples.dart';
import 'package:letschat/screens/profile.dart';

import 'settings.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Widget> screens = const [Chats(), Peoples(), Profile(), Setting()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble), label: 'Chats'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_2), label: 'Connections'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person), label: 'Profile'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings), label: 'Settings')
      ]),
      tabBuilder: (BuildContext context, int index) {
        return screens[index];
      },
    ));
  }
}
