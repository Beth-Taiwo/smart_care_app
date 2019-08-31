import 'package:flutter/material.dart';
import 'dart:async';


class PasswordReset extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _PasswordReset();

}

class _PasswordReset extends State<PasswordReset> {

  final formKey = new GlobalKey<FormState>();
  String _email;

  //Initializing ProgressDialog

  //ProgressDialog pr;

  // Check if form is valid before perform login

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    else {
      return false;
    }
  }


  // TODO: write something reallyy important


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xFF006DAB),
        title: Text("Reset Password"),
      ),
      body: new Container(
        decoration: new BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(16.0),
        child: new Form(
            key: formKey,
            child: new ListView(
              children: <Widget>[
                //new FlightImageAsset(),
                new TextFormField(
                  decoration: new InputDecoration(labelText: "Email",
                      icon: new Icon(Icons.email, color: Colors.grey,)),
                  validator: (value) =>
                  value.isEmpty
                      ? 'Email is Required'
                      : null,
                  onSaved: (value) => _email = value,
                ),
                SizedBox(height: 20.0),
                new RaisedButton(
                  child: new Text(
                    "SUBMIT", style: new TextStyle(fontSize: 20.0),),
                  color: Color(0xFF006DAB),
                  elevation: 4.0,
                  onPressed: () {
                    //_validateAndSubmit(); //Calling validateAndSubmit button onpress of SUBMIT button
                  },
                ),
              ],
            )),
      ),
    );
  }


//TODO: do something here


/*class FlightImageAsset extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  var assetsImage = new AssetImage('images/firebase.png');
  var image = new Image(image: assetsImage);
  return new Container(child: image);
  }

  }*/
}