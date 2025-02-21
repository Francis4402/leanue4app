import 'package:flutter/material.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({super.key});

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login'), centerTitle: true,),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/chat_image.png", scale: 2,),
              const SizedBox(height: 30),
              ElevatedButton(onPressed: (){}, child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/googleicon.png", scale: 15,),
                  const SizedBox(width: 15,),
                  const Text('Sign in with Google', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                ],
              ))
            ],
          ),
        ),
      )
    );
  }
}
