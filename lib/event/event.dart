// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


Map<String,List<dynamic>> saved = {
  'title':[],
  'image':[],
  'event':[],
};

class Feed extends StatefulWidget {

  @override
  _FeedState createState() => _FeedState();
}


class _FeedState extends State<Feed> {


   bool pres=saved['title']!.contains("Chess Club");
   bool pres1=saved['title']!.contains("Coders Club");
   bool pres2=saved['title']!.contains("Codecell");
   bool pres3=saved['title']!.contains("Codestorm");
   bool pres4=saved['title']!.contains("TT Club");




  @override
  Widget build(BuildContext context) {

    pres = saved['title']!.contains("Chess Club");
    pres1=saved['title']!.contains("Coders Club");
    pres2=saved['title']!.contains("Codecell");
    pres3=saved['title']!.contains("Codestorm");
    pres4=saved['title']!.contains("TT Club");

    return  Scaffold(
      // backgroundColor: Colors.blueGrey,),
      appBar: AppBar(
        backgroundColor: Color(0xff1A1A2E),
        title: Padding(
          padding: const EdgeInsets.only(left: 100),
          child: Text(
            'Event',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
        // centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [Colors.white24, Colors.black26],
            //   begin: Alignment.topRight,
            //   end: Alignment.bottomLeft,
            // ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            iconSize: 30.0,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
            iconSize: 30.0,
          ),
        ],
      ),

      backgroundColor: Colors.grey[300],

      body:  SingleChildScrollView(
        child: Container(

            child: Column(
              children: <Widget>[
                Container(
                  height: 225.0,
                  width: 415.0,
                  child: Card(

                    color: Color(0xff1A1A2E),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    margin: EdgeInsets.fromLTRB(10, 13.0, 10, 8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/chess.jfif'),
                        radius: 20.0,

                      ),
                      title: Text(
                        "Chess Club",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 5,),
                            Text("Event - Chess Tournament",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 5,),
                            Text(
                              "Date - 22/10/21 - 25/10/21",
                              style: TextStyle(fontSize: 20.0, color: Colors.white),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Time - 1:00 PM",
                              style: TextStyle(fontSize: 20.0, color: Colors.white),
                            ),
                            SizedBox(height: 5,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                  setState(() {
                                    if(pres){
                                      saved['title']!.remove("Chess Club");
                                      saved['image']!.remove("assets/chess.jfif");
                                      saved['event']!.remove("Event - Chess Tournament");
                                    }
                                    else{
                                      saved['title']!.add("Chess Club");
                                      saved['image']!.add("assets/chess.jfif");
                                      saved['event']!.add("Event - Chess Tournament");
                                    }


                                  });
                                  },
                                  icon: pres  ? Icon(Icons.favorite):Icon(Icons.favorite_border) ,
                                  color: Colors.red,
                                ),


                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Container(
                  height: 225.0,
                  width: 415.0,
                  child: Card(

                    color: Color(0xff1A1A2E),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    margin: EdgeInsets.fromLTRB(10, 13.0, 10, 8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/co.png'),
                        radius: 20.0,

                      ),
                      title: Text(
                        "Coders Club",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 5,),
                            Text("Event - Hackathon",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 5,),
                            Text(
                              "Date - 1/12/21 - 5/12/21",
                              style: TextStyle(fontSize: 20.0, color: Colors.white),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Time - 11:00 AM",
                              style: TextStyle(fontSize: 20.0, color: Colors.white),
                            ),
                            SizedBox(height: 5,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if(pres1){
                                        saved['title']!.remove("Coders Club");
                                        saved['image']!.remove("assets/co.png");
                                        saved['event']!.remove("Event - Hackathon");

                                      }
                                      else{
                                        saved['title']!.add("Coders Club");
                                        saved['image']!.add("assets/co.png");
                                        saved['event']!.add("Event - Hackathon");
                                      }


                                    });
                                  },
                                  icon: pres1  ? Icon(Icons.favorite):Icon(Icons.favorite_border) ,
                                  color: Colors.red,
                                ),


                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Container(
                  height: 225.0,
                  width: 415.0,
                  child: Card(

                    color: Color(0xff1A1A2E),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    margin: EdgeInsets.fromLTRB(10, 13.0, 10, 8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/codecell.png'),
                        radius: 20.0,

                      ),
                      title: Text(
                        "Codecell",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 5,),
                            Text("Event - Hackathon",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 5,),
                            Text(
                              "Date - 13/11/21 - 16/11/21",
                              style: TextStyle(fontSize: 20.0, color: Colors.white),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Time - 3:00 PM",
                              style: TextStyle(fontSize: 20.0, color: Colors.white),
                            ),


                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if(pres2){
                                        saved['title']!.remove("Codecell");
                                        saved['image']!.remove("assets/codecell.png");
                                        saved['event']!.remove("Event - Hackathon");
                                      }
                                      else{
                                        saved['title']!.add("Codecell");
                                        saved['image']!.add("assets/codecell.png");
                                        saved['event']!.add("Event - Hackathon");
                                      }


                                    });
                                  },
                                  icon: pres2  ? Icon(Icons.favorite):Icon(Icons.favorite_border) ,
                                  color: Colors.red,
                                ),


                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Container(
                  height: 225.0,
                  width: 415.0,
                  child: Card(

                    color: Color(0xff1A1A2E),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    margin: EdgeInsets.fromLTRB(10, 13.0, 10, 8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/code.png'),
                        radius: 20.0,

                      ),
                      title: Text(
                        "Codestorm",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 5,),
                            Text("Event - CSS Competition",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 5,),
                            Text(
                              "Date - 25/10/21 - 30/10/21",
                              style: TextStyle(fontSize: 20.0, color: Colors.white),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Time - 3:30 PM",
                              style: TextStyle(fontSize: 20.0, color: Colors.white),
                            ),

                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if(pres3){
                                        saved['title']!.remove("Codestorm");
                                        saved['image']!.remove("assets/code.png");
                                        saved['event']!.remove("Event - CSS Competition");
                                      }
                                      else{
                                        saved['title']!.add("Codestorm");
                                        saved['image']!.add("assets/code.png");
                                        saved['event']!.add("Event - CSS Competition");
                                      }


                                    });
                                  },
                                  icon: pres3  ? Icon(Icons.favorite):Icon(Icons.favorite_border) ,
                                  color: Colors.red,
                                ),


                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Container(
                  height: 225.0,
                  width: 415.0,
                  child: Card(

                    color: Color(0xff1A1A2E),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    margin: EdgeInsets.fromLTRB(10, 13.0, 10, 8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/table.jfif'),
                        radius: 20.0,

                      ),
                      title: Text(
                        "TT Club",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 5,),
                            Text("Event - TT Knockouts",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 5,),
                            Text(
                              "Date - 15/10/21 - 20/10/21",
                              style: TextStyle(fontSize: 20.0, color: Colors.white),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Time - 1:00 PM",
                              style: TextStyle(fontSize: 20.0, color: Colors.white),
                            ),
                            SizedBox(height: 5,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if(pres4){
                                        saved['title']!.remove("TT Club");
                                        saved['image']!.remove("assets/table.jfif");
                                        saved['event']!.remove("Event - TT Knockouts");

                                      }
                                      else{
                                        saved['title']!.add("TT Club");
                                        saved['image']!.add("assets/table.jfif");
                                        saved['event']!.add("Event - TT Knockouts");
                                      }


                                    });
                                  },
                                  icon: pres4  ? Icon(Icons.favorite):Icon(Icons.favorite_border) ,
                                  color: Colors.red,
                                ),


                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),


              ],

            )),
      ),

    );

  }



}


