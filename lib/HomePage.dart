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
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   actions: [
      //     FloatingActionButton(onPressed: () async{
      //       await GoogleSignInApi.logOut();
      //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInPage()));
      //     },
      //       child: Text('LogOut'),
      //     ),
      //   ],
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoUrl!),
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
