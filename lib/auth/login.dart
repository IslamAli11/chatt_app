// ignore_for_file: prefer_const_constructors

import 'package:chatt_app/auth/register.dart';
import 'package:chatt_app/auth/widget/custom_text_form.dart';
import 'package:chatt_app/chat_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var formKey = GlobalKey<FormState>();
   bool obscure =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                        child: Image.asset(
                      'assets/chat.png',
                      height: 150,
                      width: 200,
                      color: Colors.blue,
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Login Your Account',
                      style: TextStyle(color: Colors.blue, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTExtFormField(
                      validatorTExt: 'Email',
                      text: 'Email',
                      prefixIcon: Icons.email,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                     CustomTExtFormField(
                      validatorTExt: 'password',
                      text: 'Password',
                      obscure: obscure,
                      prefixIcon: Icons.lock,
                      suffixIcon:IconButton(
                        onPressed: (){
                     setState(() {
                          obscure=!obscure;
                     });
                      },
                      icon:Icon(obscure?Icons.visibility_off:Icons.remove_red_eye),
                      )
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatView()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(double.infinity, 50)),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('You Do\'nt have an account'),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterView()));
                            },
                            child: const Text('Register Now')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
