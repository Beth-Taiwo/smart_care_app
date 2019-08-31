import 'package:flutter/material.dart';
import 'dart:async';

//LoginPage import(s)
import 'login.dart';

//Firebase Authentication import
import 'package:firebase_auth/firebase_auth.dart';

//ProgressDialog import
import 'package:progress_dialog/progress_dialog.dart';

//Cloud FireStore import
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _signUpFormFormKey = new GlobalKey<FormState>();
  String _username;
  String _email;
  String _password;

  //Initializing ProgressDialog

  ProgressDialog pr;

  //Function to validate From

  bool validateAndSave() {
    final signUpForm = _signUpFormFormKey.currentState;
    if (signUpForm.validate()) {
      signUpForm.save();
      return true;
    } else {
      return false;
    }
  }

  //Asynchronous Method to SignUp user to Firebase Starts Here

  void validateAndSubmit() async {
    //Method Name is "validateAndSubmit"

    pr = new ProgressDialog(context, ProgressDialogType.Normal);

    if (validateAndSave()) {
      //Check if Form is Validated

      try {
        pr.show(); //ProgressDialog is shown when a request is being made

        //Signing Up user with Email and Password Starts Here

        FirebaseUser user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        user = await FirebaseAuth.instance.currentUser();

        //End of Signing Up user with Email and Password

        if (user != null) {
          //Check if current User is not equal to null

          //After the user Account is created successfully, update Firebase User displayName

          UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
          userUpdateInfo.displayName = _username;
          user.updateProfile(userUpdateInfo);
          user.reload(); //Running a reload on Users Profile

        /*  Firestore.instance.collection('users').document(user.uid).setData({
            //Create "users" table in your Firebase Database
            'uid': user.uid, //Adding "uid" to users table
            'email': user.email, //Adding "email" to users table
            'username': _username, //Adding "username" to users table
            'photourl':
                user.photoUrl.toString(), //Adding "photourl" to users table
            'isEmailVerified':
                user.isEmailVerified, //Adding "isEmailVerified" to users table
            'timestamp': DateTime.now()
                .toUtc()
                .millisecondsSinceEpoch, //Adding "timestamp" to users table
          });*/
          print(user); //Print in your IDE console to cross-check User details

          pr.hide(); //Hiding ProgressDialog after request has been made
          user.sendEmailVerification(); //This is an inbuilt "Firebase" Function called to send "Verification Email" to the User
          _showVerifyEmailSentDialog(); //Calling "Verify Email" Alert Dialog

        }
      } catch (e) {
        print(e);
        if (e.toString().contains("ERROR_NETWORK_REQUEST_FAILED")) {
          //Check for "Poor Connection"
          pr.hide(); //Hiding ProgressDialog after request has been made
          _nointernet(); //Calling "No internet" Alert Dialog

        } else if (e.toString().contains("ERROR_INVALID_EMAIL")) {
          //Check for "Invalid Email"
          pr.hide(); //Hiding ProgressDialog after request has been made
          _bfemail(); //Calling "Invalid Email" Alert Dialog

        } else if (e.toString().contains("ERROR_WEAK_PASSWORD")) {
          //Check for "Weak Password"
          pr.hide(); //Hiding ProgressDialog after request has been made
          _weakPassword(); //Calling "Weak Password" Alert Dialog

        } else if (e.toString().contains("ERROR_EMAIL_ALREADY_IN_USE")) {
          //Check for "Duplicate User"
          pr.hide(); //Hiding ProgressDialog after request has been made
          _duplicateUser(); //Calling "Email Already in use" Alert Dialog

        } else {}
      }
    }
  }

//Asynchronous Method to SignUp user to Firebase Ends Here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF006DAB),
        title: Text("Sign Up"),
      ),
      body: new Container(
        decoration: new BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(16.0),
        child: new Form(
            key: _signUpFormFormKey,
            child: new ListView(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //new FlightImageAsset(),
                new TextFormField(
                  decoration: new InputDecoration(
                      labelText: "Full Name",
                      icon: new Icon(
                        Icons.person,
                        color: Colors.grey,
                      )),
                  validator: (value) =>
                      value.isEmpty ? 'Full Name is Required' : null,
                  onSaved: (value) => _username = value,
                ),
                new TextFormField(
                  decoration: new InputDecoration(
                      labelText: "Email",
                      icon: new Icon(
                        Icons.email,
                        color: Colors.grey,
                      )),
                  validator: (value) =>
                      value.isEmpty ? 'Email is Required' : null,
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) => _email = value,
                ),
                new TextFormField(
                  decoration: new InputDecoration(
                      labelText: "Password",
                      icon: new Icon(
                        Icons.lock,
                        color: Colors.grey,
                      )),
                  validator: (value) =>
                      value.isEmpty ? 'Password is Required' : null,
                  onSaved: (value) => _password = value,
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                new RaisedButton(
                    child: new Text(
                      "SignUp",
                      style: new TextStyle(fontSize: 20.0),
                    ),
                    color: Color(0xFF006DAB),
                    elevation: 4.0,
                    onPressed: () {
                      //validateAndSubmit(); //Calling validateAndSubmit button onpress of SignUp button
                    }),
                FlatButton(
                  child: Text('Have an account? Login'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              ],
            )),
      ),
    );
  }

//Alert Dialog for "Badly Formatted Email" Starts Here

  Future<void> _bfemail() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, //User must tap button to close Alert Dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Email is Invalid'),
          content: Text('The Email Address is Badly Formatted'),
          actions: <Widget>[
            FlatButton(
              child: Text('Retry'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

//Alert Dialog for "Badly Formatted Email" Ends Here

  //Alert Dialog for "Weak Password" Starts Here

  Future<void> _weakPassword() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, //User must tap button to close Alert Dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Passwords is too short'),
          content: Text('The password must be 6 characters long or more.'),
          actions: <Widget>[
            FlatButton(
              child: Text('Retry'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //Alert Dialog for "Weak Password" Ends Here


  //Alert Dialog for "Duplicate User" Starts Here

  Future<void> _duplicateUser() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, //User must tap button to close Alert Dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Email Already In Use'),
          content: Text('The Email You Provided Is Already In Use.'),
          actions: <Widget>[
            FlatButton(
              child: Text('Dismiss'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //Alert Dialog for "Duplicate User" Ends Here

  //Alert Dialog for "Poor Internet Connection" Starts Here

  Future<void> _nointernet() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, //User must tap button to close Alert Dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Connectivity Lost'),
          content: Text('Reconnect to the Internet and Try again.'),
          actions: <Widget>[
            FlatButton(
              child: Text('Dismiss'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //Alert Dialog for "Poor Internet Connection" Ends Here

  //Alert Dialog for "Verify Email" Starts Here

  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Verify your account"),
          content: new Text("Link to verify account has been sent to your email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                _signUpFormFormKey.currentState.reset(); //Clearing Data in the Form
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

//Alert Dialog for "Verify Email" Ends Here



/*class FlightImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  var assetsImage = new AssetImage('images/firebase.png');
  var image = new Image(image: assetsImage);
  return new Container(child: image);
  }

  }*/
}
