
import 'package:auth/pages/chatpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


import '../pages/auth.dart';
import '../pages/chatpage.dart';
import '../pages/signin.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final user = FirebaseAuth.instance.currentUser!;


  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signUserOut,
      child: const Text('sign Out '),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[200],
          actions: [
            IconButton(
              onPressed: signUserOut,
              icon: Icon(Icons.logout),
            )
          ],
          title: const Text(
            'ayas world ',
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 10),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            "Conversations",
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 2, bottom: 2),
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.pink[50],
                            ),
                            child: Row(
                              children: const <Widget>[
                                Icon(
                                  Icons.add,
                                  color: Colors.pink,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SafeArea(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => chatpage(
                            email: "aya",
                          ),
                        ));
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 10, bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                                maxRadius: 30,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.transparent,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Text(
                                        'groupchat',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
              ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.pink[200],
          unselectedItemColor: Colors.grey.shade600,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Chats",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo),
              label: "pictures",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: "Profile",
            ),
          ],
        ),
      ),
    );

    ;
  }
}
