import 'package:event_managerr/main.dart';
import 'package:event_managerr/pages/register.dart';
import 'package:event_managerr/service/auth.dart';
import 'package:event_managerr/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ResetScreen extends StatefulWidget {


  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {


  final _formkey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();
  bool loading =false;
  String email='';
  String msg='';
  String error='';

  @override
  Widget build(BuildContext context) {
    return loading?Loading():Scaffold(
      backgroundColor:Color(0xff16213E),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 50, 30, 20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Text(msg,style: TextStyle(color: Colors.white,
                      fontSize: 13,),),
                  SizedBox(height: 30,),
                  Text(
                    'Reset Password',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 43.0,
                        color: Colors.blue[200]),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(

                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      fillColor: Colors.grey[200],
                      filled: true,
                      labelText: 'Email Address',

                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email Id cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value){

                      setState(() {
                        email= value;
                      });
                    },


                  ),


                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: MaterialButton(
                      onPressed: () async{
                        try {
                          error ='';
                          if (_formkey.currentState!.validate()) {
                            await FirebaseAuth.instance.sendPasswordResetEmail(
                                email: email).then((value) =>
                            {
                              setState(() {
                                msg = 'A reset link has been send to $email';
                              }),


                            });
                          }

                          }  on FirebaseAuthException catch (e){
                          msg='';
                          setState(() {
                            error = e.toString();
                          });

                        }
                      },

                      color: Colors.blue[200],
                      child: Text(
                        'Send Request',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: MaterialButton(
                      onPressed: () {

                     Navigator.of(context).pop(ResetScreen());
                      },

                      color: Colors.blue[200],
                      child: Text(
                        'Go back',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),

                    ),

                  ),
                  SizedBox(height: 30,),
                  Text(error,style: TextStyle(color: Colors.white,
                    fontSize: 13,
                  ),textAlign:TextAlign.justify,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
