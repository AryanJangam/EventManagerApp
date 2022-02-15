import 'package:flutter/material.dart';
import 'chatpage.dart';
import 'list1.dart';

class GroupChatRoom extends StatefulWidget {
  const GroupChatRoom({Key? key}) : super(key: key);

  @override
  State<GroupChatRoom> createState() => _GroupChatRoomState();
}

class _GroupChatRoomState extends State<GroupChatRoom> {
  List<list1> people = [
    list1("Table Tennis club", "assets/1.jfif"),
    list1("Chess club", "assets/2.jfif"),
    list1("IETE club", "assets/3.jfif"),
    list1("Codestorm", "assets/4.jfif"),
    list1("Codecell", "assets/codecell.png"),
    list1("Cricket club", "assets/6.jfif"),
    list1("Coders club", "assets/7.jfif"),
    list1("Hackerrank club", "assets/8.jfif"),
    list1("IETE club", "assets/9.jfif"),
    list1("OTC catchup", "assets/10.jfif"),

  ];
  @override
  Widget build(BuildContext context) {
    var size;
    int index = 4;
    return Scaffold(
      appBar: AppBar(
        // title: Text("GroupName"),
        backgroundColor: Color(0xff1A1A2E),
        // centerTitle: true,
        leading: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: CircleAvatar(
              backgroundImage: AssetImage(people[index].img),
              radius: 25,
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 100),
          child: Text(
            people[index].Title,
            style: TextStyle(
                color: Colors.greenAccent, fontWeight: FontWeight.bold),
          ),
        ),

        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      // backgroundColor: Color(0xff16213E),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 535, 8, 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Message!",
                  border: OutlineInputBorder(),
                  fillColor: Colors.blue[200],
                  filled: true,
                  suffixIcon: Icon(
                    Icons.send,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
