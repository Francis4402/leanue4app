import 'package:appwrite/appwrite.dart';
import 'package:appwrite/enums.dart';
import 'package:flutter/material.dart';

import '../controller/appwrite_controller.dart';

class PhoneLogin extends StatelessWidget {
  const PhoneLogin({super.key});

  void loginWithOAuth() async {
    try {
      Account account = Account(client);
      final session =
          await account.createOAuth2Session(provider: OAuthProvider.google);
      print('OAuth Login Successful: $session');
    } catch (e) {
      print('OAuth Login Failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50,),
            Image.asset('assets/chat_image.png'),
            const SizedBox(height: 60),

            ElevatedButton(onPressed: loginWithOAuth, style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ), child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/googleicon.png', width: 24, height: 24,),
                const SizedBox(width: 10,),
                const Text('Sign in with Google', style: TextStyle(fontSize: 16),),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
