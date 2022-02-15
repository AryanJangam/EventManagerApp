import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_managerr/service/auth.dart';
import 'package:event_managerr/shared/loading.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {

  late final Function toggleView;
  SignupPage({required this.toggleView} );


  @override
  _SignupPageState createState() => _SignupPageState();
}
class _SignupPageState extends State<SignupPage> {
  final _formkey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();

  bool loading =false;
  String error ='';
  bool press = true;
  String email='';
  String password='' ;
  var username='';
  @override
  Widget build(BuildContext context) {
    return loading?Loading():Scaffold(
        backgroundColor: Color(0xff16213e),
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formkey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                        child: Center(
                          child: Text(
                            'Signup',
                            style: TextStyle(
                                color: Colors.blue[200],
                                fontSize: 70.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 35, left: 40, right: 40),
                    child: Column(
                      children: <Widget>[
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
                        SizedBox(height: 10.0),
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
                              return "Enter at least 6 character";
                            }

                            return null;
                          },
                          onChanged: (value){
                            setState(() {
                              password= value;
                            });
                          },
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            fillColor: Colors.grey[200],
                            filled: true,
                            labelText: 'Username',

                            prefixIcon: Icon(Icons.email),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Username cannot be empty";
                            }
                            else if(value.length>14){
                              return "Enter at most 14 characters";
                            }
                            return null;
                          },

                          onChanged: (value){
                            setState(() {
                             username= value;
                            });
                          },
                        ),
                        SizedBox(height: 10.0),

                        SizedBox(height: 40.0),
                        Container(
                            height: 40.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(18.0),
                              color: Colors.blue[200],
                              elevation: 0.0,
                              child: Container(
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
                                      dynamic result = await _auth.registerWithEmailAndPassword(email,password,username);

                                      if(result ==null ){
                                        setState(() {
                                          error='Already registered or please supply a valid email';
                                          loading=false;
                                        });

                                      }
                                    }
                                  },

                                  color: Colors.blue[200],
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(height: 20.0),

                        Container(
                          height: 40.0,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 2.0),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(18.0)),
                            child: InkWell(
                              onTap: () {
                               widget.toggleView();
                              },
                              child: Center(
                                child: Text('Go Back',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12,),

                        Text(error,
                        style: TextStyle(color: Colors.white,
                        fontSize: 14.0),
                        ),
                      ],
                    )),
              ]),
        ));
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