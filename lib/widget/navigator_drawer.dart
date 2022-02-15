// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'package:event_managerr/chatroom/chatpage.dart';
import 'package:event_managerr/event/event.dart';
import 'package:event_managerr/pages/register.dart';
import 'package:event_managerr/pages/user_page.dart';
import 'package:event_managerr/service/auth.dart';
import 'package:event_managerr/todo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class NavigatorDrawerWidget extends StatefulWidget {

  @override
  State<NavigatorDrawerWidget> createState() => _NavigatorDrawerWidgetState();
}

class _NavigatorDrawerWidgetState extends State<NavigatorDrawerWidget> {
   SignupPage sg= SignupPage(toggleView: (){});

   final AuthService  _auth =AuthService();

   User? user= FirebaseAuth.instance.currentUser;

  get username => user!.displayName;

  get emaill => user!.email;

   @override
  Widget build(BuildContext context) {

    final urlImage =
        'https://t4.ftcdn.net/jpg/02/15/84/43/240_F_215844325_ttX9YiIIyeaR7Ne6EaLLjMAmy4GvPC69.jpg';
    return Drawer(

      child: Material(
        color: Color(0xff1A1A2E),
        child: ListView(

          children: <Widget>[

            buildTop(

              name: username,
              email: emaill,
             
              onClicked: () { Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserPage(

                  name: username,
                  urlImage: urlImage,

                ),
              ));

              }
            ),

            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: <Widget>[
                  Divider(color: Colors.grey[200]),

                  const SizedBox(height: 5.0),
                  buildMenu(
                    text: 'Event',
                    icon: Icons.preview,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 2.0),
                  buildMenu(
                    text: 'Favourite',
                    icon: Icons.favorite,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 2.0),
                  buildMenu(
                    text: 'To Do',
                    icon: Icons.remember_me_outlined,
                    onClicked: () => selectedItem(context, 2),
                  ),

                  const SizedBox(height: 2.0),
                  buildMenu(
                    text: 'Chatbox',
                    icon: Icons.chat,
                    onClicked: () => selectedItem(context, 0),
                  ),


                  Divider(color: Colors.grey[200]),
                  const SizedBox(height: 5.0),
                 ListTile(

                        hoverColor:  Color(0xffC996CC),
                        onTap:()async{
                          await _auth.signOut();

                        } ,
                        leading: Icon(Icons.logout,
                          color:  Colors.white,),
                        title: Text('Logout',
                          style: TextStyle(color:  Colors.white,
                              fontSize: 16),
                          textAlign: TextAlign.left,
                        )

                  ),



                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTop({
    required var name,
    required var email,
    required VoidCallback onClicked,
  }) =>
      InkWell(

        onTap: onClicked,
        child: Container(
          padding: EdgeInsets.fromLTRB(25, 20, 10, 10),
          child: Row(
            children: [
              SizedBox(width: 5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),

                  ),
                  const SizedBox(height: 6),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget buildMenu(
      {required String text,
      required IconData icon,
      required VoidCallback? onClicked}) {
    final color = Colors.white;
    final hoverColor = Color(0xffC996CC);

    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  Widget buildSearchField() {
    final color = Color(0xffC996CC);

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => GroupChatHomeScreen(),
        ));
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Feed()));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MyApp()));
        break;
        case 3:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Favourite()));
    }
  }
}
