import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../chats.dart';
import '../user_chat_screen.dart';

class Hello extends StatelessWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 100,
                width: 100,
              ),
              const Text(
                'Let\'s Chat',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w600),
              ),
              Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/hello.png',
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.lightBlueAccent),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => Chats()));
                  },
                  child: const Text('Let\'s Start',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
