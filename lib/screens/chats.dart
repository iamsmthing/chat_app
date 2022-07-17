import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letschat/screens/user_chat_screen.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 243, 243),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('chats').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error Occured'),
            );
          }
          if (snapshot.hasData) {
            return CustomScrollView(
              slivers: [
                const CupertinoSliverNavigationBar(
                  largeTitle: Text('Chats'),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    snapshot.data!.docs.map(
                      (DocumentSnapshot document) {
                        Map<String, dynamic>? data =
                            document.data() as Map<String, dynamic>?;
                        //return Text(data!['text']);
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => UserChatScreen()));
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, top: 15, bottom: 15),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Row(
                                children: [
                                  CircleAvatar(child: Text(data!['name'][0])),
                                  const SizedBox(width: 7.0),
                                  Column(
                                    children: [
                                      Text(
                                        data['name'],
                                        style: const TextStyle(fontSize: 22.0),
                                      ),
                                      Text(data['text'],
                                          style:
                                              const TextStyle(fontSize: 14.0)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
