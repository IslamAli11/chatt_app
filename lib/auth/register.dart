  
   import 'package:chatt_app/auth/widget/custom_text_form.dart';
import 'package:chatt_app/chat_view.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterView> {
  var formKey = GlobalKey<FormState>();
   bool obscure= false;
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
                      'Create an account',
                      style: TextStyle(color: Colors.blue, fontSize: 24),
                    ),
                      const SizedBox(
                      height: 20,
                    ),
                    const CustomTExtFormField(
                      validatorTExt: 'Name',
                      text: 'Name',
                      prefixIcon: Icons.person,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomTExtFormField(
                      validatorTExt: 'Email',
                      text: 'Email',
                      prefixIcon: Icons.email,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                     CustomTExtFormField(
                      obscure: obscure,
                      validatorTExt: 'Password',
                      text: 'Password',
                      prefixIcon: Icons.lock,
                    suffixIcon:IconButton(onPressed: (){
                   setState(() {
                        obscure=!obscure;
                   });
                    },
                    icon:Icon(obscure?Icons.remove_red_eye:Icons.visibility_off),
                    )
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                       if(formKey.currentState!.validate()){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>const ChatView()));
                       }

                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(double.infinity, 50)),
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('You have an account'),
                        TextButton(onPressed: () {
                
                         Navigator.pop(context);
                
                        }, child: const Text('login')),
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
