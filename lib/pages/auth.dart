import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../pages/signin.dart';
import '../pages/register.dart';
import '../pages/home.dart';
import '../pages/chatpage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return MyHomePage(
             
            );
          }

          // user is NOT logged in
          else {
            return RegisterPage();
          }
        },
      ),
    );
  }
}
