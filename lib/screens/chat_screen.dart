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
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _screens = <Widget>[
      const Chats(),
      const Peoples(),
      const Profile(),
      const Setting()
    ];
    //final tabPages = <Widget>[const Center(child: Icon(Icons.chat_bubble)),const Center(child: Icon(Icons.people)),const Center(child: Icon(Icons.person )),const Center(child: Icon(Icons.settings)) ];
    final bottomNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.chat_bubble,
          color: Colors.blue,
        ),
        label: 'Chats',
      ),
      const BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.person_2,
            color: Colors.blue,
          ),
          label: 'Connections'),
      const BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.person,
            color: Colors.blue,
          ),
          label: 'Profile'),
      const BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.settings,
            color: Colors.blue,
          ),
          label: 'Settings')
    ];
    assert(_screens.length == bottomNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      fixedColor: Colors.black,
      selectedLabelStyle: const TextStyle(color: Colors.black),
      unselectedLabelStyle: const TextStyle(color: Colors.grey),
      items: bottomNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.shifting,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return Scaffold(
      // body: CupertinoTabScaffold(
      //   tabBar: CupertinoTabBar(items: const [
      // BottomNavigationBarItem(
      //     icon: Icon(CupertinoIcons.chat_bubble), label: 'Chats'),
      // BottomNavigationBarItem(
      //     icon: Icon(CupertinoIcons.person_2), label: 'Connections'),
      // BottomNavigationBarItem(
      //     icon: Icon(CupertinoIcons.person), label: 'Profile'),
      // BottomNavigationBarItem(
      //     icon: Icon(CupertinoIcons.settings), label: 'Settings')
      //   ]),
      //   tabBuilder: (BuildContext context, int index) {
      //     return screens[index];
      //   },
      // ),
      body: _screens[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
