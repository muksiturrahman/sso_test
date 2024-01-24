import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sso_test/SigninPage.dart';
import 'package:sso_test/api/google_signin_api.dart';

class GoogleSignIn extends StatelessWidget {
  final GoogleSignInAccount user;
  const GoogleSignIn({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google SignedIn',style: TextStyle(color: Colors.white),),
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
            ) : const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person,size: 80,),
            ),
            const SizedBox(height: 8,),
            Text('Name: ' + user.displayName!,style: const TextStyle(color: Colors.black,fontSize: 15),),
            const SizedBox(height: 8,),
            Text('Email: ' + user.email!, style: const TextStyle(color: Colors.black, fontSize: 15),),
            const SizedBox(height: 8,),
            ElevatedButton(
              onPressed: () async{
                await GoogleSignInApi.logOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const SignInPage()));
              },
              child: const Text('LogOut'),
            ),
          ],
        ),
      ),
    );
  }
}
