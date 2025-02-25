import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnue4service/Pages/messsages.dart';
import 'package:learnue4service/Pages/phone_login.dart';
import 'package:learnue4service/app.dart';
import 'package:learnue4service/controller/bottom_navbar_controller.dart';
import 'package:learnue4service/utils/app_colors.dart';

class MainBottomNavbarScreen extends StatefulWidget {
  const MainBottomNavbarScreen({super.key});

  @override
  State<MainBottomNavbarScreen> createState() => _MainBottomNavbarScreenState();
}

class _MainBottomNavbarScreenState extends State<MainBottomNavbarScreen> {
  final MainBottomNavbarController _navbarController = Get.put(MainBottomNavbarController());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _screens = const [
    HomePage(),
    Messsages(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      // Open the drawer from the right when "More" is tapped
      _scaffoldKey.currentState?.openEndDrawer();
    } else {
      _navbarController.changeIndex(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the scaffold key
      body: GetBuilder<MainBottomNavbarController>(builder: (controller) {
        return _screens[controller.selectedIndex];
      }),
      bottomNavigationBar: GetBuilder<MainBottomNavbarController>(builder: (controller) {
        return BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),
          ],
        );
      }),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey),
              child: Center(child: Text('More Options', style: TextStyle(color: Colors.white, fontSize: 20))),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Login'),
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(() => const PhoneLogin(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 300));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('About'),
                    onTap: () {
                      Navigator.pop(context);

                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
