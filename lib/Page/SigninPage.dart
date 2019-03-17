import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:solve_with_think/AuthManager.dart';
import 'package:solve_with_think/Page/AticleListPage.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {


  @override
  Widget build(BuildContext context) {

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Emails',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
//        Navigator.of(context).pushNamed(HomePage.tag);
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );
    final googleButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          AuthManager().instance().handleSignIn()
              .then((FirebaseUser user) {
                if(user == null){
                  //TODO:: Fail Login With Google
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AticleListPage()),
                  );
                }else{
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AticleListPage()),
                  );
                }
          })
              .catchError((e) => print( "Error C0de => $e" ));
        },
        color: Colors.redAccent,
        child: Text('Log In with Google', style: TextStyle(color: Colors.white)),
      ),
    );
    final facebookButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
//          Navigator.of(context).pushNamed(HomePage.tag);
        },
        color: Colors.blueAccent,
        child: Text('Log In with Facebook', style: TextStyle(color: Colors.white)),
      ),
    );




    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          SizedBox(height: 48.0),
          email,
          SizedBox(height: 8.0),
          password,
          SizedBox(height: 24.0),
          loginButton,
          forgotLabel,
          googleButton,
          facebookButton
        ],
      ),
    )
        ],
      ),
    );
  }


}
