import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:theatrical_plays/pages/Home.dart';
import 'package:theatrical_plays/using/AuthorizationStore.dart';
import 'package:theatrical_plays/using/Constants.dart';
import 'package:theatrical_plays/using/MyColors.dart';

import 'SignInScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: deprecated_member_use
        brightness: Brightness.dark,
        title: Text(
          'Theatrical analytics',
          style: TextStyle(color: MyColors().cyan),
        ),
        backgroundColor: MyColors().black,
      ),
      backgroundColor: MyColors().black,
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              // Container(
              //     alignment: Alignment.center,
              //     padding: const EdgeInsets.all(10),
              //     child: Text(
              //       'Theatrical analytics',
              //       style: TextStyle(
              //           color: MyColors().cyan,
              //           fontWeight: FontWeight.w500,
              //           fontSize: 20),
              //     )),
              // Divider(color: MyColors().white),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Log in with a user',
                    style: TextStyle(fontSize: 20, color: MyColors().cyan),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  style: TextStyle(color: MyColors().cyan),
                  controller: emailController,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: MyColors().cyan),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors().cyan)),
                      labelText: 'Username',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: MyColors().cyan))),
                  cursorColor: MyColors().cyan,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  style: TextStyle(color: MyColors().cyan),
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: MyColors().cyan),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors().cyan)),
                      labelText: 'Password',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: MyColors().cyan))),
                  cursorColor: MyColors().cyan,
                ),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: MyColors().gray,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            side: BorderSide(color: MyColors().cyan)),
                        textStyle: TextStyle(color: MyColors().cyan)),
                    child: Text(
                      'Login',
                      style: TextStyle(color: MyColors().cyan),
                    ),
                    onPressed: () {
                      doLogin(emailController.text, passwordController.text);
                    },
                  )),
              Row(
                children: <Widget>[
                  Text(
                    'Does not have account?',
                    style: TextStyle(color: MyColors().white),
                  ),
                  TextButton(
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20, color: MyColors().cyan),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              )
            ],
          )),
    );
  }

  doLogin(email, password) async {
    try {
      Uri uri = Uri.parse(
          "http://${Constants().hostName}:8080/api/users/login?email=$email&password=$password");
      Response response =
          await get(uri, headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        AuthorizationStore.writeToStore(
            'authorization', response.headers['authorization']);
        if (AuthorizationStore.getStoreValue('authorization') != null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        }
      } else if (response.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Wrong credentials",
            textAlign: TextAlign.center,
          ),
        ));
      }
    } on Exception {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Error to login. Check internet connection and VPN.",
          textAlign: TextAlign.center,
        ),
      ));
    }
  }
}
