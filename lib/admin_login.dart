import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'home.dart';

//PasswordReset Page import(s)
import 'passwordReset.dart';


class adminLogin extends StatefulWidget {
  //LoginPage({Key key, this.auth}) : super(key: key);

  //final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _adminLoginState();
}

class _adminLoginState extends State<adminLogin> {

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
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF006DAB),
        title: Text("Login"),
      ),
      body: new Container(
        decoration: new BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(16.0),
        child: new Form(
            key: _loginFormKey,
            child: new ListView(
              children: <Widget>[
                // new FlightImageAsset(),
                new TextFormField(
                  decoration: new InputDecoration(labelText: "Email",
                      icon: new Icon(Icons.email, color: Colors.grey,)),
                  validator: (value) =>
                  value.isEmpty
                      ? 'Email is Required'
                      : null,
                  onSaved: (value) => _email = value,
                ),
                new TextFormField(
                  decoration: new InputDecoration(labelText: 'Password',
                      icon: new Icon(Icons.lock, color: Colors.grey,)),
                  validator: (value) =>
                  value.isEmpty
                      ? 'Password is Required'
                      : null,
                  onSaved: (value) => _password = value,
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                new RaisedButton(
                    child: new Text(
                      "Login", style: new TextStyle(fontSize: 20.0),),
                    color: Color(0xFF006DAB),
                    elevation: 4.0,
                    onPressed: () {
                      //validateAndSubmit ();
                    }
                ),
                FlatButton(
                  child: Text('Forgot Password?'),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PasswordReset()),
                    );
                  },
                ),
              ],
            )),
      ),
    );
  }
}