import 'package:besafe/presentation/screens/home/home.dart';
import 'package:besafe/presentation/screens/welcome_login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget{
  const Auth({super.key});
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges() ,
        builder:((context, snapshot) {
          if(snapshot.hasData){
            return const HomePage();
          }else{
            return const LogIn();
          }
        }),
        ),
    );
  }
}