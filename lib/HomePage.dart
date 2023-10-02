import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sso_test/SigninPage.dart';
import 'package:sso_test/api/google_signin_api.dart';

class HomePage extends StatelessWidget {
  final GoogleSignInAccount user;
  HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google SignedIn',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            user.photoUrl != null ?
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.photoUrl!),
            ) : CircleAvatar(
              radius: 50,
              child: Icon(Icons.person,size: 80,),
            ),
            SizedBox(height: 8,),
            Text('Name: ' + user.displayName!,style: TextStyle(color: Colors.black,fontSize: 15),),
            SizedBox(height: 8,),
            Text('Email: ' + user.email!, style: TextStyle(color: Colors.black, fontSize: 15),),
            SizedBox(height: 8,),
            ElevatedButton(
              onPressed: () async{
                await GoogleSignInApi.logOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInPage()));
              },
              child: Text('LogOut'),
            ),
          ],
        ),
      ),
    );
  }
}
