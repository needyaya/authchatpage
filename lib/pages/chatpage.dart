import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import '../tools/button.dart';
import '../tools/chatcard.dart';
import '../main.dart';
import '../tools/textfield.dart';

class chat extends StatefulWidget {
  const chat({super.key});
  @override
  State<chat> createState() => _ChatState();
}

class _ChatState extends State<chat> {
  final messagecontroller = TextEditingController();
  List<MyMessageCard> messages = [
    MyMessageCard(
      message: 'ofcc',
      date: DateTime.now().subtract(const Duration(days: 1, minutes: 1)),
      user: true,
    ),
    MyMessageCard(
      message: 'tomorow',
      date: DateTime.now().subtract(const Duration(days: 4, minutes: 3)),
      user: false,
    ),
    MyMessageCard(
      message: 'hello',
      date: DateTime.now().subtract(const Duration(days: 3, minutes: 5)),
      user: true,
    ),
    MyMessageCard(
      message: 'yay',
      date: DateTime.now().subtract(Duration(days: 5, minutes: 1)),
      user: false,
    ),
    MyMessageCard(
      message: 'ofcc',
      date: DateTime.now().subtract(Duration(days: 9, minutes: 3)),
      user: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            flexibleSpace: SafeArea(
              child: Container(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                          scale: 1),
                      maxRadius: 20,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "THE DOORZ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Online",
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Stack(
            children: <Widget>[
              Expanded(
                  child: GroupedListView<MyMessageCard, DateTime>(
                elements: messages,
                groupBy: (message) => DateTime(
                    message.date.year, message.date.month, message.date.day),
                groupHeaderBuilder: (MyMessageCard message) => SizedBox(
                  height: 40,
                  child: Center(
                    child: Card(
                      color: Colors.pink,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          DateFormat.yMMMd().format(message.date).toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                itemBuilder: (context, MyMessageCard message) => Align(
                  alignment: message.user
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Card(
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(message.message),
                    ),
                  ),
                ),
              )),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.pink[200],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextField(
                          controller: messagecontroller,
                          decoration: const InputDecoration(
                              hintText: " message...",
                              hintStyle: TextStyle(color: Colors.black54),
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          print(messagecontroller.text);
                          String text = messagecontroller.text;
                          final message = MyMessageCard(
                              message: text, date: DateTime.now(), user: true);
                          setState(() => (messages.add(message)));
                          messagecontroller.clear();
                        },
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 18,
                        ),
                        backgroundColor: Colors.pink[200],
                        elevation: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
