import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSignedIn extends StatefulWidget {
  final String profileImage;
  final String fbName;
  // final String fbEmail;
  final String fbId;
  final String fbAccessToken;

  const FacebookSignedIn({super.key, required this.profileImage, required this.fbName, required this.fbId, required this.fbAccessToken});

  @override
  State<FacebookSignedIn> createState() => _FacebookSignedInState();
}

class _FacebookSignedInState extends State<FacebookSignedIn> {

  bool isLoggedIn = false;
  Map _userObj = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook SignedIn',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.profileImage),
            radius: 40,
          ),
          SizedBox(height: 10,),
          Text(widget.fbName, style: TextStyle(fontWeight: FontWeight.bold),),
          Text(widget.fbId),
          SizedBox(height: 10,),
          Text(widget.fbAccessToken),
        ],
      ),
    );
  }
}
