import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sso_test/HomePage.dart';

import 'api/google_signin_api.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  Future signIn() async {
    final user = await GoogleSignInApi.login();
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content : Text('Sign in Failed')));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage(user: user)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google SignIn'),
        centerTitle: true,
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {},
              child: Text('Sign In'),
            ),
            SizedBox(height: 16.0),
            OutlinedButton.icon(
              onPressed: () {
                signIn();
              },
              icon: Icon(Icons.account_circle),
              label: Text('Sign In with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
