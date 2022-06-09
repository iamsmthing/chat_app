import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserChatScreen extends StatefulWidget {
  @override
  State<UserChatScreen> createState() => _UserChatScreenState();
}

class _UserChatScreenState extends State<UserChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(CupertinoIcons.phone)),
            IconButton(
                onPressed: () {}, icon: const Icon(CupertinoIcons.videocam))
          ],
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new)),
          title: const Text('Rishu'),
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color.fromARGB(153, 138, 219, 219)),
              child: const ListTile(
                title: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Message'),
                ),
                leading: Icon(
                  Icons.emoji_emotions,
                  color: Colors.lightBlueAccent,
                ),
                trailing: Icon(
                  Icons.send,
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
          ),
        ));
  }
}
