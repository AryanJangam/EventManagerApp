// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:event_managerr/chatroom/list1.dart';
import 'chatpage1.dart';

class GroupChatHomeScreen extends StatefulWidget {
  @override
  _GroupChatHomeScreenState createState() => _GroupChatHomeScreenState();
}

class _GroupChatHomeScreenState extends State<GroupChatHomeScreen> {
  List<list1> people = [
    list1("Table Tennis club", "table.jfif"),
    list1("Chess club", "chess.jfif"),
    list1("IETE club", "3.jfif"),
    list1("Codestorm", "code.png"),
    list1("Codecell", "codecell.png"),
    list1("Cricket club", "cricket.jpg"),
    list1("Hackerrank club", "hac.jpg"),
    list1("Cultural club", "cul.jfif"),
    list1("IETE club", "9.jfif"),
    list1("OTC catchup", "catchup.jfif"),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Groups"),
        backgroundColor: Color(0xff1A1A2E),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => GroupChatRoom()));
                  },
                  leading: Container(
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/${people[index].img}'),
                      radius: 25,
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: Text(
                      people[index].Title,
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  tileColor: Color(0xff1A1A2E),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
        onPressed: () {},
        tooltip: "Create Group",
      ),
    );
  }
}
