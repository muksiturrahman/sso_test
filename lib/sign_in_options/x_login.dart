import 'package:flutter/material.dart';

class XSignIn extends StatelessWidget {
  const XSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Twitter SignedIn',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
      ),
      // body: ,
    );
  }
}
