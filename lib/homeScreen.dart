import 'package:flutter/material.dart';
import 'package:smart_care/login.dart';
import 'package:smart_care/admin_login.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      /*appBar: new AppBar(
        title: new Text('HomeScreen'),
      ),*/
      body: homeScreenApp(),
    );
  }
}

class homeScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        canvasColor: Color(0xFF006DAB),
        fontFamily: 'Roboto',
        /*appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.white,
        ),*/
      ),
      home: MyHomePage(),
    );

  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            new Stack(
              // mainAxisAlignment: MainAxisAlignment.center,
              alignment: Alignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 100.0, bottom: 0.0),
                  child: new Text(
                    "Please tell us why you’re here.",
                    style: new TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),

              ],
            ),
            new Column(
               mainAxisAlignment: MainAxisAlignment.start,
             // alignment: Alignment.bottomLeft,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, right: 180.0),
                  child: new Text(
                    "i...",
                    style: new TextStyle(fontSize: 55.0, color: Colors.white),
                  ),
                ),
              ],
            ),

            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 60.0, right: 60.0, top: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                      },
                      child: new Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          decoration: new BoxDecoration(
                            //color: Color(0xFF18D191),
                              color: Color(0xFFCCFFF3),
                              borderRadius: new BorderRadius.circular(34.0)),
                          child: new Text("Want to Request Care",
                              style: new TextStyle(
                                  fontSize: 22.0, color: Color(0xFF115378)))),
                    ),
                  ),
                )
              ],
            ),


            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 60.0, right: 60.0, top: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => adminLogin(),
                            ));
                      },
                      child: new Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          decoration: new BoxDecoration(
                            //color: Color(0xFF18D191),
                              color: Color(0xFFBEE8FF),
                              borderRadius: new BorderRadius.circular(34.0)),
                          child: new Text("Am an Admin",
                              style: new TextStyle(
                                  fontSize: 21.0, color: Color(0xFFCD0000)))),
                    ),
                  ),
                )
              ],
            ),

            new Stack(
              // mainAxisAlignment: MainAxisAlignment.center,
              //alignment: Alignment.topRight,
              children: <Widget>[
                new Container(
                  margin: new EdgeInsets.only(left: 250.0, top: 180.0),
                  height: 60.0,
                  width: 60.0,
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(50.0),
                      color: Color(0xFFCD0000)),
                  child: new Icon(
                    Icons.phone_in_talk,
                    color: Colors.white,
                  ),

                ),
                new Container(
                  margin: new EdgeInsets.only(left: 1.0, top: 200.0),
                  
                    child:new Text("in a hurry? Call the hospital...",
                        style: new TextStyle(
                            fontSize: 20.0, color: Color(0xFFCCFFF3))),),
                ],),




              ],
            ),

      ),
        );


  }
}
