
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnue4service/services/bottom_navbar.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.off(() => const MainBottomNavbarScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Welcome to Learn Ue4'),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('1.0.0'),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
