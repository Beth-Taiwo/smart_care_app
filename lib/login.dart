import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'home.dart';
//import 'package:smart_care_application/homeScreen.dart';


import 'SignUpPage.dart';

//PasswordReset Page import(s)
import 'passwordReset.dart';


class LoginPage extends StatefulWidget {
  //LoginPage({Key key, this.auth}) : super(key: key);

  //final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _loginFormKey = new GlobalKey<FormState>();
  String _email;
  String _password;

//  //Initializing ProgressDialog
//
//  ProgressDialog pr;


  // Check if Form is Valid Before Performing Login

  bool validateAndSave() {
    final form = _loginFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    else {
      return false;
    }
  }

// Todo: We are missing something in our code, something very very important


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      /*appBar: new AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF006DAB),
        title: Text("Login"),
      ),*/

      body: new Container(
        decoration: new BoxDecoration(color: Color(0xFF006DAB)),
        padding: EdgeInsets.all(16.0),
        child: new Form(

            key: _loginFormKey,
            child: new ListView(
              children: <Widget>[


                new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                //  margin: const EdgeInsets.only(top: 100.0,bottom: 0.0),
                  // alignment: Alignment.bottomLeft,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 150.0,
                          bottom: 20.0
                      ),
                      child: new Text(
                        "Login",
                        style: new TextStyle(fontSize: 55.0, color: Color(0XFFCCFFF3)),
                      ),
                    ),
                  ],
                ),


                // new FlightImageAsset(),
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Email",
                    //icon: new Icon(Icons.email, color: Colors.grey,)
                  ),
                  style: new TextStyle(

                    color: Colors.white,
                  ),
                  validator: (value) => value.isEmpty ? 'Email is Required' : null,
                  onSaved: (value) => _email = value,
                ),
                new TextFormField(
                  decoration: new InputDecoration(labelText: 'Password',
                      //icon: new Icon(Icons.lock, color: Colors.grey,)
                  ),
                  validator: (value) =>
                  value.isEmpty
                      ? 'Password is Required'
                      : null,
                  onSaved: (value) => _password = value,
                  obscureText: true,
                ),
                SizedBox(height: 20.0),


                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      child: new Text(
                          '...forgot Password?',
                          style: new TextStyle(
                            decoration: TextDecoration.underline,
                            fontStyle: FontStyle.italic,
                          ),
                      ),
                      padding: const EdgeInsets.only(
                        right: 30.0,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PasswordReset()),
                        );
                      },
                    ),
                    new RaisedButton(
                        child: new Text(
                          "Log me in",
                          style: new TextStyle(
                            fontSize: 20.0,
                            color: Color(0XFFCD0000),
                          ),
                        ),

                        color: Color(0xFFCCFFF3),
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                        elevation: 0.0,
                        padding: const EdgeInsets.only(
                          top: 15.0,
                          bottom: 15.0,
                          right: 60.0,
                          left: 60.0
                        ),
                        onPressed: () {
                          //validateAndSubmit ();
                        }
                    ),

                  ],
                ),

                new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 160.0
                        )
                      ),
                      FlatButton(
                        child: Text('No Account? Click here to Register'),

                        onPressed: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUpPage()),
                          );
                        },
                      ),
                    ]
                ),
              ],
            )),
      ),
    );
  }



/*class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.blue, //or set color with: Color(0xFF0000FF)
    ));
    return MaterialApp(
        title: 'Contacts App',
        theme: ThemeData(
          canvasColor: Color(0xFF006DAB),
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Login"),

                //backgroundColor: Colors.blue,
               // elevation: 0.0,
                iconTheme: new IconThemeData(color: Colors.white)
            ),

            body: LoginForm()
        )
    );
  }
}

// Create a Login Form Widget
class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class _LoginFormState extends State<LoginForm> {

  // Todo: We are missing something in our code, something very very important

  String validatePassword(String value) {
    if (value.isEmpty || value.length < 6) {
      return "Your password should contain a minimum of 6 characters";
    }

    return null;
  }

  // Create a global key of type FormState that uniquely identifies
  // the Form widget and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    final Form form = Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: ListView(
            children: <Widget>[
              */ /* Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Image(
                    image: AssetImage("assets/flutter_logo.png"),
                    fit: BoxFit.contain, height: 80.0),
              )
            ), */ /*
              Text("Please provide your login credentials below"),
              TextFormField(
                keyboardType: TextInputType.emailAddress, // this helps us to control the keyboard type
                decoration: InputDecoration(
                    hintText: "Email"
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Your email is required";
                  }

                  return null;
                },
              ),
              TextFormField(
                obscureText: true, // this makes the text not visible
                decoration: InputDecoration(
                    hintText: "Password"
                ),
                validator: validatePassword,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                // top margin
                child: RaisedButton(
                  child: Text("Login", style: TextStyle(
                      fontSize: 20, color: Color(0xFF000000)
                  ),),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false
                    // otherwise.
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, display a Snackbar.
                      // Scaffold.of(context).showSnackBar(SnackBar(content: Text("Logging in")));

                      // Navigate to a new page
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return HomePage();
                          })
                      );
                    }
                  },
                ),
              ),
          ],
          ),
        )
    );

    return form;
  }
}*/

//class MainPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Main Page"),
//      ),
//      body: Center(
//          child: Text('Welcome', style: TextStyle(fontSize: 30.0),)
//      ),
//    );
//  }
//}

/*new Scaffold(
      appBar: new AppBar(
          backgroundColor:Colors.transparent,
          elevation: 0.0,
          iconTheme: new IconThemeData(color: Colors.white)),
      body: Container(
       // width: double.infinity,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            */ /*new StakedIcons(),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 80.0),
                  child: new Text(
                    "Quick Bee",
                    style: new TextStyle(fontSize: 30.0),
                  ),
                )
              ],
            ),*/ /*
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: new TextField(
                decoration: new InputDecoration(labelText: 'Email'),
              ),
            ),
            new SizedBox(
              height: 15.0,
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: new TextField(

                obscureText: true,
                decoration: new InputDecoration(labelText: 'Password'),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 5.0, top: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => HomePage()
                        ));
                      },
                      child: new Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          decoration: new BoxDecoration(
                              color: Color(0xFFCCFFF3),
                              borderRadius: new BorderRadius.circular(9.0)),
                          child: new Text("Login",
                              style: new TextStyle(
                                  fontSize: 20.0, color: Colors.red))),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 20.0, top: 10.0),
                    child: new Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        child: new Text("Forgot Password?",
                            style: new TextStyle(
                                fontSize: 17.0, color: Color(0xFF18D191)))),
                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );

  };
}*/
}