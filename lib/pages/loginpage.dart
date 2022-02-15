import 'package:event_managerr/main.dart';
import 'package:event_managerr/pages/authenticate/reset.dart';
import 'package:event_managerr/pages/register.dart';
import 'package:event_managerr/service/auth.dart';
import 'package:event_managerr/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {


   final Function toggleView;
  LoginScreen({required this.toggleView});



  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {



  final _formkey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();
  bool loading =false;
  bool press = true;
  String email='';
  String password='';
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
                  Text(
                    'Login',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 60.0,
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
                    height: 20,
                  ),
                  TextFormField(

                    keyboardType: TextInputType.visiblePassword,
                    obscureText: press,
                    decoration: InputDecoration(
                      fillColor: Colors.grey[200],
                      filled: true,
                      labelText: 'Password',

                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(

                        onPressed: (){

                          setState(() {
                            press = !press;
                          });
                        }, icon: icon(),
                      ),

                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      } else if (value.length < 6) {
                        return "Enter at least 6 characters";
                      }

                      return null;
                    },
                    onChanged: (value){
                      setState(() {
                        password= value;
                      });

                    },

                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ResetScreen()));
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.4),
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
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
                        if(_formkey.currentState!.validate()){
                          setState(() {
                            loading=true;
                          });
                          dynamic result = await _auth.signInWithEmailAndPassword(email,password);
                          if(result ==null ){
                          setState(() {
                            error='Could not sign in invalid email id or password';
                            loading=false;
                          });

                          }
                        }
                        },

                      color: Colors.blue[200],
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '''Don't have an account? ''',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 16.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                         widget.toggleView();
                        },
                        child: Text('Register Now',
                            style: TextStyle(color: Colors.blue[200])),
                      ),

                    ],
                  ),
                  SizedBox(height: 8,),
                  Text(error,
                    style: TextStyle(color: Colors.white,
                        fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget icon(){

     if(press){
      return Icon(Icons.visibility_off);
    }
    else{
     return Icon(Icons.remove_red_eye_sharp);
    }

  }

}
