import 'package:event_managerr/chatroom/models/myuser.dart';
import 'package:event_managerr/main.dart';

import 'package:event_managerr/pages/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser?>(context);

    if(user==null){
      return Authenticate();
    }else{
      return HomePage();
    }
  }
}
