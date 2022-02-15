// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'package:event_managerr/service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}


class _HomeContentState extends State<HomeContent> {

  final AuthService  _auth =AuthService();

  User? user= FirebaseAuth.instance.currentUser;

  @override

  Widget build(BuildContext context) {



    return SingleChildScrollView(
      child: Container(
          margin: EdgeInsets.all(17),
          child: Column(
            children: <Widget>[

              buildCard(),
              SizedBox(
                height: 15,
              ),

              Buildcard2(),

            ],

          )),
    );
  }

  Widget buildCard() => Card(

        shadowColor: Colors.grey[900],
        color: Color(0xff1A1A2E),
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(

                      ' Hey! \n "Welcome to the Eventer"',

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.4,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3,

                      ),

                    ),
                  ),
                ),

                Wrap(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 120,
                      width: 140,
                      child: Image.network(
                        'https://thumbs.dreamstime.com/b/event-planning-working-desk-notebook-events-word-computer-pencil-notepad-clock-concept-98612010.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 8, 0, 0),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(1, 15, 1, 10),
                        height: 150,
                        width: 190,
                        child: Text(
                          'A android application for the committees, committee members and students. Events will have reminders and will be properly scheduled. Committee members can plan events and assign task to members. Also chat forum for feedback .',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.453,
                            fontWeight: FontWeight.w900,
                            wordSpacing: 0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );

  Widget Buildcard2() => SingleChildScrollView(
        child: Column(
          children: [
            Card(
              shadowColor: Colors.grey[900],
              color: Color(0xff1A1A2E),
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
                height: 285,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: ListView(
                    children: [
                      Text(
                        'A glimpse of some of the previous events and workshops held.',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.2,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 100,
                        child: Card(
                          color: Colors.white,
                          child: Center(
                            child: ListTile(
                              leading: Image.network(
                                'https://miro.medium.com/max/1400/1*Wjxx83j-qyiNvFBy1yOA1w.jpeg',
                              ),
                              title: Text(
                                'Git Workshop',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                'Git basic - The Basics of Git and GitHub.',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 100,
                        child: Card(
                          color: Colors.white,
                          child: ListTile(
                            leading: Image.network(
                              'https://www.datamation.com/wp-content/uploads/2021/10/artificial-intelligence-g48cb9bf7d_1920-768x512.jpg',
                            ),
                            title: Text(
                              'AI Workshop',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              'An overall overview of many concepts, and algorithms in machine learning.',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 100,
                        child: Card(
                          color: Colors.white,
                          child: Center(
                            child: ListTile(
                              leading: Image.network(
                                'https://www.usnews.com/dims4/USNEWS/df20dec/2147483647/thumbnail/303x202/quality/85/?url=http%3A%2F%2Fmedia.beam.usnews.com%2F1c%2F7f%2F495e5f284c5b935bfc7e55deb2f3%2Finvestinggrapharrowsup.jpg',
                              ),
                              title: Text(
                                'Pull up your stocks',
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                'Use your investment skills to win prizes.',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 110,
                        child: Card(
                          color: Colors.white,
                          child: Center(
                            child: ListTile(
                              leading: Image.network(
                                'https://www.advats.com/wp-content/uploads/2021/05/investment.jpg',
                              ),
                              title: Text(
                                'Investment for Students',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                '100 rupees is often sufficient to get started with investing.',
                                style: TextStyle(
                                  fontSize: 13.65,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
