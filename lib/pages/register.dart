import 'package:flutter/material.dart';
import '../pages/signin.dart';
import '../pages/signup.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //show login page
  bool showLoginPage = true;
//between signin and register
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
 
  Widget build(BuildContext context) {
  if (showLoginPage){
    return Home(onTap: togglePages,);
  }
  else{
    return SignupPage(onTap: togglePages
      
    );
  }
  }
}
