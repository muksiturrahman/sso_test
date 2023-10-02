import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:sso_test/FacebookSignedIn.dart';
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
        title: Text('SSO Login',style: TextStyle(color: Colors.white),),
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
            SizedBox(height: 16.0),
            OutlinedButton.icon(
              onPressed: () {
                _facebookLogin();
              },
              icon: Icon(Icons.facebook),
              label: Text('Sign In with Facebook'),
            ),
          ],
        ),
      ),
    );
  }
  _facebookLogin() async {
    final fb = FacebookLogin();
    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    switch (res.status) {
      case FacebookLoginStatus.success:
        final FacebookAccessToken? accessToken = res.accessToken;
        final profile = await fb.getUserProfile();
        final imageUrl = await fb.getProfileImageUrl(width: 100);
        final email = await fb.getUserEmail();

        print('Access token: ${accessToken?.token}');
        print('Hello, ${profile?.name}! You ID: ${profile?.userId}');
        print('Your profile image: $imageUrl');

        if (profile!.name != null) {
          print('And your email is $email');
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              FacebookSignedIn(
                profileImage: imageUrl!,
                fbName: profile!.name!,
                // fbEmail: email!,
                fbId: profile.userId,
                fbAccessToken: accessToken!.token,
              )));
        }else{
          print('Error: Facebook data is missing');
        }
        break;
      case FacebookLoginStatus.cancel:
      // User cancel log in
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content : Text('Sign in Failed')));
        break;
      case FacebookLoginStatus.error:
      // Log in failed
        print('Error while log in: ${res.error}');
        break;
    }

  }
}
