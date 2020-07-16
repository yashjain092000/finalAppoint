import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth_form_appointer.dart';

class AuthScreenAppointer extends StatefulWidget {
  @override
  _AuthScreenAppointerState createState() => _AuthScreenAppointerState();
}

class _AuthScreenAppointerState extends State<AuthScreenAppointer> {
  //final _auth = FirebaseAuth.instance;

  var _isLoading = false;
  void _submitAuthForm(
    String email,
    String password,
    String username,
    String phn,
    String address,
    String specialisation,
    String fee,
    String emFee,
    int morTime1,
    int morTime2,
    int eveTime1,
    int eveTime2,
    bool isLogin,
    BuildContext ctx,
  ) async {
    //AuthResult authResult;

    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        print("in Auth form's isLogin");
        // authResult = await _auth.signInWithEmailAndPassword(
        //   email: email,
        //   password: password,
        // );
      } else {
        print("in Auth form's isLogin's Else");
        // authResult = await _auth.createUserWithEmailAndPassword(
        //   email: email,
        //   password: password,
        // );
        // await Firestore.instance
        //     .collection('users')
        //     .document(authResult.user.uid)
        //     .setData({
        //   'username': username,
        //   'email': email,
        // });
      }
    } on PlatformException catch (err) {
      var message = 'An error occurred, please check your credentials!';

      if (err.message != null) {
        message = err.message;
      }

      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      print(err);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthFormAppointer(
        _submitAuthForm,
        _isLoading,
      ),
    );
  }
}
