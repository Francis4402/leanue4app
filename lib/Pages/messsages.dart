import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnue4service/Pages/chat_page.dart';
import 'package:learnue4service/Pages/profilepage.dart';


class Messsages extends StatelessWidget {
  const Messsages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: AppBar(
            title: const Text('Messages'),
            centerTitle: true,
            actions: [
              GestureDetector(
                onTap: (){Get.to(const ProfilePage());},
                  child: const CircleAvatar(child: Icon(Icons.person),))
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) =>
        ListTile(
          onTap: () {
            Get.to(const ChatPage());
          },
          leading: const Stack(
            children: [
              CircleAvatar(
                child: Icon(Icons.person),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.white,
                ),
              )
            ],
          ),
          title: const Text("Other User"),
          subtitle: const Text("Hi"),
          trailing: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black45,
                radius: 15,
                child: Text(
                  "10",
                  style: TextStyle(fontSize: 11),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text("20:50")
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, child: const Icon(Icons.add),),
    );
  }
}
