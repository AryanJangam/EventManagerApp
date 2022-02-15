// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'package:event_managerr/pages/loginpage.dart';
import 'package:event_managerr/pages/wrapper.dart';
import 'package:event_managerr/service/auth.dart';
import 'package:event_managerr/widget/body.dart';
import 'package:event_managerr/widget/navigator_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chatroom/models/myuser.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      StreamProvider<MyUser?>.value(
        catchError: (_, __) => null,
        value: AuthService().user,
    initialData: null,
    child: MaterialApp( routes: {
      '/': (context) => Wrapper(),
    }),
  )

  );
}

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    appBar: AppBar(
    backgroundColor: Color(0xff1A1A2E),
    title: Container(
    padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
    child: Text('Eventer',
    style:TextStyle(
                color: Colors.white,
              )),
        ),

      ),
      backgroundColor: Colors.grey[300],
      body: HomeContent(),
      drawer: NavigatorDrawerWidget(),
    );
  }
}