class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}



class _FavouriteState extends State<Favourite> {




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.blueGrey,),
        appBar: AppBar(
          backgroundColor: Color(0xff1A1A2E),
          title: Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Text(
              'Event',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
          // centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   colors: [Colors.white24, Colors.black26],
              //   begin: Alignment.topRight,
              //   end: Alignment.bottomLeft,
              // ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              iconSize: 30.0,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications),
              iconSize: 30.0,
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: saved['title']!.length,
            itemBuilder: (context,index){
              return Container(
                height: 170.0,
                width: 415.0,
              child: Card(

                color: Color(0xff1A1A2E),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                margin: EdgeInsets.fromLTRB(10, 13.0, 10, 8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: Image.asset(saved['image']![index]).image,
                    radius: 20.0,

                  ),
                 title: SizedBox(
                   height: 53,
                   child: Text(saved['title']![index],
                       textAlign: TextAlign.center,
                       style: TextStyle(
                       fontSize: 40.0,
                       color: Colors.greenAccent,
                       fontWeight: FontWeight.bold),),
                 ),

                 subtitle:Column(
                   children: <Widget>[
                     Text(saved['event']![index], textAlign: TextAlign.center,
                         style: TextStyle(
                             fontSize: 22.0,
                             color: Colors.white,
                             fontWeight: FontWeight.bold)),
                     Container(
                       alignment: Alignment.bottomRight,
                       child: IconButton(
                         icon: Icon(Icons.remove_circle,
                             color: Colors.red, ),
                         onPressed: (){
                           setState(() {
                             saved['title']!.remove(saved['title']![index]);
                             saved['image']!.remove(saved['image']![index]);
                             saved['event']!.remove(saved['event']![index]);
                           });
                         },
                       ),
                     ),
                   ],
                 )

                ),
              ),);
            }
        ),
      ),
    );
  }
}

